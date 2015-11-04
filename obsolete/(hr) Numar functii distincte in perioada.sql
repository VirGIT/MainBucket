select distinct count(f.cod) nr_functii, f.cod cod, lower(f.denumire) denumire
from alocari_stat_angajat     aa,
                       angajati                 a,
                       unitati_ierarhice        u,
                       functii                  f,
                       valori_variabila_angajat v,
                       perioade_angajati        p
                 where aa.unitier_cod != 203
                   and aa.perang_id = p.id
                   and a.activ = 'D'
                   and a.matricol = aa.angajat_matricol
                   and p.denumire = :p_denumire
                   and aa.unitier_cod = u.cod
                   and v.angajat_matricol = a.matricol
                   and v.perang_id = p.id
                   and v.varang_cod = 'FUNCTIA'
                   and f.cod = v.valoare
                   
                   group by f.cod,f.denumire