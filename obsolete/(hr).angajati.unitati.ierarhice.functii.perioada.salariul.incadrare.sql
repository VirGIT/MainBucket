select a.*, b.valoare salariu_inc
  from (select a.matricol,
               a.nume,
               a.prenume,
               f.denumire      functie,
               asa.unitier_cod ui,
               ui.denumire
          from angajati                 a,
               perioade_angajati        p,
               alocari_stat_angajat     asa,
               valori_variabila_angajat vva,
               unitati_ierarhice        ui,
               functii                  f
         where a.matricol = asa.angajat_matricol
           and asa.perang_id = p.id
           and p.denumire = &p_denumire
           and vva.angajat_matricol = a.matricol
           and vva.perang_id = p.id
           and vva.varang_cod = 'FUNCTIA'
           and ui.cod = asa.unitier_cod
           and f.cod = vva.valoare
         order by 1) a,
       (select a.matricol,
               a.nume,
               a.prenume,
               vva.valoare,
               asa.unitier_cod ui,
               ui.denumire
          from angajati                 a,
               perioade_angajati        p,
               alocari_stat_angajat     asa,
               valori_variabila_angajat vva,
               unitati_ierarhice        ui
         where a.matricol = asa.angajat_matricol
           and asa.perang_id = p.id
           and p.denumire = &p_denumire
           and vva.angajat_matricol = a.matricol
           and vva.perang_id = p.id
           and vva.varang_cod = 'SALARIU_INC'
           and ui.cod = asa.unitier_cod
         order by 1) b
 where a.matricol = b.matricol
