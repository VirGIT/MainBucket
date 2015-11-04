select to_number(matricol) matricol,
       initcap(substr(trim(nume) || ' ' || trim(prenume), 1, 40)) nume,
       aa.unitier_cod cod_ui,
       u.denumire den_unit_ier
  from alocari_stat_angajat aa,
       angajati             a,
       unitati_ierarhice    u,
       perioade_angajati    pa
 where aa.angajat_matricol = a.matricol
   and aa.perang_id = pa.id
   and pa.denumire like :p_denumire
-- and pa.id = (select max(per.id) from perioade_angajati per)
   and aa.unitier_cod = u.cod
   and substr(a.cnp, 1, 1) = '2'
   and a.activ = 'D'
   and u.cod not in ('203','300','330')
 order by 3


