select a.marca,
       upper(a.nume) nume,
       initcap(rtrim(lower(a.prenume))) prenume,
       lower(f.denumire) functie,
       ui.cod      ui,
       upper(ui.denumire) denumire_ui
  from angajati                 a,
       alocari_stat_angajat     asa,
       functii                  f,
       valori_variabila_angajat vva2,
       variabile_angajat        va2,
       unitati_ierarhice        ui,
       acte_identitate_angajati aia,
       perioade_angajati        pa
 where a.marca = asa.angajat_matricol
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
   and aia.angajat_matricol = a.matricol
   and pa.denumire = :p_denumire
   -- :p_denumire like 'Octombrie 2010'
 order by 2
