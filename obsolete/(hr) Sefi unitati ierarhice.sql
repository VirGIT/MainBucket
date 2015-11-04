select fn.unitier_cod cod, trim(upper(ui.denumire)) denumire, fn.den_categ_post categorie, fn.den_fun functie, fn.nume, fn.prenume, fn.nume_complet 
from hr_functii_rj fn, unitati_ierarhice ui
where fn.unitier_cod = ui.cod
and fn.pana_la is null
and fn.den_categ_post IN ('TOP MANAGEMENT','PERSONAL DE CONDUCERE')
order by 1