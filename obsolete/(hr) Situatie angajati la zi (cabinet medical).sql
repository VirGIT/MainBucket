select f.unitier_cod cod, u.denumire, f.matricol, a.cnp, ltrim(upper(a.nume)) nume, ltrim(upper(a.prenume)) prenume, upper(f.den_fun) functia
from hr_functii_rj f, angajati a, unitati_ierarhice u
where f.pana_la is null and f.unitier_cod = u.cod and a.matricol = f.matricol
order by 1,5,6,7