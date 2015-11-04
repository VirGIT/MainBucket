drop table clase_documente cascade constraints;
drop table tipuri_documente cascade constraints;
drop table tipuri_contracte cascade constraints;
drop table tipuri_plata cascade constraints;
commit;

create table tipuri_plata (
tip varchar2(5) primary key,
denumire varchar2(100)
);
commit;
insert into tipuri_plata (tip,denumire) values ('LUNAR','Lunar');
insert into tipuri_plata (tip,denumire) values ('BLNAR','Bilunar');
insert into tipuri_plata (tip,denumire) values ('TRIMT','Trimestrial');
insert into tipuri_plata (tip,denumire) values ('SEMST','Semestrial');
insert into tipuri_plata (tip,denumire) values ('ANUAL','Anual');
insert into tipuri_plata (tip,denumire) values ('5ZLE','La 5 zile lucratoare');
insert into tipuri_plata (tip,denumire) values ('10ZLE','La 10 zile lucratoare');
insert into tipuri_plata (tip,denumire) values ('15ZLE','La 15 zile lucratoare');
insert into tipuri_plata (tip,denumire) values ('45ZLE','La 45 zile lucratoare');
insert into tipuri_plata (tip,denumire) values ('ALTUL','Altul');
commit;


create table clase_documente (
clasa varchar2(5) primary key,
denumire varchar2(100)
);
commit;
insert into clase_documente (clasa,denumire) values ('DFID','Documente fiscale de datorie');
insert into clase_documente (clasa,denumire) values ('DNFD','Documente nefiscale de datorie');
insert into clase_documente (clasa,denumire) values ('DOCID','Documente de identitate');
insert into clase_documente (clasa,denumire) values ('STAT','Stat de plata');
insert into clase_documente (clasa,denumire) values ('CERT','Certificate');
insert into clase_documente (clasa,denumire) values ('ADEV','Adeverinte');
insert into clase_documente (clasa,denumire) values ('ATEST','Atestate');
insert into clase_documente (clasa,denumire) values ('DIPL','Diplome');
insert into clase_documente (clasa,denumire) values ('ALTE','Altele');
commit;


create table tipuri_documente (
tip varchar2(5) primary key,
clasa varchar2(5),
denumire varchar2(100)
);
commit;
alter table tipuri_documente add constraint fk_clasa_document foreign key (clasa) references clase_documente (clasa) on delete cascade;
commit;
insert into tipuri_documente (tip,clasa,denumire) values ('FF','DFID','Factura fiscala');
insert into tipuri_documente (tip,clasa,denumire) values ('BF','DFID','Bon Fiscal');
insert into tipuri_documente (tip,clasa,denumire) values ('CHIT','DFID','Chitanta');
insert into tipuri_documente (tip,clasa,denumire) values ('FSAL','ALTE','Fluturas de salariu');
insert into tipuri_documente (tip,clasa,denumire) values ('GRAF','DNFD','Grafic de rambursare');
insert into tipuri_documente (tip,clasa,denumire) values ('CI','DOCID','Carte de identitate');
insert into tipuri_documente (tip,clasa,denumire) values ('BI','DOCID','Buletin de identitate');
insert into tipuri_documente (tip,clasa,denumire) values ('CN','CERT','Certificat de nastere');
insert into tipuri_documente (tip,clasa,denumire) values ('CC','CERT','Certificat de casatorie');
insert into tipuri_documente (tip,clasa,denumire) values ('ADM','ADEV','Adeverinta medicala');
insert into tipuri_documente (tip,clasa,denumire) values ('ADV','ADEV','Adeverinta de venit');
insert into tipuri_documente (tip,clasa,denumire) values ('CCOND','ALTE','Carnet de conducere');
insert into tipuri_documente (tip,clasa,denumire) values ('DMER','DIPL','Diploma de merit');
insert into tipuri_documente (tip,clasa,denumire) values ('DABS','DIPL','Diploma de absolvire');
insert into tipuri_documente (tip,clasa,denumire) values ('APROF','ATEST','Atestat profesional');
commit;


create table tipuri_contracte (
tip varchar2(5) primary key,
denumire varchar2(100)
);
commit;
insert into tipuri_contracte (tip,denumire) values ('CPS','Contract de prestare servicii');
insert into tipuri_contracte (tip,denumire) values ('CFS','Contract de furnizare servicii');
insert into tipuri_contracte (tip,denumire) values ('CCO','Contract de colaborare');
insert into tipuri_contracte (tip,denumire) values ('CIN','Contract de inchiriere');
insert into tipuri_contracte (tip,denumire) values ('CIM','Contract individual de munca');
commit;