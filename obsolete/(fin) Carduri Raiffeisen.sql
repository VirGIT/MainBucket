select f.unitier_cod||' - '||u.denumire unitatea, a.nume, a.prenume, a.cnp, lower(f.den_fun) functia, a.platitor_cod plata
from hr_functii_rj f, unitati_ierarhice u, angajati a 
where f.pana_la is null and a.matricol = f.matricol and f.unitier_cod = u.cod
and a.platitor_cod like '%RAIFFEISEN%'
order by 1