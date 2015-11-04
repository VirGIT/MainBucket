--Grupa 1
select 'Pentru UI: 146,173,177,178... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1200' as "Limita", 1200-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (931204,962401)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1200
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 146,173,177,178... TURA' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1000' as "Limita", 1000-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (931204,962401)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod = 'TURA'
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1000
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 146,173,177,178... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1364' as "Limita", 1364-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 712607
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1364
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 146,173,177,178... TURA' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1250' as "Limita", 1250-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 712607
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod = 'TURA'
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1250
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 146,173,177,178... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1264' as "Limita", 1264-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (311101,711501,711205)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1264
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 146,173,177,178... TURA' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1369' as "Limita", 1369-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (311101,711501,711205)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod = 'TURA'
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1369
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 146,173,177,178... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1380' as "Limita", 1380-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (721208,721410,712602,712613,741216,741307)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1380
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 146,173,177,178... TURA' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1290' as "Limita", 1290-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (721208,721410,712602,712613,741216,741307)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod = 'TURA'
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1290
order by to_number(f.unitier_cod)) gr

union all 

select 'Pentru UI: 146,173,177,178... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1379' as "Limita", 1379-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 832201
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1379
order by to_number(f.unitier_cod)) gr

union all 

select 'Pentru UI: 146,173,177,178... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1543' as "Limita", 1543-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (833201,833204,834201)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1543
order by to_number(f.unitier_cod)) gr

union all 

select 'Pentru UI: 146,173,177,178... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1500' as "Limita", 1500-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 422502
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1500
order by to_number(f.unitier_cod)) gr

union all 

select 'Pentru UI: 146,173,177,178... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1785' as "Limita", 1785-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (311203,311215)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1785
order by to_number(f.unitier_cod)) gr

union all 

select 'Pentru UI: 146,173,177,178... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2064' as "Limita", 2064-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 214202
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2064
order by to_number(f.unitier_cod)) gr

union all 

select 'Pentru UI: 146,173,177,178... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2222' as "Limita", 2222-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (214205,215204)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2222
order by to_number(f.unitier_cod)) gr

union all 

select 'Pentru UI: 146,173,177,178... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2064' as "Limita", 2064-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 311303
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2064
order by to_number(f.unitier_cod)) gr

union all 

select 'Pentru UI: 146,173,177,178... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2064' as "Limita", 2064-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 132103
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2064
order by to_number(f.unitier_cod)) gr

union all 

select 'Pentru UI: 146,173,177,178... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2980' as "Limita", 2980-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 121903
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (146,173,177,178,200,201,228,269,144,242,170,171,172,237)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2980
order by to_number(f.unitier_cod)) gr

-- Grupa 2 
union all

select 'Pentru UI: 141,253,254,224... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1200' as "Limita", 1200-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 931204
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1200
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 146,173,177,178... TURA' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1000' as "Limita", 1000-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 931204
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod = 'TURA'
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1000
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 141,253,254,224... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1369' as "Limita", 1369-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (712607,311101,711205,818207)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1369
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 146,173,177,178... TURA' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1251' as "Limita", 1251-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (712607,311101,711205,818207)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod = 'TURA'
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1251
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 141,253,254,224... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1432' as "Limita", 1432-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (721208,712613,712602,741307,741216,721410,741201,818902,742201,711501)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1432
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 146,173,177,178... TURA' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1311' as "Limita", 1311-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (721208,712613,712602,741307,741216,721410,741201,818902,742201,711501)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod = 'TURA'
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1311
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 141,253,254,224... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1432' as "Limita", 1432-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (834101,413201)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1432
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 141,253,254,224... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1379' as "Limita", 1379-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 832201
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1379
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 141,253,254,224... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1543' as "Limita", 1543-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (833201,833204,834201)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1543
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 141,253,254,224... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1785' as "Limita", 1785-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (432316,311519)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1785
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 141,253,254,224... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2064' as "Limita", 2064-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 214202
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2064
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 141,253,254,224... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2332' as "Limita", 2332-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 132103
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2332
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 141,253,254,224... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2980' as "Limita", 2980-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 121903
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2980
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 141,253,254,224... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2222' as "Limita", 2222-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (214205,214205,214203,215303,215202,214513,216502,213305,213114,214401,214313)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2222
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 146,173,177,178... TURA' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2200' as "Limita", 2200-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (214205,214205,214203,215303,215202,214513,216502,213305,213114,214401,214313)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod = 'TURA'
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2200
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 141,253,254,224... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2222' as "Limita", 2222-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (311208,132235,132103,121903)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2222
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 146,173,177,178... TURA' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2200' as "Limita", 2200-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (311208,132235,132103,121903)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod = 'TURA'
and f.unitier_cod in (141,253,254,224,136,250,251,252,142,255,256,143,257,258,236,265)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2200
order by to_number(f.unitier_cod)) gr

