select

 ui.cod ui,
 t.cod,
 T.UNITIER_COD ui_tert,
 t.nume,
 lc.JUDET,
 lc.localitate,
 str.DENUMIRE || ' ' || lc.NR_STRADA || ' ' || lc.BLOC || ' ' ||
 lc.REST_ADRESA adresa,
 lc.NR loc_consum,
 pf.VALOARE PROCAN
  from parametri_furnizare pf,
       conditii_furnizare  cf,
       terti               t,
       unitati_ierarhice   ui,
       LOCURI_CONSUM       lc,
       strazi              str,
       contracte_furnizare cfr
 where cf.nr =
       (select max(nr)
          from conditii_furnizare cf1
         where cf.contrfurn_id = cf1.contrfurn_id
           and cf.loccons_nr = cf1.loccons_nr
           and cf.servfurn_nr = cf1.servfurn_nr
           and cf.ACTIVA = 'D'
           and cf.VALIDATA = 'D'
         group by cf1.contrfurn_id, cf1.loccons_nr, cf1.servfurn_nr)
      
   and cfr.tert_id = t.id and cfr.id = cf.contrfurn_id
      
   and lc.UNITIER_COD = ui.cod
      
   and lc.CONTRFURN_ID = cf.CONTRFURN_ID
   and lc.NR = cf.LOCCONS_NR
      
   and pf.CONTRFURN_ID = cf.CONTRFURN_ID
   and pf.condfurn_nr = cf.nr
   and pf.LOCCONS_NR = cf.LOCCONS_NR
   and pf.SERVFURN_NR = cf.SERVFURN_NR
   and PF.TIPTARIF_COD = CF.TIPTARIF_COD
   and pf.PARCONTR_COD = 'PROCAN'
   AND PF.VALOARE <> 0
      
   and str.COD = lc.STRADA_COD
   and LC.JUDET = STR.JUDET
   and LC.LOCALITATE = STR.LOCALITATE
   and t.id = lc.TERT_ID
   and cf.ATRIB_ID <> 0