-- UPDATE HISTORY
/* seteaza data curenta in tabela vp_history la fiecare insert / update */
create or replace trigger set_history_date
before insert or update
on vp_history
referencing old as old new as new
for each row
begin
:new.g_date := sysdate;
end set_history_date;
/