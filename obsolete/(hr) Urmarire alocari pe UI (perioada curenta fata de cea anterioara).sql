select anterior.perioada perioada_anterioara, anterior.marca, anterior.unitate UI_anterior, anterior.nume, anterior.cnp, 
         curent.perioada perioada_curenta, curent.unitate UI_curent  from
(
select pa.id perang,
pa.denumire perioada,
asa.angajat_matricol marca,
asa.unitier_cod||' - '||ui.denumire unitate,
initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40)) nume, a.cnp cnp

from alocari_stat_angajat asa, perioade_angajati pa, unitati_ierarhice ui, angajati a

where asa.perang_id = pa.id and
          asa.unitier_cod = ui.cod and ui.unitate_id = 461 and
          asa.angajat_matricol = a.matricol and
          pa.denumire = :p_curent
) curent,
         
(
select pa.id perang,
pa.denumire perioada,
asa.angajat_matricol marca,
asa.unitier_cod||' - '||ui.denumire unitate,
initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40)) nume, a.cnp cnp

from alocari_stat_angajat asa, perioade_angajati pa, unitati_ierarhice ui, angajati a

where asa.perang_id = pa.id and
          asa.unitier_cod = ui.cod and ui.unitate_id = 461 and
          asa.angajat_matricol = a.matricol and
          pa.denumire = :p_anterior
) anterior

where curent.marca = anterior.marca and curent.unitate <> anterior.unitate