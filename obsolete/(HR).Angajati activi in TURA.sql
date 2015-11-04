select f.unitier_cod, upper(u.denumire) unitatea, f.matricol, f.nume, f.prenume, lower(f.den_fun) functia, a.cnp, v.valoare data_nasterii
from hr_functii_rj f, angajati a, valori_atribut v, unitati_ierarhice u
where f.pana_la is null and f.unitier_cod = u.cod
   and f.regimlucru_cod = 'TURA'
   and a.matricol = f.matricol 
   and a.atrib_id = v.id 
   and v.atrib_cod = 'DATA_NASTERII'
   order by 1,4