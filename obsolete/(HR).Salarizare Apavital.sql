Select
  angajat.matricol angajat_matricol
 , angajat.cnp
 , alocang.unitier_cod
 , unitier.denumire  compartiment
 , unitier.unitate_id
 , alocang.perang_id
 , valvarang.activ
 , valvarang.data_ang
 , valvarang.data_plec
 , valvarang.tip_contr
 , valvarang.clasa
 , valvarang.data_clasa
 , valvarang.categ_pers
 , valvarang.marca
 , valvarang.reg_post
 , valvarang.reg_ang
 , valvarang.norma
 , valvarang.salariu_inc
 , valvarang.salariu_norm
 , valvarang.salariu_ora
FROM  alocari_stat_angajat alocang
 , unitati_ierarhice unitier
 , perioade_angajati perang
 , angajati angajat
    ,(SELECT perang_id, angajat_matricol
    ,max(decode(varang_cod , 'ANGAJAT_ACTIV', valoare,null))  activ
    ,max(to_date(decode(varang_cod , 'DATA_ANG', valoare,null),'DD.MM.YYYY'))  data_ang
    ,max(to_date(decode(varang_cod , 'DATA_PLEC', valoare,null),'DD.MM.YYYY'))   data_plec
    ,max(decode(varang_cod , 'TIP_CONTR', valoare,null))   tip_contr
    ,max(decode(varang_cod , 'CLASA', valoare,null))   clasa
    ,max(to_date(decode(varang_cod , 'DATA_CLASA', valoare,null),'DD.MM.YYYY'))   data_clasa
    ,max(decode(varang_cod , 'CATEG_PERS', valoare,null))   CATEG_PERS
    ,max(decode(varang_cod , 'MARCA', valoare,null))   MARCA
    ,sum(decode(varang_cod , 'REGIM_POST', nvl(to_number(valoare),0),0))  reg_post
    ,sum(decode(varang_cod , 'REGIM_ANG', nvl(to_number(valoare),0),0))  reg_ang
    ,sum(decode(varang_cod , 'NORMA', nvl(to_number(valoare),0),0))  norma
    ,sum(decode(varang_cod , 'SALARIU_INC', nvl(to_number(valoare),0),0))  salariu_inc
    ,sum(decode(varang_cod , 'SALARIU_NORM', nvl(to_number(valoare),0),0)) salariu_norm
    ,sum(decode(varang_cod , 'SALARIU_ORA', nvl(to_number(valoare),0),0))  salariu_ora
   FROM  valori_variabila_angajat valvarang
      where  varang_cod in ( 'DATA_ANG', 'DATA_PLEC', 'ANGAJAT_ACTIV', 'TIP_CONTR', 'REGIM_POST', 'REGIM_ANG', 'CLASA','DATA_CLASA' , 'SALARIU_INC', 'NORMA', 'SALARIU_NORM', 'SALARIU_ORA', 'CATEG_PERS', 'MARCA' )
      group by perang_id, angajat_matricol  ) valvarang
WHERE alocang.unitier_cod = unitier.cod
  and alocang.perang_id = perang.id
  and alocang.angajat_matricol = angajat.matricol
  and alocang.angajat_matricol = valvarang.angajat_matricol
  and alocang.perang_id = valvarang.perang_id
Order by unitate_id
, alocang.perang_id
, unitier.cod;