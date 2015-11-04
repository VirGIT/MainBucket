/*
toti abonatii necontorizati
*/
SELECT DISTINCT gm.tipgrupmas_cod,str.denumire,STR.LOCALITATE, 
             cf.NR,gm.loccons_nr,TT.NUME,gm.numar,trim(str.localitate)||' - '||trim(gm.UNITIER_COD) lc,
             trim(str.denumire)||' ,nr. '||trim(gm.numar) adresa,V.VALOARE nr_persoane,V.ATRIB_COD,cz.tipcz_cod
    FROM contorizari cz, 
         grupuri_de_masura gm, 
         contracte_furnizare cf, 
         strazi str ,
             TERTI TT,
             VALORI_ATRIBUT V,
             conditii_furnizare CFR 
   WHERE ( cz.tipcz_cod = 'PAUBAR' OR cz.tipcz_cod = 'PAUFIX') 
             AND CF.TERT_ID=TT.ID
             AND CFR.ATRIB_ID=V.ID AND V.ATRIB_COD='PERS'  
       AND CFR.contrfurn_id = cz.contrfurn_id 
                         AND CFR.loccons_nr = cz.loccons_nr 
                         AND CFR.servfurn_nr = cz.servfurn_nr 
                        AND cfr.nr=(select max(nr) from conditii_furnizare cf1 
                                                               where cfR.contrfurn_id=cf1.contrfurn_id 
                                                               and cfR.loccons_nr=cf1.loccons_nr 
                                                               and cfR.servfurn_nr=cf1.servfurn_nr 
                                                               and cf1.activa='D' and cf1.validata='D' 
                                                               group by cf1.contrfurn_id,cf1.loccons_nr,cf1.servfurn_nr)
             AND EXISTS ( SELECT 1 
                    FROM contracte_furnizare 
                   WHERE id = cz.contrfurn_id AND activ = 'D' AND inchis = 'N' /*AND nr like 'P%'*/) 
     AND NOT EXISTS ( SELECT 1 
                        FROM conditii_furnizare 
                       WHERE contrfurn_id = cz.contrfurn_id 
                         AND loccons_nr = cz.loccons_nr 
                         AND servfurn_nr = cz.servfurn_nr 
                         AND nr = cz.condfurn_nr 
                         AND activa = 'N' 
                         AND validata = 'D') 
     AND NOT EXISTS ( SELECT 1 
                        FROM conditii_furnizare 
                       WHERE contrfurn_id = cz.contrfurn_id  
                         AND loccons_nr = cz.loccons_nr 
                         AND servfurn_nr = cz.servfurn_nr 
                         AND nr > cz.condfurn_nr 
                         AND activa = 'N' 
                         AND validata = 'D') 
     AND NOT EXISTS ( SELECT 1 
                        FROM contorizari 
                       WHERE contrfurn_id = cz.contrfurn_id 
                         AND loccons_nr = cz.loccons_nr 
                         AND servfurn_nr = cz.servfurn_nr 
                         AND condfurn_nr > cz.condfurn_nr 
                         AND tipcz_cod LIKE 'CZ%') 
     AND gm.id = cz.grupmas_id 
--     AND (   :p_strada = '%' 
--          OR gm.strada = :p_strada 
--         ) 
     AND gm.tipgrupmas_cod <> 'CAN' 
     AND cf.id = cz.contrfurn_id 
    AND (STR.JUDET=tt.JUDET
    AND STR.LOCALITATE=tt.LOCALITATE AND str.cod = tt.strada_cod) 
     AND (EXISTS ( SELECT 1 
                        FROM terti t, contracte_furnizare cf 
                       WHERE cf.id = cz.contrfurn_id 
                         AND t.id = cf.tert_id ) 
         )  
ORDER BY 
--cf.nr,str.localitate,str.denumire
STR.LOCALITATE, str.denumire
/*
toti abonatii necontorizati
*/
