select x.tert as x_tert,
       x.cnp as x_cnp,
       x.cod_client as x_cod_client,
       x.nume_client as x_nume_client,
       x.adresa_detaliat as x_adresa_detaliat,
       x.localitate_detaliat as x_localitate_detaliat,
       case
         when round(sum(x.sold), 2) is null then
          0
         else
          round(sum(x.sold), 2)
       end as x_valoare_sold,
       case
         when round((penx.sold), 2) is null then
          0
         else
          round((penx.sold), 2)
       end as x_penalitati,
       count(x.nr_doc) as x_nr_facturi,
       x.cod_ui as x_cod_ui,
       x.cod_den_ui as x_den_ui,
       cros_ad.nume_complet(user) x_responsabili_consum,

       ( select foto from semnaturi_rj where unitier_cod = rajac_pkg.get_ui_rel_cod(x.cod_ui, 'BIR_COM') and sysdate between de_la and nvl(la, sysdate) ) semnatura_birou,
       nvl(( select nume from semnaturi_rj where unitier_cod = rajac_pkg.get_ui_rel_cod(x.cod_ui, 'BIR_COM') and sysdate between de_la and nvl(la, sysdate) ),x.cod_ui) nume_birou,
       ( select foto from semnaturi_rj where unitier_cod = 'DIR_GEN' and sysdate between de_la and nvl(la, sysdate) ) semnatura_dir_gen,
       ( select nume from semnaturi_rj where unitier_cod = 'DIR_GEN' and sysdate between de_la and nvl(la, sysdate) ) nume_dir_gen

  from (select distinct 
               t.id as tert,
               t.cnp as cnp,
               t.cod as cod_client,
               t.nume as nume_client,      
                decode(t.nr,null,s.denumire,s.denumire||' Nr.'||ltrim(t.nr))||
                decode(t.bloc,null,'',' Bl.'||ltrim(t.bloc))||
                decode(t.scara,null,'',' Sc.'||ltrim(t.scara))||
                decode(t.etaj,null,'',' Et.'||ltrim(t.etaj))||
                decode(t.apart,null,'',' Ap.'||ltrim(t.apart))||
                decode(t.rest_adresa,null,'',' '||chr(10)||ltrim(t.rest_adresa)) adresa_detaliat,
               t.cod_postal || ' ' || t.judet || ' ' || t.localitate localitate_detaliat,
               st.sold_lei as sold,
               st.nr_doc,
               u.cod as cod_ui,
               u.cod || ' - ' || u.denumire as cod_den_ui,
               u.responsabili_consum as responsabili_consum
        
          from terti               t,
               solduri_tert        st,
               unitati_ierarhice   u,
               strazi              s,
               contracte_furnizare cf
        
         where t.id = st.tert_id(+)
           and st.tip = 'FP'
           and st.in_sold(+) = 'D'
           and st.cont_cont(+) like '411%'
           and t.unitier_cod = u.cod
           and u.activa = 'D'
           and (:p_cod is null or upper(t.cod) like upper(:p_cod))
              
           and cf.tert_id = t.id
           and cf.judet = s.judet
           and cf.localitate = s.localitate
           and cf.strada_cod = s.cod
           
           and exists ( select 1 from utilizatori_unitate uu where uu.unitier_cod = u.cod and uu.usercros_nume = user ) 
        
        ) x,
       
       (select tert_id, sum(penal) sold
          from (
                select tert_id, sum(sold) penal
                  from (select st.tert_id, st.sold
                           from solduri_tert st, facturi_furnizare ff
                          where st.sold <> 0
                            and st.idorg = ff.id
                            and st.tip = 'PFP'
                            and exists (select 1 from contracte_furnizare cf
                                 where cf.tert_id = st.tert_id and (:p_cod is null or upper(cf.nr) like upper( :p_cod)))  )
                 group by tert_id
                union
                select tert_id, sum(sold) penal
                  from (select st.tert_id, st.sold_lei sold
                          from solduri_tert st
                         where st.in_sold = 'D'
                           and st.tip = 'FP'
                           and st.cont_cont = '461.01'
                           and exists ( select 1 from contracte_furnizare cf
                                 where cf.tert_id = st.tert_id and (:p_cod is null or upper(nr) like upper(:p_cod)) ))
                        
                 group by tert_id
                 )
         group by tert_id
        
        ) penx

where x.tert = penx.tert_id (+)

group by x.tert,
          x.cnp,
          x.cod_client,
          x.nume_client,
          x.adresa_detaliat,
          x.localitate_detaliat,
          case
            when round((penx.sold), 2) is null then
             0
            else
             round((penx.sold), 2)
          end,
          x.cod_ui,
          x.cod_den_ui
