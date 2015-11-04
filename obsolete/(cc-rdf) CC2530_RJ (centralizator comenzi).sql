SELECT c.unitier_cod,
       ui.denumire,
       c.nr,
       c.data_starecom,
       t.cod,
       t.nume,
       lc.articol_cod,
       lc.cantitate,
       lc.cota_tva,
       lc.pret * lc.cantitate valoare_cu_tva,
       (lc.pret * lc.cantitate) - ((lc.pret * lc.cantitate) * lc.cota_tva)/100 fara_tva,
       ((lc.pret * lc.cantitate) * lc.cota_tva)/100 val_tva,
       rc.obiect_id, o.denumire, o.nr_inmatriculare
  FROM comenzi                c,
       linii_comanda          lc,
       terti                  t,
       unitati_ierarhice      UI,
       perioade_de_raportare  p, 
	   repartizare_comenzi_rj rc, 
	   obiecte o
 WHERE c.tipcom_cod = 'CC'
   and (:p_masina = '%' or o.nr_inmatriculare = :p_masina)
   and c.ID = lc.comanda_id(+)
   and (:p_articol = '%' or lc.articol_cod = :p_articol)
   and c.tert_id = t.ID
   and p.perioada = :p_perioada
   and c.data_starecom BETWEEN p.de_la AND p.la
   and (:p_ui = '%' OR c.unitier_cod = :p_ui)
   and c.unitier_cod = UI.cod
   and (:P_starecom = '%' or c.starecom_cod = :P_starecom)
   and (:p_motivcom = '%' or C.MOTIVINCHCOM_COD = :p_motivcom)
   and c.id = rc.comanda_id(+) and rc.obiect_id = o.id(+)
 ORDER BY c.unitier_cod, c.data_starecom