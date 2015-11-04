select '%', ' % - Toate Unitatile Ierarhice'
  from dual
union
select u.cod, upper(u.cod)||' - '||upper(u.denumire) denumire
  from unitati_ierarhice u
 where u.activa = 'D'
   and u.cod not in ('10','33','203','300','330') 
   and u.cod not like 'S%' 
   and u.cod not like '0%' 
   and u.cod not like 'CAS%' 
   and u.cod not like '%CCG%'
   and u.cod not like '%CYBLE%'
   and u.cod not like '%LAB%'
   and u.cod not like '%REG%'
   and u.denumire not like '%GEST%'
 order by 2;