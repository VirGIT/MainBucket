select 
       a.marca, ui.cod, upper(ui.denumire) denumire,
       initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40)) nume,
       lower(f.denumire) functia
  from angajati                 a,
       alocari_stat_angajat     asa,
       functii                  f,
       valori_variabila_angajat vva2,
       variabile_angajat        va2,
       unitati_ierarhice        ui,
       perioade_angajati        pa
 where a.matricol = asa.angajat_matricol
   and asa.perang_id = pa.id
   and asa.perang_id = vva2.perang_id
   and a.activ = 'D'
   and ui.cod <> '203'
   and vva2.angajat_matricol = a.matricol
   and vva2.perang_id = pa.id
   and va2.cod = vva2.varang_cod
   and va2.cod = 'FUNCTIA'
   and vva2.valoare = f.cod
   and asa.unitier_cod = ui.cod
   and pa.denumire = &p_denumire
   
   order by 2,3,4,5