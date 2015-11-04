select
   angajat.matricol matricol,
   initcap(substr(trim(angajat.nume)|| ' ' ||trim(angajat.prenume),1,40)) nume
 , angajat.cnp
 , alocang.unitier_cod||' -  '||unitier.denumire  compartiment
 , per.denumire
 , valvarang.ajutoare
 , valvarang.premii
 , valvarang.cv_boala
 , valvarang.gratificatie
 , valvarang.indemnizatie_co
 , valvarang.alte_sporuri
 , valvarang.spor_tura
 , valvarang.ore_suplimentare
 , valvarang.spor_doctorat
 , valvarang.spor_functie
 , valvarang.val_regie
 
 
from alocari_stat_angajat alocang
 , unitati_ierarhice unitier
 , perioade_angajati perang
 , angajati angajat
    ,(select perang_id, angajat_matricol
    ,sum(
    decode(varang_cod,'AJ_IMP1',valoare,0)+
    decode(varang_cod,'AJ_IMP2',valoare,0)+
    decode(varang_cod,'AJ_IMP3',valoare,0)+
    decode(varang_cod,'AJ_DECES_BRUT',valoare,0)) ajutoare
    ,sum(
    decode(varang_cod,'PREM_NORMAL',valoare,0)+
    decode(varang_cod,'PREM_EXCEP',valoare,0)+
    decode(varang_cod,'PREM_PASTI_BRUT',valoare,0)+
    decode(varang_cod,'PREM_SPECIAL',valoare,0)+
    decode(varang_cod,'PREM_SEM_I',valoare,0)+
    decode(varang_cod,'PR_S_SEM_I',valoare,0)+
    decode(varang_cod,'PREM_CRAC_BRUT',valoare,0)) premii
    
    ,sum(decode(varang_cod,'TV_B',valoare,0)) cv_boala
    ,sum(decode(varang_cod,'GRATIFICATIE',valoare,0)) gratificatie
    ,sum(decode(varang_cod,'CO_PL',valoare,0)) indemnizatie_co
    ,sum(decode(varang_cod,'VSP25',valoare,0)) alte_sporuri
    ,sum(decode(varang_cod,'VON25',valoare,0)) spor_tura
    ,sum(decode(varang_cod,'VOSUP',valoare,0)+decode(varang_cod,'VOS_SD',valoare,0)) ore_suplimentare
    ,sum(decode(varang_cod,'VDOCT',valoare,0)) spor_doctorat
    ,sum(decode(varang_cod,'VFUNC',valoare,0)) spor_functie
    
    ,sum(decode(varang_cod,'VALREG',valoare,0)) val_regie
    
   from valori_variabila_angajat valvarang
      where  varang_cod in ('AJ_IMP1','AJ_IMP2','AJ_IMP3','AJ_DECES_BRUT','PREM_NORMAL','PREM_EXCEP','PREM_PASTI_BRUT','PREM_SPECIAL','PREM_SEM_I','PR_S_SEM_I',
                            'PREM_CRAC_BRUT','TV_B','GRATIFICATIE','CO_PL','VSP25','VON25','VOSUP','VOS_SD','VFUNC','VDOCT','SALARIU_INC','REGIE','VALREG')
      group by perang_id, angajat_matricol
) valvarang,
      
(select p.id, p.denumire
from perioade_angajati p where to_number(to_char(p.la,'yyyy')) = 2012
order by id asc
) per

where alocang.unitier_cod = unitier.cod
  and alocang.perang_id = perang.id
  and alocang.angajat_matricol = angajat.matricol
  and alocang.angajat_matricol = valvarang.angajat_matricol
  and alocang.perang_id = valvarang.perang_id
  and angajat.matricol = 2383
  and perang.denumire like '%2012'
  and per.id = valvarang.perang_id(+)
  and per.id = alocang.perang_id(+)
order by to_number(angajat.matricol)
, alocang.perang_id
, unitier.cod;