-- Grupa 3
union all

select 'Pentru UI: 132,182,183,184 ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1200' as "Limita", 1200-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 931204
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (132,182,183,184)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1200
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 132,182,183,184 ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2064' as "Limita", 2064-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 132235
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (132,182,183,184)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2064
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 132,182,183,184 ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2980' as "Limita", 2980-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 121903
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (132,182,183,184)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2980
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 132,182,183,184 ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1527' as "Limita", 1527-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (721208,712602,711402,721410,712609)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (132,182,183,184)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1527
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 132,182,183,184 ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1543' as "Limita", 1543-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (833201,834201)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (132,182,183,184)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1543
order by to_number(f.unitier_cod)) gr

-- Grupa 4
union all

select 'Pentru UI: 133,188,189 ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1200' as "Limita", 1200-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 912201
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (133,188,189)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1200
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 133,188,189 ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1379' as "Limita", 1379-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 832201
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (133,188,189)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1379
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 133,188,189 ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2064' as "Limita", 2064-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 311509
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (133,188,189)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2064
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 133,188,189 ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2980' as "Limita", 2980-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 121903
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (133,188,189)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2980
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 133,188,189 ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1432' as "Limita", 1432-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (432304,721410)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (133,188,189)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1432
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 133,188,189 ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1543' as "Limita", 1543-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (833201,833204,834201,834405,834305)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (133,188,189)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1543
order by to_number(f.unitier_cod)) gr

-- Grupa 5
union all

select 'Pentru UI: 215,217,218,219... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2980' as "Limita", 2980-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 121903
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (215,217,218,219,221,190,259,260,267,268)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2980
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 215,217,218,219... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2064' as "Limita", 2064-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 214402
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (215,217,218,219,221,190,259,260,267,268)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2064
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 215,217,218,219... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2064' as "Limita", 2064-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (132235,311509,311508,311303)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (215,217,218,219,221,190,259,260,267,268)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2064
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 215,217,218,219... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2332' as "Limita", 2332-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 132103
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (215,217,218,219,221,190,259,260,267,268)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2332
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 215,217,218,219... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2980' as "Limita", 2980-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 121903
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (215,217,218,219,221,190,259,260,267,268)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2980
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 215,217,218,219... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1400' as "Limita", 1400-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (723103,722408,721410,722413,814208,721208)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (215,217,218,219,221,190,259,260,267,268)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1400
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 215,217,218,219... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1422' as "Limita", 1422-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (742201,741307,741216,712609,742214,741204)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (215,217,218,219,221,190,259,260,267,268)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1422
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 215,217,218,219... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2222' as "Limita", 2222-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (214401,215202)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (215,217,218,219,221,190,259,260,267,268)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2222
order by to_number(f.unitier_cod)) gr

-- Grupa 6
union all

select 'Pentru UI: 125,114,261,208... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1364' as "Limita", 1364-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (422304,523003)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (125,114,261,208,230,321,135,233,264,263,207,198,134,241,129,130,195)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1364
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 125,114,261,208... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1200' as "Limita", 1200-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (931204,962906,962101,911201,933301,962401)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (125,114,261,208,230,321,135,233,264,263,207,198,134,241,129,130,195)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1200
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 125,114,261,208... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1369' as "Limita", 1369-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (711205,818207,752201,732214,413201,712607,311101,711501,752201,311804,432101,512001)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (125,114,261,208,230,321,135,233,264,263,207,198,134,241,129,130,195)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1369
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 125,114,261,208... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1432' as "Limita", 1432-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (712609,311114,721410,712602,333907,721208,351103,311306,311215,311203)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (125,114,261,208,230,321,135,233,264,263,207,198,134,241,129,130,195)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1432
order by to_number(f.unitier_cod)) gr

