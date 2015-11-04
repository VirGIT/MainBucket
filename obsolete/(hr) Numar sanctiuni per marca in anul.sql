select matricol marca, perioada, count(distinct(matricol)) nr_sanct from 
(select to_number(a.matricol) matricol,
        cros_hr.valvarang_char(matricol, p.id, 'SANCTIUNE', 'N') sanctiune,
        p.denumire perioada
          from angajati a, unitati_ierarhice u, perioade_angajati p
         where u.cod = a.unitier_cod and to_char(dela, 'yyyy') = 2014) a
 where sanctiune is not null and sanctiune != 'NU ARE SANCTIUNI'
 group by a.matricol, a.perioada