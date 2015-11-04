drop sequence seq001_documente_f;
drop table documente_fiscale cascade constraints;
commit;

create table documente_fiscale (
id char(8) primary key,
contract char(8),
tip varchar2(5),
seria varchar2(20),
numar varchar2(50),
valoare number(10),
modplat varchar2(5),
regularizare char(1) default 'N',
in_sold char(1) default 'D',
restant char(1) default 'N',
data_doc date,
data_platii date,
creat_de varchar2(50),
creat_la date,
modificat_de varchar2(50),
modificat_la date,
notif char(1) default 'D',
note varchar2(500)
);
commit;
alter table documente_fiscale add constraint fk_df_plata foreign key (modplat) references tipuri_plata (tip) on delete cascade;
alter table documente_fiscale add constraint fk_df_tipdoc foreign key (tip) references tipuri_documente (tip) on delete cascade;
alter table documente_fiscale add constraint fk_df_contract foreign key (contract) references contracte (id) on delete cascade;
commit;

create sequence seq001_documente_f
minvalue 1000
start with 1000
increment by 1
cache 40;

create or replace trigger trg001_documente_f
before insert on documente_fiscale for each row 
begin
select 'DOCF'||to_char(seq001_documente_f.nextval)
into :new.id
from dual;
end;

create or replace trigger trg002_documente_f
before insert on documente_fiscale for each row
begin
:new.creat_de := user;
end trg002_documente_f;

create or replace trigger trg003_documente_f
before insert on documente_fiscale for each row
begin
:new.creat_la := sysdate;
end trg003_documente_f;

create or replace trigger trg004_documente_f
before insert or update on documente_fiscale
referencing old as old new as new
for each row
begin
:new.modificat_de := user;
end trg004_documente_f;

create or replace trigger trg005_documente_f
before insert or update on documente_fiscale
referencing old as old new as new
for each row
begin
:new.modificat_la := sysdate;
end trg005_documente_f;