select x.tert as x_tert,
       x.cod_client as x_cod_client,
       x.nume_client as x_nume_client,
       x.adresa_detaliat as x_adresa_detaliat,
       x.telefon_particulari as telefon_particulari,
       x.contact_unitati as contact_unitati,
       x.localitate_detaliat as x_localitate_detaliat,
       case
         when round(sum(x.sold), 2) is null then
          0
         else
          round(sum(x.sold), 2)
       end as x_valoare_sold,
       count(x.nr_doc) as x_nr_facturi,
       x.cod_ui as x_cod_ui

  from (select distinct 
               t.id as tert,
               t.cod as cod_client,
               t.nume as nume_client,      
                decode(t.nr,null,s.denumire,s.denumire||' Nr.'||ltrim(t.nr))||
                decode(t.bloc,null,'',' Bl.'||ltrim(t.bloc))||
                decode(t.scara,null,'',' Sc.'||ltrim(t.scara))||
                decode(t.etaj,null,'',' Et.'||ltrim(t.etaj))||
                decode(t.apart,null,'',' Ap.'||ltrim(t.apart))||
                decode(t.rest_adresa,null,'',' '||chr(10)||ltrim(t.rest_adresa)) adresa_detaliat,
               t.tel telefon_particulari,
               persoane_contact_terti (t.id) AS contact_unitati,
               t.cod_postal || ' ' || t.judet || ' ' || t.localitate localitate_detaliat, 
               st.sold_lei as sold,
               st.nr_doc,
               st.data_emiterii_doc as data_emiterii,
               u.cod as cod_ui
        
          from terti               t,
               solduri_tert        st,
               unitati_ierarhice   u,
               strazi              s,
               contracte_furnizare cf,
               grupuri_de_masura gm, rute r
        
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
           and cf.activ = 'D'
                      
           and t.id = gm.tert_id
           and cf.id = gm.contrfurn_id
           --and gm.tipgrupmas_cod = 'AR'
           --and gm.activ = 'D'
           and gm.ruta_cod = r.cod
           and (:ruta = gm.ruta_cod or :ruta = '%')
           
           and t.clascli_cod like :p_clascli 
           and u.cod like :p_codui
           
           and exists (select 1 from utilizatori_unitate uu where uu.unitier_cod = u.cod and uu.usercros_nume = user) 
           and exists (select 1 from grupuri_de_masura gm where gm.tert_id = t.id and (:p_carnet is null or gm.carnet = :p_carnet))
           and exists (select 1 from
                         (select soldt.tert_id tert, sum(soldt.sold) sold from solduri_tert soldt 
                           where soldt.tip = 'FP' and soldt.in_sold(+) = 'D' and soldt.cont_cont(+) like '411%' and soldt.data_emiterii_doc + to_number(:zile_vechime) < sysdate
                            group by soldt.tert_id
                             having (case when :sold_vechi = 'DA' then
                             (select to_number(pret_normal) from niveluri_pret where articol_cod = 'APA' and sysdate between valabil_de_la and valabil_pana_la) else 0 end) < round(sum(soldt.sold),2)
                             ) so where t.id = so.tert(+))
           and not exists (select * from terti te where te.id in   
                                              (select distinct locuri.tert from
                                               (select lc.tert_id tert, count(distinct(lc.nr)) locuri from locuri_consum lc group by lc.tert_id) locuri,
                                               (select od.tert_id tert, count(distinct(od.loccons_nr)) locuri from ordine_deconectare od 
                                                  where od.aprobat_dec = 'D' and od.executat_dec = 'D' and od.aprobat_rec = 'N' and od.executat_rec = 'N' and od.anulat = 'N' group by od.tert_id) ordine
                                                     where locuri.tert = ordine.tert and locuri.locuri = ordine.locuri)   
                                                       and te.id = t.id)  
     
        ) x

group by x.tert,
          x.cod_client,
          x.nume_client,
          x.adresa_detaliat,
          x.localitate_detaliat,
          x.telefon_particulari,
          x.contact_unitati,
          x.cod_ui
          
  having round(sum(x.sold),2) > (select to_number(pret_normal) from niveluri_pret where articol_cod = 'APA' and sysdate between valabil_de_la and valabil_pana_la)
    order by x_cod_client