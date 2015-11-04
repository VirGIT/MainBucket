  select    
                      upper(a.nume)||' '||
                       initcap(substr(trim(a.prenume),1,40)) as nume, 
                        a.matricol as matricol,
                        f.cod as cod_functie,
                       lower(f.denumire) as functia,
                       u.cod||' - '||
                       upper(u.denumire) as ui
              
               from alocari_stat_angajat        aa,
                       angajati                           a,
                       adrese_angajat                 t,
                       unitati_ierarhice                u,
                       functii                               f,
                       valori_variabila_angajat     v,
                       perioade_angajati             p
                       
               where aa.unitier_cod != 203
                   and aa.perang_id = p.id
                   and a.activ = 'D'
                   and a.matricol = aa.angajat_matricol
                   and p.id = (select max(per.id) from perioade_angajati per)
                   and a.matricol = t.angajat_matricol
                   and aa.unitier_cod = u.cod
                   and v.angajat_matricol = a.matricol
                   and v.perang_id = p.id
                   and v.varang_cod = 'FUNCTIA'
                   and f.cod = v.valoare
                 and f.cod in (090400,090500,074585,074570) 
                 
                 order by 3
                 