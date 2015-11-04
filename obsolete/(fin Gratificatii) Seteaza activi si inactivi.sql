/*
drop table valori_variabila_angajat_gr cascade;
commit;
create table valori_variabila_angajat_gr as select * from valori_variabila_angajat2 where 1=0;
commit;
*/
--select * from VALORI_VARIABILA_ANGAJAT where perang_id=2605 and varang_cod='GRATIFICATIE'

update valori_variabila_angajat_gr set activ = 'D';
commit;
declare
  cursor aa is
    select a.matricol, a.nume, a.prenume
      from valori_variabila_angajat_gr g, angajati a
     where a.matricol = g.angajat_matricol
       and a.activ = 'N';
begin
  for i in aa loop
    update valori_variabila_angajat_gr
       set activ = 'N'
     where angajat_matricol = i.matricol;
    commit;
  end loop;
end;
