select 
a.matricol marca, 
initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40)) nume,
u.cod||' -  '||u.denumire unitier, 
uis.cod||' -  '||uis.denumire ui_superioara, 
d.cod||' -  '||d.denumire directia

from angajati a, unitati_ierarhice u, unitati_ierarhice uis, unitati_ierarhice d

where u.unitier_cod = uis.cod 
  and (case when uis.unitier_cod is null then uis.cod else uis.unitier_cod end) = d.cod
  and a.unitier_cod = u.cod
  and exists (select 1 from (select un.cod, upper('UI '||un.cod || ' - ' || un.denumire) denumire
  from unitati_ierarhice un
 where un.activa = 'D'
   and un.cod not in ('10','33','203','300','330') 
   and un.cod not like 'S%' 
   and un.cod not like '0%' 
   and un.cod not like 'CAS%' 
   and un.cod not like '%CCG%'
   and un.cod not like '%CYBLE%'
   and un.cod not like '%LAB%'
   and un.cod not like '%REG%'
   and un.denumire not like '%GEST%'
 order by 1) where u.cod = un.cod) 
  and a.activ = 'D'
 
 order by 4