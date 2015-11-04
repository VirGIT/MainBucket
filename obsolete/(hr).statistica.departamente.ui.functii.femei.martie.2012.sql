select ui_cod_sup, den_ui_sup, ai_cod, ai_denumire, functie, count(functie) femei
  from (
        
        select a.matricol,
                a.nume,
                a.prenume,
                lower(f.denumire) functie,
                upper(ai.unitier_cod) ui_cod_sup,
                upper(b.denumire) den_ui_sup,
                upper(ai.cod) ai_cod,
                upper(ai.denumire) ai_denumire
        
          from angajati                 a,
                perioade_angajati        p,
                alocari_stat_angajat     asa,
                valori_variabila_angajat vva,
                functii                  f,
                unitati_ierarhice ai, unitati_ierarhice b

        
         where a.matricol = asa.angajat_matricol
           and ai.UNITIER_COD=b.cod
           and ai.activa='D' and b.activa='D'
           and asa.perang_id = p.id
           and p.denumire = :p_denumire
           and vva.angajat_matricol = a.matricol
           and vva.perang_id = p.id
           and vva.varang_cod = 'FUNCTIA'
           and ai.cod = asa.unitier_cod
     
           and substr(a.cnp, 1, 1) = '2'
           and f.cod = vva.valoare
        
         order by 5, 6
        
        )
 group by ui_cod_sup, den_ui_sup, ai_cod, ai_denumire, functie
