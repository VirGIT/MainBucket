Select
  angajat.matricol angajat_matricol
 , angajat.cnp
 , alocang.unitier_cod||' -  '||unitier.denumire  compartiment
 , per.denumire
 , valvarang.aj_imp1
 , valvarang.aj_imp2
 , valvarang.aj_imp3
 , valvarang.regie
 , valvarang.gratificatie
FROM  alocari_stat_angajat alocang
 , unitati_ierarhice unitier
 , perioade_angajati perang
 , angajati angajat
    ,(SELECT perang_id, angajat_matricol
    ,sum(decode(varang_cod,'AJ_IMP1',valoare,0)) aj_imp1
    ,sum(decode(varang_cod,'AJ_IMP2',valoare,0)) aj_imp2
    ,sum(decode(varang_cod,'AJ_IMP3',valoare,0)) aj_imp3
    ,sum(decode(varang_cod,'REGIE',valoare,0)) regie
    ,sum(decode(varang_cod,'GRATIFICATIE',valoare,0)) gratificatie
   FROM  valori_variabila_angajat valvarang
      where  varang_cod in ('AJ_IMP1','AJ_IMP2','AJ_IMP3','REGIE','GRATIFICATIE')
      group by perang_id, angajat_matricol  
) valvarang,
      
(select p.id, p.denumire
from perioade_angajati p where to_number(to_char(p.la,'yyyy')) = :p_anul
order by id asc
) per

WHERE alocang.unitier_cod = unitier.cod
  and alocang.perang_id = perang.id
  and alocang.angajat_matricol = angajat.matricol
  and alocang.angajat_matricol = valvarang.angajat_matricol
  and alocang.perang_id = valvarang.perang_id
  and angajat.matricol = 2776 
  and perang.denumire like '%2012'
  and per.id = valvarang.perang_id(+)
  and per.id = alocang.perang_id(+)
Order by unitate_id
, alocang.perang_id
, unitier.cod;


