--  verificare
/*
select matricol,nume||' '||prenume nume from alocari_stat_angajat a,angajati where perang_id=:pid and angajat_matricol=matricol and activ='N' order by 2;
select distinct matricol,nume||' '||prenume nume from calcul_variabile_angajat a,angajati where perang_id=:pid and angajat_matricol=matricol and activ='N' order by 2;
select distinct matricol,nume||' '||prenume nume from valori_variabila_angajat a,angajati where perang_id=:pid and angajat_matricol=matricol and activ='N' order by 2;
*/

--  stergere
delete alocari_stat_angajat where perang_id=:pid and angajat_matricol in 
(select matricol from alocari_stat_angajat a,angajati where perang_id=:pid and angajat_matricol=matricol and activ='N');

delete calcul_variabile_angajat where perang_id=:pid and angajat_matricol in 
(select distinct matricol from calcul_variabile_angajat a,angajati where perang_id=:pid and angajat_matricol=matricol and activ='N');

delete valori_variabila_angajat where perang_id=:pid and angajat_matricol in 
(select distinct matricol from valori_variabila_angajat a,angajati where perang_id=:pid and angajat_matricol=matricol and activ='N');

commit;

--select id, denumire from perioade_angajati where denumire = 'Septembrie 2012' 