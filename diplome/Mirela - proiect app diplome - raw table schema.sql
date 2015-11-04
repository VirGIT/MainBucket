-- tipuri_diplome ******************************************************************

create table tipuri_diplome (
 tip_certificat number(5) primary key,
 descriere varchar2(100));
commit;

create sequence seq_certificat_001
minvalue 0
start with 0
increment by 1
nocache;
commit;

create or replace trigger trg_certificat_001
before insert on tipuri_diplome for each row 
begin
select seq_certificat_001.nextval
into :new.tip_certificat
from dual;
end;
commit;

insert into tipuri_diplome (descriere) values ('dummy');
commit;

-- lot_diplome ********************************************************************

create table lot_diplome (
 seria_lot char(1) constraint ck_dip_seria_lot check (seria_lot in ('G','F','X')),
 nr_inceput varchar2(30),
 nr_sfarsit varchar2(30),
 cantitatea number(5) default 0,
 modificat_de varchar2(50),
 modificat_la date,
 tip_certificat number(5) default 0,
 descriere varchar2(200));
commit;
 alter table lot_diplome add constraint pk_lot_diplome_001 primary key (seria_lot,nr_inceput,nr_sfarsit);
 alter table lot_diplome add constraint fk_lot_diplome_002 foreign key (tip_certificat) references tipuri_diplome (tip_certificat);
commit;

create or replace trigger trg_lot_dip_001
before insert or update
on lot_diplome
referencing old as old new as new
for each row
begin
:new.modificat_de := user;
end trg_lot_dip_001;
commit;

create or replace trigger trg_lot_dip_002
before insert or update
on lot_diplome
referencing old as old new as new
for each row
begin
:new.modificat_la := sysdate;
end trg_lot_dip_002;
commit; 

insert into lot_diplome (seria_lot,nr_inceput,nr_sfarsit,descriere) values ('X','0','0','dummy');
commit;

-- info_loturi **********************************************************************

create or replace view info_loturi as

 select ld.seria_lot,ld.nr_inceput,ld.nr_sfarsit,ld.cantitatea,ld.modificat_la as data_primirii,ld.descriere,
 case when to_number(ld.nr_sfarsit)-to_number(ld.nr_inceput) <> ld.cantitatea then 'Cantitate sau Nr.Inc/Sf GRESITE !' else 'Corect' end as verificare_lot
 
 from lot_diplome ld where ld.seria_lot <> 'X';
 
commit;

-- diplome ***************************************************************************

create table diplome (
 seria_lot char(1) default 'X',
 nr_inceput varchar2(30) default 0,
 nr_sfarsit varchar2(30) default 0,
 tip_certificat number(5) default 0,
 seria char(1) constraint ck_dip_seria check (seria in ('G','F','X')),
 numar varchar2(30) not null,
 activa char(1) default 'D' constraint ck_dip_activa check (activa in ('D','N')),
 acordata char(1) default 'N' constraint ck_dip_acordata check (acordata in ('D','N')),
 modificat_de varchar2(50),
 modificat_la date,
 descriere varchar2(200));
commit;
 alter table diplome add constraint pk_diplome_001 primary key (seria,numar);
 alter table diplome add constraint fk_diplome_001 foreign key (seria_lot,nr_inceput,nr_sfarsit) references lot_diplome (seria_lot,nr_inceput,nr_sfarsit);
 alter table diplome add constraint fk_diplome_002 foreign key (tip_certificat) references tipuri_diplome (tip_certificat);
commit;


create or replace trigger trg_diplome_001
before insert or update
on diplome
referencing old as old new as new
for each row
begin
:new.modificat_de := user;
end trg_diplome_001;
commit;

create or replace trigger trg_diplome_002
before insert or update
on diplome
referencing old as old new as new
for each row
begin
:new.modificat_la := sysdate;
end trg_diplome_002;
commit; 

insert into diplome (seria_lot,nr_inceput,nr_sfarsit,tip_certificat,seria,numar,activa,acordata,descriere) values ('X','0','0',0,'X','0','D','N','dummy');
commit;
 
 