-- Grupa 7
union all

select 'Pentru UI: 220,235,103,107... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1500' as "Limita", 1500-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (411001,441502,422502,441501,412001)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (220,235,103,107,213,125,113,114,261,208,101,112,115,230,231,232,135,233,264,263,207,198,134,241,129,130,193,240,128,123,270,195,111,262)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1500
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 220,235,103,107... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 1785' as "Limita", 1785-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (333906,422502,222101,311519,331303,311207,351103,311306,311215,311203,311909,331302)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (220,235,103,107,213,125,113,114,261,208,101,112,115,230,231,232,135,233,264,263,207,198,134,241,129,130,193,240,128,123,270,195,111,262)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 1785
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 220,235,103,107... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2064' as "Limita", 2064-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (214202,214402)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (220,235,103,107,213,125,113,114,261,208,101,112,115,230,231,232,135,233,264,263,207,198,134,241,129,130,193,240,128,123,270,195,111,262)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2064
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 220,235,103,107... ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2222' as "Limita", 2222-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (251201,214132,241105,213114,211301,214209,261103,263107,214214,432201,263102,214946,215204,215202,214513,214205,214201,215216,215303,216502,214203,214401,
132101,221107,214208,331309,241103,243201,242319,226302,242314,214202,214402,264306)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (220,235,103,107,213,125,113,114,261,208,101,112,115,230,231,232,135,233,264,263,207,198,134,241,129,130,193,240,128,123,270,195,111,262)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2222
order by to_number(f.unitier_cod)) gr

union all

select 'Pentru UI: 220,235,103,107... TURA' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2200' as "Limita", 2200-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 432201
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod = 'TURA'
and f.unitier_cod in (220,235,103,107,213,125,113,114,261,208,101,112,115,230,231,232,135,233,264,263,207,198,134,241,129,130,193,240,128,123,270,195,111,262)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2200
order by to_number(f.unitier_cod)) gr

-- Grupa 8
union all

select 'Pentru UI: 270 ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2064' as "Limita", 2064-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 132235
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod = 270
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2064
order by to_number(f.unitier_cod)) gr

-- Grupa 9
union all

select 'Pentru UI: 111,262 ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2327' as "Limita", 2327-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (251201,251202,251203,252101)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
and f.unitier_cod in (111,262)
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2327
order by to_number(f.unitier_cod)) gr

-- Grupa 10
union all

select 'CONDUCERE ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2332' as "Limita", 2332-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func = 132103
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2332
order by to_number(f.unitier_cod)) gr

union all

select 'CONDUCERE ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2548' as "Limita", 2548-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (121904,132104)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2548
order by to_number(f.unitier_cod)) gr

union all

select 'CONDUCERE ZI' as "Grupe principale", gr.*
from
(select distinct f.matricol, f.nume, f.prenume, f.unitier_cod cod, ltrim(upper(u.denumire)) denumire, ltrim(lower(f.den_fun)) functia,
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as salariu, '< 2980' as "Limita", 2980-
to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) as "Diferenta", f.regimlucru_cod as "Regim"
from hr_functii_rj f, unitati_ierarhice u
where f.cod_func in (132448,121901,121205,122311)
and f.pana_la is null and f.unitier_cod = u.cod and f.regimlucru_cod in ('ZI','ZISD')
group by f.matricol, f.nume, f.prenume, f.unitier_cod, u.denumire, f.den_fun, f.regimlucru_cod
having to_number(cros_hr.valvarang_num(f.matricol,3226,'SALARIU_INC','N')) < 2980
order by to_number(f.unitier_cod)) gr

order by 1
