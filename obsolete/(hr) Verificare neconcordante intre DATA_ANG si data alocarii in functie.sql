select a.matricol, a.nume||' '||a.prenume nume,
       cros_hr.VALVARANG_DATA(a.matricol,
                              (select pa.id
                                 from perioade_angajati pa
                                where a.de_la between pa.dela and pa.la),
                              'DATA_ANG',
                              'N') data_ang,
       a.de_la
  from hr_functii_rj a,
       (select b.matricol, min(b.de_la) min_dela
          from hr_functii_rj b
         group by b.matricol) c
 where
--a.matricol = '528' and 
 a.matricol = c.matricol
 and a.de_la = c.min_dela
 and cros_hr.VALVARANG_DATA(a.matricol,
                        (select pa.id
                           from perioade_angajati pa
                          where a.de_la between pa.dela and pa.la),
                        'DATA_ANG',
                        'N') <> a.de_la
 and a.de_la > to_date('01.01.2003', 'dd.mm.yyyy')
