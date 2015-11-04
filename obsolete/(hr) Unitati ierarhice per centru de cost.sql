select a.centrucost_cod,
       a.cod,
       a.denumire
  from unitati_ierarhice a
 where a.centrucost_cod is not null
   and a.activa = 'D'
 order by 1, 2