select
       vva3.VARANG_COD VARIABILA,           
       sum(VVA3.VALOARE*1) valoare_variabila

from angajati a, alocari_stat_angajat asa,      
     valori_variabila_angajat vva3

where a.marca=asa.angajat_matricol 
      and asa.perang_id between  3005 and 3206 -- Ianuarie - Decembrie 2013
      and vva3.ANGAJAT_MATRICOL=a.MATRICOL and VVA3.PERANG_ID = ASA.PERANG_ID
      
      -- ===============================================
      and vva3.VARANG_COD='VENIT_FS'
      -- ===============================================      

group by vva3.VARANG_COD