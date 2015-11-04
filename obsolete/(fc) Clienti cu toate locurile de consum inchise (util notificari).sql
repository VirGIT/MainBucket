select * from terti te where te.id in   
(select distinct locuri.tert from
 (select lc.tert_id tert, count(distinct(lc.nr)) locuri from locuri_consum lc group by lc.tert_id) locuri,
 (select od.tert_id tert, count(distinct(od.loccons_nr)) locuri from ordine_deconectare od where od.aprobat_dec = 'D' and od.executat_dec = 'D' and od.aprobat_rec = 'N' and od.executat_rec = 'N' and od.anulat = 'N' group by od.tert_id) ordine
     where locuri.tert = ordine.tert and locuri.locuri = ordine.locuri)