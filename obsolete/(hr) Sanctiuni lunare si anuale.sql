select unitate,
       matricol marca,
       nume,
       sanctiune,
       perioada
  from (select u.cod||' -  '||u.denumire unitate,
               to_number(a.matricol) matricol,
               initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40)) nume,
               cros_hr.valvarang_char(matricol, p.id, 'SANCTIUNE', 'N') sanctiune,
               p.denumire perioada,
               p.id
          from angajati a, unitati_ierarhice u, perioade_angajati p
         where u.cod = a.unitier_cod
           and to_char(dela, 'yyyy') = :p_an) a
 where sanctiune is not null
   and sanctiune != 'NU ARE SANCTIUNI'
order by 3
