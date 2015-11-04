select '%', ' % - Toti Angajatii'
  from dual
union
select a.matricol, a.nume || ' - ' || a.prenume
  from angajati a
 where a.activ = 'D'
 order by 1;
