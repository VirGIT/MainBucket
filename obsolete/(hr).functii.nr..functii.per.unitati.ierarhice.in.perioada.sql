select
sel.*
--upper(sel.functia) functia,
--count(sel.functia) nr_functii

from (select initcap(substr(trim(nume) || ' ' || trim(initiala) || ' ' ||
                                      trim(prenume),
                                      1,
                                      40)) nume,
                       a.cnp,
                       matricol marca,
                       replace(trim(trim(t.strada) || ' ' ||
                                    trim(t.nr_strada) || ' ' || trim(t.bloc) || ' ' ||
                                    trim(t.scara) || ' ' || trim(t.etaj) || ' ' ||
                                    trim(t.apt) || ' ' || ' Loc. ' ||
                                    trim(t.localitate) || ' ' || ' Jud. ' ||
                                    trim(t.judet) || ' ' ||
                                    trim(t.cod_postal)),
                               '  ',
                               ' ') adresa,
                       f.cod cod_functie,
                       f.denumire functia,
                       trim(aa.unitier_cod) || ' ' || trim(u.denumire) loc_de_munca,
                       '                             ' obs,
                       u.cod,
                       u.denumire denui
                  from alocari_stat_angajat     aa,
                       angajati                 a,
                       adrese_angajat           t,
                       unitati_ierarhice        u,
                       functii                  f,
                       valori_variabila_angajat v,
                       perioade_angajati        p
                 where aa.unitier_cod not in ('203') and 
                         aa.perang_id = p.id
                   and a.activ = 'D'
                   and a.matricol = aa.angajat_matricol
                   and p.denumire = &p_denper
                   and a.matricol = t.angajat_matricol
                   and aa.unitier_cod = u.cod
                   and v.angajat_matricol = a.matricol
                   and v.perang_id = p.id
                   and v.varang_cod = 'FUNCTIA'
                   and f.cod = v.valoare) sel
                   
                  -- group by sel.functia
                   order by 1