--select * from tinte_ind_perf_rj
--select * from tipuri_perioade_indicatori_rj
--select * from indicatori_perf_rj

select ti.anul, f.unitier_cod||' - '||upper(u.denumire) unitatea, 
       f.matricol||' - '||ltrim(initcap(lower(f.nume)))||' '||ltrim(initcap(lower(f.prenume))) angajat, 
       f.cod_post post, lower(f.den_fun) functia,
       ti.ind_cod cod, ind.denumire, ind.formula, ind.tip_tinta, ti.tinta tinta, ind.um, tipind.denumire raportare, ind.activa
from hr_functii_rj f, unitati_ierarhice u, tinte_ind_perf_rj ti, indicatori_perf_rj ind, tipuri_perioade_indicatori_rj tipind
where f.pana_la is null and u.cod = f.unitier_cod and ti.angajat_matricol = f.matricol(+)
  and ind.cod(+) = ti.ind_cod and tipind.cod = ind.raportarea
order by 1,2,3,6


