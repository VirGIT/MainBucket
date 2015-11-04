select f.matricol, f.nume, f.prenume, a.cnp, v.valoare data_nasterii
from hr_functii_rj f, angajati a, valori_atribut v
where f.pana_la is null 
   and a.matricol = f.matricol 
   and a.atrib_id = v.id 
   and v.atrib_cod = 'DATA_NASTERII'