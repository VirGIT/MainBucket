create or replace view hr_ierarhic_rj as
select ang.cod||' -  '||ang.denumire as unitate, ang.nume_angajat as nume, ang.functia as functia, ang.marca, ang.cnp, 
case when cond.nume_sef_ui is not null and sect.nume_sef_ui is not null then cond.nume_sef_ui||' ('||lower(cond.functie)||')'
        when cond.nume_sef_ui is null and sect.nume_sef_ui is null and sef.nume_sef is not null then sef.nume_sef||' ('||lower(sef.functie)||')'
        when cond.nume_sef_ui is null and sect.nume_sef_ui is not null and sef.nume_sef is not null then sect.nume_sef_ui||' ('||lower(sect.functie)||')'
        when cond.nume_sef_ui is null and sect.nume_sef_ui is null and sef.nume_sef is null then sef_dir.nume_sef||' ('||lower(sef_dir.functie)||')'
        when cond.nume_sef_ui is not null and sect.nume_sef_ui is null then cond.nume_sef_ui||' ('||lower(cond.functie)||')'
       else null end as sef_ui,
ang.cod_uis||' -  '||ang.den_uis as ui_sup, 
case when sef.nume_sef is null then null else sef.nume_sef||' ('||lower(sef.functie)||')' end as sef_ui_sup,
case when sef_dir.nume_sef is null then null else sef_dir.nume_sef||' ('||lower(sef_dir.functie)||')' end as sef_dir
from
(
select to_number(fun.matricol) marca, a.cnp cnp,
to_number(fun.unitier_cod) cod, upper(u.denumire) denumire,
uis.cod cod_uis, upper(uis.denumire) den_uis,
d.cod cod_dir, upper(d.denumire) directia,
initcap(substr(trim(fun.nume) || ' ' || trim(fun.prenume), 1, 40)) nume_angajat,
lower(fun.den_fun) functia
    from hr_functii_rj fun, unitati_ierarhice u, unitati_ierarhice uis, angajati a, unitati_ierarhice d
      where u.cod = fun.unitier_cod and fun.pana_la is null and a.matricol = fun.matricol and u.unitier_cod = uis.cod
      and (case when uis.unitier_cod is null then uis.cod else uis.unitier_cod end) = d.cod
) ang,
(
select fn.unitier_cod cod, trim(upper(ui.denumire)) denumire, fn.den_categ_post categorie, fn.den_fun functie, 
initcap(substr(trim(fn.nume) || ' ' || trim(fn.prenume), 1, 40)) nume_sef_ui
from hr_functii_rj fn, unitati_ierarhice ui
where fn.unitier_cod = ui.cod
and fn.pana_la is null
and fn.den_categ_post IN ('TOP MANAGEMENT','PERSONAL DE CONDUCERE') 
and fn.den_fun not in ('SEF SECTOR IND. PRELUCRATOARE')
) cond,
(
select distinct fn.unitier_cod cod, trim(upper(ui.denumire)) denumire, fn.den_categ_post categorie, fn.den_fun functie, 
case when fn.unitier_cod = 207 then 'Nicuta Florin' when fn.unitier_cod = 233 then 'Repede Danut'
else initcap(substr(trim(fn.nume) || ' ' || trim(fn.prenume), 1, 40)) end nume_sef_ui
from hr_functii_rj fn, unitati_ierarhice ui
where fn.unitier_cod = ui.cod
and fn.pana_la is null
and fn.den_categ_post = 'PERSONAL DE CONDUCERE'
and fn.den_fun = 'SEF SECTOR IND. PRELUCRATOARE'
) sect,
(
select fn.unitier_cod cod, trim(upper(ui.denumire)) denumire, fn.den_categ_post categorie, fn.den_fun functie, 
initcap(substr(trim(fn.nume) || ' ' || trim(fn.prenume), 1, 40)) nume_sef
from hr_functii_rj fn, unitati_ierarhice ui
where fn.unitier_cod = ui.cod
and fn.pana_la is null
and fn.den_categ_post IN ('TOP MANAGEMENT','PERSONAL DE CONDUCERE') 
and fn.den_fun not in ('SEF SECTOR IND. PRELUCRATOARE')
) sef,
(
select fn.unitier_cod cod, trim(upper(ui.denumire)) denumire, fn.den_categ_post categorie, fn.den_fun functie, 
initcap(substr(trim(fn.nume) || ' ' || trim(fn.prenume), 1, 40)) nume_sef
from hr_functii_rj fn, unitati_ierarhice ui
where fn.unitier_cod = ui.cod
and fn.pana_la is null
and fn.den_categ_post IN ('TOP MANAGEMENT','PERSONAL DE CONDUCERE') 
and fn.den_fun not in ('SEF SECTOR IND. PRELUCRATOARE')
) sef_dir

where ang.cod = cond.cod (+) and ang.cod = sect.cod (+) and ang.cod_uis = sef.cod (+) and ang.cod_dir = sef_dir.cod (+);

show errors;

exec ad_usr.set_user(user); 
--DROP PUBLIC SYNONYM hr_ierarhic_rj; 
CREATE PUBLIC SYNONYM hr_ierarhic_rj FOR RAJAC_IASI.hr_ierarhic_rj; 
GRANT SELECT ON RAJAC_IASI.hr_ierarhic_rj TO CROS_VIEW;