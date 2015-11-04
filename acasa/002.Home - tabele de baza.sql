drop sequence seq001_terti;
drop sequence seq001_persoane;
drop table terti cascade constraints;
drop table persoane cascade constraints;
commit;

create table persoane (
id char(8) primary key,
nume varchar2(70),
prenume varchar2(100),
cnp char(13),
creat_de varchar2(50),
creat_la date,
modificat_de varchar2(50),
modificat_la date,
activ char(1) default 'D',
notif char(1) default 'D',
note varchar2(500)
);
commit;
alter table persoane add constraint un_cnp_persoana unique (cnp);
commit;

create sequence seq001_persoane
minvalue 1000
start with 1000
increment by 1
cache 40;

create or replace trigger trg001_persoane
before insert on persoane for each row 
begin
select 'PERS'||to_char(seq001_persoane.nextval)
into :new.id
from dual;
end;

create or replace trigger trg002_persoane
before insert on persoane for each row
begin
:new.creat_de := user;
end trg002_persoane;

create or replace trigger trg003_persoane
before insert on persoane for each row
begin
:new.creat_la := sysdate;
end trg003_persoane;

create or replace trigger trg004_persoane
before insert or update on persoane
referencing old as old new as new
for each row
begin
:new.modificat_de := user;
end trg004_persoane;

create or replace trigger trg005_persoane
before insert or update on persoane
referencing old as old new as new
for each row
begin
:new.modificat_la := sysdate;
end trg005_persoane;

insert into persoane (nume,prenume,cnp,activ,notif,note) values ('Staverescu','Anastasia Sofia','2222222222221','D','D','...');
insert into persoane (nume,prenume,cnp,activ,notif,note) values ('Staverescu','Maria','2222222222222','D','D','...');
insert into persoane (nume,prenume,cnp,activ,notif,note) values ('Staverescu','Mirela Mihaela','2222222222223','D','D','...');
insert into persoane (nume,prenume,cnp,activ,notif,note) values ('Staverescu','Virgil Vasile','1761222221225','D','D','...');
commit;


create table terti (
id char(8) primary key,
nume varchar2(100),
cui varchar2(20),
telefon varchar2(25),
adresa varchar2(100),
creat_de varchar2(50),
creat_la date,
modificat_de varchar2(50),
modificat_la date,
activ char(1) default 'D',
notif char(1) default 'D',
note varchar2(500)
);
commit;
alter table terti add constraint un_cui_tert unique (cui);
commit;

create sequence seq001_terti
minvalue 1000
start with 1000
increment by 1
cache 40;
commit;

create or replace trigger trg001_terti
before insert on terti for each row 
begin
select 'TERT'||to_char(seq001_terti.nextval)
into :new.id
from dual;
end;
commit;

create or replace trigger trg002_terti
before insert on terti for each row
begin
:new.creat_de := user;
end trg002_terti;
commit;

create or replace trigger trg003_terti
before insert on terti for each row
begin
:new.creat_la := sysdate;
end trg003_terti;
commit;

create or replace trigger trg004_terti
before insert or update on terti
referencing old as old new as new
for each row
begin
:new.modificat_de := user;
end trg004_terti;
commit;

create or replace trigger trg005_terti
before insert or update on terti
referencing old as old new as new
for each row
begin
:new.modificat_la := sysdate;
end trg005_terti;
commit;

