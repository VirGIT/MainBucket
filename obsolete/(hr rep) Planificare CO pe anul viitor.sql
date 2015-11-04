select cod_unit_ier, matr to_number_vv_matricol, initcap(nume) nume, avans, to_char(nvl(avans, 0)) av, semnatura, semnatura1, den_unit_ier, nvl(litere_c, 'zero') litere_c, categ, lower(meseria) meseria
  from (select vv.cod_unit_ier cod_unit_ier, to_number(vv.matricol) matr, vv.nume nume, dif.avans avans, vv.semnatura semnatura, vv.semnatura1, vv.den_unit_ier den_unit_ier, litere_c, categ
           from (select distinct a.unitier_cod cod_unit_ier, to_number(a.matricol) mm, rtrim(a.nume || ' ' ||
                                         rtrim(a.prenume)) nume, v.valoare avans, '..............................' semnatura, '.................' semnatura1, u.denumire ||
                                   ' - ' ||
                                   decode(categ, 'TESA', 'TESA', decode(categ, 'MUNCITOR', 'MUNCITORI', '????')) den_unit_ier, litere_c, categ, 1 nrcrt
                    from valori_variabila_angajat v, angajati a, unitati_ierarhice u, perioade_angajati p, (select rtrim(valoare_in_litere(sum(round(0, 0)))) litere_c, a.unitier_cod cod_u, cat categ
                             from valori_variabila_angajat v, perioade_angajati p, angajati a, (select angajat_matricol ang_mat, valoare cat
                                      from valori_variabila_angajat v, perioade_angajati p
                                     where v.perang_id = p.id
                                       and p.denumire =
                                           :id_per
                                       and v.varang_cod =
                                           'CATEG_PERS')
                            where v.varang_cod =
                                  'PRIMA_ZI'
                              and v.angajat_matricol =
                                  a.matricol
                              and v.perang_id = p.id
                              and p.denumire =
                                  :id_per
                              and v.angajat_matricol =
                                  ang_mat
                            group by a.unitier_cod, cat), (select a.matricol m_categ, a.unitier_cod cod_u1, v.valoare categ1
                             from valori_variabila_angajat v, angajati a, perioade_angajati p
                            where v.varang_cod =
                                  'CATEG_PERS'
                              and v.angajat_matricol =
                                  a.matricol
                              and v.perang_id = p.id
                              and p.denumire =
                                  :id_per)
                   where (v.angajat_matricol = a.matricol and
                         v.varang_cod = 'PRIMA_ZI' and a.unitier_cod = u.cod and
                         v.perang_id = p.id and p.denumire = :id_per and
                         cod_u = a.unitier_cod and a.matricol = m_categ and
                         categ = categ1 and cod_u = cod_u1)) dif, (select a.unitier_cod cod_unit_ier, a.matricol, rtrim(a.nume || ' ' ||
                                rtrim(a.prenume)) nume, 0 avans, '..............................' semnatura, '.................' semnatura1, u.denumire ||
                          ' - ' ||
                          decode(va.valoare, 'TESA', 'TESA', decode(va.valoare, 'MUNCITOR', 'MUNCITORI', '????')) den_unit_ier
                    from angajati a, unitati_ierarhice u, valori_variabila_angajat va, perioade_angajati p
                   where a.activ = 'D'
                     and a.unitier_cod =
                         u.cod
                     and va.varang_cod =
                         'CATEG_PERS'
                     and va.perang_id = p.id
                     and p.denumire =
                         :id_per
                     and va.angajat_matricol =
                         a.matricol
                     and a.unitier_cod not in
                         ('300')) vv
          where dif.mm(+) = to_number(vv.matricol)
          order by 1, 2), (select to_number(v.angajat_matricol) marca, vv.denumire meseria
           from perioade_angajati p, valori_variabila_angajat v, valori_posibile_variabila vv
          where perang_id = p.id
            and v.varang_cod = 'FUNCTIA'
            and vv.varang_cod = 'FUNCTIA'
            and vv.valoare = v.valoare
            and p.denumire = :id_per)
 where marca = matr
 order by 1, 2
