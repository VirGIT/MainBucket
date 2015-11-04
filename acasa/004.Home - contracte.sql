drop sequence seq001_contracte;
drop table contracte cascade constraints;
commit;

create table contracte (
id char(8) primary key,
tip varchar2(5),
numar varchar2(50),
data_contr date,
pers char(8),
tert char(8),
modfact varchar2(5),
activ char(1) default 'D',
nedeterminat char(1) default 'N',
inchis char(1) default 'N',
reziliat char(1) default 'N',
reziliat_la date,
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
alter table contracte add constraint fk_modfact_contract foreign key (modfact) references tipuri_plata (tip) on delete cascade;
alter table contracte add constraint fk_tip_contract foreign key (tip) references tipuri_contracte (tip) on delete cascade;
alter table contracte add constraint fk_pers_contract foreign key (pers) references persoane (id) on delete cascade;
alter table contracte add constraint fk_tert_contract foreign key (tert) references terti (id) on delete cascade;
commit;

create sequence seq001_contracte
minvalue 1000
start with 1000
increment by 1
cache 40;

create or replace trigger trg001_contracte
before insert on contracte for each row 
begin
select 'CNTR'||to_char(seq001_contracte.nextval)
into :new.id
from dual;
end;

create or replace trigger trg002_contracte
before insert on contracte for each row
begin
:new.creat_de := user;
end trg002_contracte;

create or replace trigger trg003_contracte
before insert on contracte for each row
begin
:new.creat_la := sysdate;
end trg003_contracte;

create or replace trigger trg004_contracte
before insert or update on contracte
referencing old as old new as new
for each row
begin
:new.modificat_de := user;
end trg004_contracte;

create or replace trigger trg005_contracte
before insert or update on contracte
referencing old as old new as new
for each row
begin
:new.modificat_la := sysdate;
end trg005_contracte;