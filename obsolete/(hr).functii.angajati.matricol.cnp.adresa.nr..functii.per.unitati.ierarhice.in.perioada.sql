select a.*
  from (select cod "Cod UI",
               denui "Unitate Ierarhica",
               marca "Matricol",
               nume_intreg "Nume Intreg",
               nume "Nume",
               prenume "Prenume",
               cnp "CNP",
               adresa "Adresa",
               cod_functie "Cod Functie",
               functia "Functia",
               count(a.functia) "Nr. Functii"
          from (select initcap(substr(trim(nume) || ' ' || trim(initiala) || ' ' ||
                                      trim(prenume),
                                      1,
                                      40)) nume_intreg,
                       upper(nume) nume,
                       initcap(substr(trim(prenume),1,40)) prenume,               
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
                 where aa.unitier_cod != 203
                   and aa.perang_id = p.id
                   and a.activ = 'D'
                   and a.matricol = aa.angajat_matricol
                   and p.denumire = &p_denper
                   and a.matricol = t.angajat_matricol
                   and aa.unitier_cod = u.cod
                   and v.angajat_matricol = a.matricol
                   and v.perang_id = p.id
                   and v.varang_cod = 'FUNCTIA'
                   and f.cod = v.valoare
                 order by substr(cnp, 2, 2), nume) a
         group by cod, denui, marca, nume_intreg, nume, prenume, cnp, adresa, cod_functie, functia
         order by cod, denui, marca, nume_intreg, nume, prenume, cnp, adresa, cod_functie, functia) a
