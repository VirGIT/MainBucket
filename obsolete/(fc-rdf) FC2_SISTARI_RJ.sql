select t.cod,
       t.nume,
       x.debite,
       z.penalitati,
       round(months_between(wtert.data_dec, x.data_doc) + 1, 0) nr_luni,
       x.nr_facturi nr_facturi,
       lc_cons_sist_rj(wtert.idtert,
                       wtert.data_dec,
                       :p_aprobat_dec,
                       :p_anulat,
                       'D') adresa,
       trunc(wtert.data_dec) data_propusa,
       wtert.note_dec,
       t.unitier_cod
       --, wtert.loc, wtert.contr, wtert.serv, wtert.activa, wtert.nr

  from (select distinct odc.tert_id idtert, odc.data_dec, max(odc.note_dec) note_dec--, odc.loccons_nr loc, odc.contrfurn_id contr, co.servfurn_nr serv, c.activa, c.nr
         
           from ordine_deconectare odc, contracte_furnizare cf, contorizari co, conditii_furnizare c
         
          where
         
       cf.id = odc.contrfurn_id
       and cf.activ = 'D'
       and cf.inchis = 'N'
       
       and co.contrfurn_id = odc.contrfurn_id
       and co.loccons_nr = odc.loccons_nr
       and c.contrfurn_id = odc.contrfurn_id
       and c.loccons_nr = odc.loccons_nr
       and c.servfurn_nr = co.servfurn_nr
         
       and odc.aprobat_dec = :p_aprobat_dec
       and odc.executat_rec = 'N'
       and odc.anulat = :p_anulat
       and odc.executat_dec = :p_executat_dec
         
          group by odc.tert_id, odc.data_dec, odc.loccons_nr, odc.contrfurn_id, co.servfurn_nr, c.activa, c.nr
          having c.activa = 'D' and c.nr = (select max(con.nr) from conditii_furnizare con where con.contrfurn_id = odc.contrfurn_id and con.loccons_nr = odc.loccons_nr) 
         
         ) wtert,
       
       (select r.tert_id,
               r.cod,
               r.nume,
               round(sum(r.sold), 2) debite,
               min(r.data_doc) data_doc,
               count(r.factura) nr_facturi
          from (select tert.cod,
                       tert.nume || ' - ' || tert.strada || ' ' || tert.nr nume,
                       soldtert.id sldid,
                       soldtert.nr_doc factura,
                       soldtert.data_doc,
                       tert.unitier_cod sector,
                       soldtert.tert_id,
                       soldtert.valoare_lei valoare,
                       soldtert.sold_lei sold,
                       soldtert.tip
                  from terti        tert,
                       solduri_tert soldtert,
                       
                       (select distinct od1.tert_id idtert
                          from ordine_deconectare od1
                         where od1.aprobat_dec = 'D'
                           and od1.executat_rec = 'N'
                           and od1.anulat = 'N'
                           and od1.executat_dec = 'D') od_tert
                 where tert.id = od_tert.idtert
                   and tert.id = soldtert.tert_id
                   and soldtert.tip = 'FP'
                   and soldtert.in_sold = 'D'
                   and soldtert.cont_cont like '411%'
                   and tert.cod like :p_clascli_cod
                   and tert.unitier_cod like :unitate) r
         group by r.tert_id, r.cod, r.nume) x,
       (select y.tert_id, round(sum(y.sold), 2) penalitati
          from (select a.tert_id, a.sold_lei sold
                  from solduri_tert      a,
                       facturi_furnizare b,
                       terti             t,
                       
                       (select distinct od1.tert_id idtert
                          from ordine_deconectare od1
                         where od1.aprobat_dec = 'D'
                           and od1.executat_rec = 'N'
                           and od1.anulat = 'N'
                           and od1.executat_dec = 'D') od_tert
                 where a.tert_id = od_tert.idtert
                   and b.id = a.idorg
                   and a.tert_id = b.tert_id
                   and t.id = a.tert_id
                   and t.cod like :p_clascli_cod
                   and t.unitier_cod like :unitate
                   and ((b.anulata = 'N' and a.tip in ('PL', 'PP') and
                       a.in_sold = 'D' and not exists
                        (select 1
                            from articole_facturate af
                           where af.factfurn_id = a.idorg
                             and af.tert_id = a.tert_id
                             and af.soldtert_id_notif = a.id)) or
                       (sign(a.sold) != 0 and a.tip = 'PFP'))
                
                union all
                
                select st.tert_id,
                       case
                         when st.in_sold = 'D' and st.tip = 'FP' and
                              st.cont_cont = '461.01' then
                          st.sold_lei
                         else
                          round(cros_fact.valoare_penalizare(st.id,
                                                             trunc(sysdate)),
                                2)
                       end sold
                  from solduri_tert st,
                       terti t,
                       (select distinct od1.tert_id idtert
                          from ordine_deconectare od1
                         where od1.aprobat_dec = 'D'
                           and od1.executat_rec = 'N'
                           and od1.anulat = 'N'
                           and od1.executat_dec = 'D') od_tert
                
                 where t.id = od_tert.idtert
                   and t.id = st.tert_id
                   and t.cod like :p_clascli_cod
                   and t.unitier_cod like :unitate
                   and st.tip = 'FP'
                   and ((sign(sold) <> 0 and
                       round(cros_fact.valoare_penalizare(st.id,
                                                            trunc(sysdate)),
                               2) <> 0) or
                       (st.in_sold = 'D' and st.tip = 'FP' and
                       st.cont_cont = '461.01'))
                
                ) y
         group by tert_id) z,
       terti t
 where wtert.idtert = z.tert_id(+)
   and wtert.idtert = x.tert_id(+)
   and wtert.idtert = t.id
   and t.cod like :p_clascli_cod
   and t.unitier_cod like :unitate

 order by data_propusa, t.unitier_cod
