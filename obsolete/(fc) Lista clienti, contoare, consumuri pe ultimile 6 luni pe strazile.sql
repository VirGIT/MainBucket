/* -- VERIFICARE NUME STRAZI
select cod, denumire from strazi where cod in (
'11590','11770','13230','13240','15550','15560','15570','15925','10440','15902','11100','11210','12870','15410','13080','16310','16320','16330','16340','16350','13650','13990','13995')
*/
select t.cod, t.nume, af.loccons_nr, lc.localitate, s.denumire strada, lc.nr_strada nr, con.tipcont_cod, con.regcont_cod, sum(af.cantitate) cons_6luni
  from parametri_furnizare pf1, conditii_furnizare cf, contoare con, grupuri_de_masura gm, locuri_consum lc, terti t, unitati_ierarhice ui, perioade_facturare pf, articole_facturate af, perioade_facturare p, strazi s
 where lc.unitier_cod = ui.cod(+)
   and exists (select 1
          from servicii_furnizate sf
         where sf.contrfurn_id = cf.contrfurn_id
           and sf.loccons_nr = cf.loccons_nr
           and sf.nr = cf.servfurn_nr
           and sf.tipserv_cod in ('APA', 'AIN'))
   and cf.nr = (select max(nr)
                  from conditii_furnizare cf2
                 where cf2.contrfurn_id = cf.contrfurn_id
                   and cf2.loccons_nr = cf.loccons_nr
                   and cf2.servfurn_nr = cf.servfurn_nr
                   and cf2.data <= pf.la)
   and pf1.parcontr_cod = 'PROCAN'
   and pf1.contrfurn_id = cf.contrfurn_id
   and pf1.condfurn_nr = cf.nr
   and pf1.loccons_nr = cf.loccons_nr
   and pf1.servfurn_nr = cf.servfurn_nr
   and pf1.tiptarif_cod = cf.tiptarif_cod
   and t.id = lc.tert_id
   and lc.contrfurn_id = cf.contrfurn_id
   and lc.nr = cf.loccons_nr
   and cf.data <= pf.la
   and pf.perioada = :p_perioada
   and pf.perioada = p.perioada
 --and lc.unitier_cod in ('S7P','S7A','S8P','S8A','S11P','S11A','S13P','S13A','S21P','S21P') and lc.unitier_cod = 'S7P'
   and lc.tert_id = gm.tert_id
   and lc.contrfurn_id = gm.contrfurn_id
   and lc.nr = gm.loccons_nr
   and con.grupmas_id = gm.id
   and con.tipcont_cod <> 'EMITRADIO'
   and s.cod in
       ('11590','11770','13230','13240','15550','15560','15570','15925','10440','15902','11100','11210','12870','15410','13080','16310','16320','16330','16340','16350','13650','13990','13995')
   and af.articol_cod in ('APA', 'AIN')
   and af.data_contabila <= p.la
   and af.data_contabila > add_months(p.la, -7)
   and af.contrfurn_id = cf.contrfurn_id
   and af.loccons_nr = cf.loccons_nr
   and af.servfurn_nr = cf.servfurn_nr
   and cf.nr = af.condfurn_nr
   and lc.judet = s.judet
   and lc.localitate = s.localitate
   and lc.strada_cod = s.cod
 group by t.cod, t.nume, af.loccons_nr, lc.localitate, s.denumire, lc.nr_strada, con.tipcont_cod, con.regcont_cod

 order by 5, 1
