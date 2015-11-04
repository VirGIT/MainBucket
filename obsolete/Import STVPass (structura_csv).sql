select 
f.matricol "Id number",
initcap(substr(trim(f.nume)|| ' ' ||trim(f.prenume),1,40)) "Nume",
a.cnp "CNP", 'nespecificat' "Adresă", null "Birth Date",
f.unitier_cod||' '||trim(upper(u.denumire)) "Grupa", null "Card number"
from hr_functii_rj f, angajati a, unitati_ierarhice u
where f.pana_la is null and f.matricol = a.matricol and u.cod = f.unitier_cod