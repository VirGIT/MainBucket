select f.matricol marca, upper(f.nume) nume, upper(f.prenume) prenume, f.unitier_cod||' -  '||u.denumire unitate,
to_number(cros_hr.valvarang_num(f.matricol, 3065, 'SALARIU_INC', 'N')) as salariu
from hr_functii_rj f, unitati_ierarhice u
where f.pana_la is null and u.cod = f.unitier_cod
order by 4,2,3


select f.matricol marca, upper(f.nume) nume, upper(f.prenume) prenume, f.unitier_cod||' -  '||u.denumire unitate,
to_number(cros_hr.valvarang_num(f.matricol, 3045, 'SALARIU_INC', 'N')) as salariu,
to_number(cros_hr.valvarang_num(f.matricol, 3045, 'VFUNC', 'N')) as spor_cond,
to_number(cros_hr.valvarang_num(f.matricol, 3045, 'SPOR_FUNC', 'N')) as procent_cond,
to_number(cros_hr.valvarang_num(f.matricol, 3045, 'VDOCT', 'N')) as spor_doct,
to_number(cros_hr.valvarang_num(f.matricol, 3045, 'SPOR_DOCTORAT', 'N')) as procent_doct,
to_number(cros_hr.valvarang_num(f.matricol, 3045, 'VSP25', 'N')) as spor_sofer,
to_number(cros_hr.valvarang_num(f.matricol, 3045, 'SPOR_SOFER', 'N')) as procent_sofer
from hr_functii_rj f, unitati_ierarhice u
where f.pana_la is null and
          u.cod = f.unitier_cod --and f.matricol = 2383
order by 4,2,3