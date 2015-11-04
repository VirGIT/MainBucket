drop sequence seq001_documente_nf;
drop table documente_nefiscale cascade constraints;
commit;

create table documente_nefiscale (
id char(8) primary key,
persoana char(8),
tip varchar2(5),
seria varchar2(20),
numar varchar2(50),
emis_de varchar2(50),
emis_la date,
creat_de varchar2(50),
creat_la date,
modificat_de varchar2(50),
modificat_la date,
valabil_de_la date,
valabil_pana_la date,
notif char(1) default 'D',
note varchar2(500)
);
commit;
alter table documente_nefiscale add constraint fk_dn_tipdoc foreign key (tip) references tipuri_documente (tip) on delete cascade;
alter table documente_nefiscale add constraint fk_dn_persoana foreign key (persoana) references persoane (id) on delete cascade;
commit;

create sequence seq001_documente_nf
minvalue 1000
start with 1000
increment by 1
cache 40;

create or replace trigger trg001_documente_nf
before insert on documente_nefiscale for each row 
begin
select 'DOCN'||to_char(seq001_documente_nf.nextval)
into :new.id
from dual;
end;

create or replace trigger trg002_documente_nf
before insert on documente_nefiscale for each row
begin
:new.creat_de := user;
end trg002_documente_nf;

create or replace trigger trg003_documente_nf
before insert on documente_nefiscale for each row
begin
:new.creat_la := sysdate;
end trg003_documente_nf;

create or replace trigger trg004_documente_nf
before insert or update on documente_nefiscale
referencing old as old new as new
for each row
begin
:new.modificat_de := user;
end trg004_documente_nf;

create or replace trigger trg005_documente_nf
before insert or update on documente_nefiscale
referencing old as old new as new
for each row
begin
:new.modificat_la := sysdate;
end trg005_documente_nf;