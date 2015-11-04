select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,
       'PCT1',       
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'M',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='REGIE'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'M',2,'F','')  
         
UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,
       'PCT2-ORE SUPLIMENTARE',       
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'M',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='VOSUP'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'M',2,'F','')
         
         UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,     
       'PCT2-SAMBATA+DUMINICA',  
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'M',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='VOS_SD' 
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'M',2,'F','')
         
         UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA, 
       'PCT2-SOFER',      
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'M',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='SP25'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'M',2,'F','')
         
         UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
       'PCT2-ORE NOAPTE',    
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'M',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='VON25'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'M',2,'F','')
         
         UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,    
       'PCT2-SPOR DOCTORAT',   
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'M',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='VDOCT'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'M',2,'F','')
         
         UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,
       'PCT3-PREMIU SPECIAL',       
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'M',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='PREM_SPECIAL'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'M',2,'F','')
         
         UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT3-PREMIU CRACIUN',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'M',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='PREM_CRAC_BRUT'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'M',2,'F','')
         
         UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT3-PREMIU PASTI',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'M',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='PREM_PASTI_BRUT'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'M',2,'F','')
         

UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT4-PRIMA CO',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'M',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='PRIMA'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'M',2,'F','')
       
	   union
	   
	   select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT1BIS-PREMIU NORMAL',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='PREM_NORMAL'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
                  UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT1BIS-PREMIU EXCEP',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='PREM_EXCEP'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
                           UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT1BIS-PREMIU SPECIAL',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='PREM_SPECIAL'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
                                    UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT2BIS-PRIME VACANTA',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='PRIMA'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
                                             UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT3BIS-AJUTOR IMPOZABIL 1',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='AJ_IMP1'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
                                                      UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT3BIS-AJUTOR IMPOZABIL 2',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='AJ_IMP2'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
                                                      UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT3BIS-AJUTOR IMPOZABIL 3',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='AJ_IMP3'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
                                                      UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT3BIS-AJUTOR NEIMPOZABIL',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='AJ_NEIMP'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
                                                               UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT3BIS-VAL_CO1',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='VAL_CO_LP1'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
                                                                        UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT3BIS-VAL_CO2',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='VAL_CO_LP2'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
                                                                                 UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT4BIS-CAS RAJAC',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='TV_B_SOC'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
         union
		 
		 select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT5-GRATIFICATII',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='GRATIFICATIE'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
                                                                                                   UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT6-TICHETE',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='V_TICHETE'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
         
           UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT6-PREMIU 8MARTIE',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between 2765 and 2965 -- (ianuarie - noiembrie, ca sa cuprinda doar premiile de 8 martie, nu si cele de pom de iarna, trecute pe aceeasi variabila in decembrie) 
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='PREM_8_MARTIE'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
         UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT6-POM CRACIUN',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id = 2985  -- Premiile copiilor de craciun (doar pe luna decembrie)
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='PREM_8_MARTIE'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
                  UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT7-VALOARE BOALA CAS',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='V100_CAS'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
          UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT7-VALOARE BOALA FAAMPB(FOND ACCIDENTE)',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
      and asa.perang_id between  2765 and 2985
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='TV_B_FAAMBP'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
          UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT8-CONTRIB LA SOMAJ',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
    and asa.perang_id between  2765 and 2985
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='AJSOMAJ'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
          UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCT9-CONTRIB ASIG SOC 10.5%',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
     and asa.perang_id between  2765 and 2985
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='VAL_CAS'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
           UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCTz10-CONTRIB ASIG SOC SANATATE 5.5%',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
     and asa.perang_id between  2765 and 2985
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='V_SANAT'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
         UNION

select --a.matricol, a.nume, a.prenume,
       vva3.VARANG_COD VARIABILA,   
        'PCTz11-IMPOZITUL AFERENT',          
       decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL') GRUP_UI, 
       DECODE(substr(a.cnp,1,1),1,'B',2,'F','') sex,              
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
   --   and a.activ ='D'
     and asa.perang_id between  2765 and 2985
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      -- ===============================================
      and vva3.VARANG_COD='VAL_IMP'
      -- ===============================================      
      --and a.matricol = 2661
group by vva3.VARANG_COD,
         decode(asa.unitier_cod,'142','2.TRATARE-CAPTARE','255','2.TRATARE-CAPTARE','256','2.TRATARE-CAPTARE','143','2.TRATARE-CAPTARE','257','2.TRATARE-CAPTARE','258','2.TRATARE-CAPTARE',
              '132','3.PROIECTE-UTILITARE','182','3.PROIECTE-UTILITARE','183','3.PROIECTE-UTILITARE','184','3.PROIECTE-UTILITARE',
              '1.RESTUL'), 
         DECODE(substr(a.cnp,1,1),1,'B',2,'F','')
         
         order by 2