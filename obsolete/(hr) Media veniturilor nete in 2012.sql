select f.unitier_cod||' - '||upper(u.denumire) unitatea, lower(f.den_fun) functia,
       d.matricol, d."den1" nume, (to_number(d."baza1") - to_number(d."imp1")) net, 
       round((to_number(d."baza1") - to_number(d."imp1"))/to_number(lucrate.luni_platite),0) media, lucrate.luni_platite||' luni lucrate' raportat_la
from d205_beneficiari d, hr_functii_rj f, unitati_ierarhice u,
(select distinct luna.matricol, count(luna.variabila) luni_platite from
(select distinct p.id, p.denumire,
vva.angajat_matricol matricol,
vva.varang_cod variabila,
vva.valoare venit
from perioade_angajati p, valori_variabila_angajat vva
where vva.perang_id = p.id and vva.angajat_matricol < 8000 and vva.angajat_matricol <> 2598
    and vva.varang_cod = 'VENIT_BRUT'
    and vva.perang_id in (select id from perioade_angajati where to_number(to_char(la,'yyyy')) = 2012)
    group by p.id, p.denumire, vva.angajat_matricol, vva.varang_cod, vva.valoare
    order by to_number(p.id)
    ) luna
    group by luna.matricol
    having count(luna.variabila) > 0
    order by to_number(luna.matricol)) lucrate
where d."tip_functie" = 1 and d.matricol is not null --and d.matricol = 2776
   and d.matricol = lucrate.matricol
   and d.matricol = f.matricol and f.pana_la is null
   and u.cod = f.unitier_cod
order by 1 --to_number(d.matricol)
