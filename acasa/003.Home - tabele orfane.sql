drop sequence seq001_perioade_ani;
drop sequence seq002_perioade_luni;
drop table perioade cascade constraints;
commit;

create table perioade (
id char(8) primary key,
denumire varchar2(50),
de_la date,
la date
);
commit;

create sequence seq001_perioade_ani
minvalue 1000
start with 1000
increment by 1
cache 40;

create sequence seq002_perioade_luni
minvalue 2000
start with 2000
increment by 1
cache 40;

create or replace trigger trg001_perioade_ani
before insert on perioade for each row
when (new.denumire like 'Anul%')
begin
select 'ANUL'||to_char(seq001_perioade_ani.nextval)
into :new.id
from dual;
end;

create or replace trigger trg002_perioade_luni
before insert on perioade for each row
when (new.denumire not like 'Anul%')
begin
select 'LUNA'||to_char(seq002_perioade_luni.nextval)
into :new.id
from dual;
end;

insert into perioade (denumire,de_la,la) values ('Anul 2005', to_date('01.01.2005','dd.mm.yyyy'), to_date('31.12.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2005', to_date('01.01.2005','dd.mm.yyyy'), to_date('31.01.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2005', to_date('01.02.2005','dd.mm.yyyy'), to_date('28.02.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2005', to_date('01.03.2005','dd.mm.yyyy'), to_date('31.03.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2005', to_date('01.04.2005','dd.mm.yyyy'), to_date('30.04.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2005', to_date('01.05.2005','dd.mm.yyyy'), to_date('31.05.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2005', to_date('01.06.2005','dd.mm.yyyy'), to_date('30.06.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2005', to_date('01.07.2005','dd.mm.yyyy'), to_date('31.07.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2005', to_date('01.08.2005','dd.mm.yyyy'), to_date('31.08.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2005', to_date('01.09.2005','dd.mm.yyyy'), to_date('30.09.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2005', to_date('01.10.2005','dd.mm.yyyy'), to_date('31.10.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2005', to_date('01.11.2005','dd.mm.yyyy'), to_date('30.11.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2005', to_date('01.12.2005','dd.mm.yyyy'), to_date('31.12.2005','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2006', to_date('01.01.2006','dd.mm.yyyy'), to_date('31.12.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2006', to_date('01.01.2006','dd.mm.yyyy'), to_date('31.01.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2006', to_date('01.02.2006','dd.mm.yyyy'), to_date('28.02.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2006', to_date('01.03.2006','dd.mm.yyyy'), to_date('31.03.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2006', to_date('01.04.2006','dd.mm.yyyy'), to_date('30.04.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2006', to_date('01.05.2006','dd.mm.yyyy'), to_date('31.05.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2006', to_date('01.06.2006','dd.mm.yyyy'), to_date('30.06.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2006', to_date('01.07.2006','dd.mm.yyyy'), to_date('31.07.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2006', to_date('01.08.2006','dd.mm.yyyy'), to_date('31.08.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2006', to_date('01.09.2006','dd.mm.yyyy'), to_date('30.09.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2006', to_date('01.10.2006','dd.mm.yyyy'), to_date('31.10.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2006', to_date('01.11.2006','dd.mm.yyyy'), to_date('30.11.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2006', to_date('01.12.2006','dd.mm.yyyy'), to_date('31.12.2006','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2007', to_date('01.01.2007','dd.mm.yyyy'), to_date('31.12.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2007', to_date('01.01.2007','dd.mm.yyyy'), to_date('31.01.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2007', to_date('01.02.2007','dd.mm.yyyy'), to_date('28.02.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2007', to_date('01.03.2007','dd.mm.yyyy'), to_date('31.03.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2007', to_date('01.04.2007','dd.mm.yyyy'), to_date('30.04.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2007', to_date('01.05.2007','dd.mm.yyyy'), to_date('31.05.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2007', to_date('01.06.2007','dd.mm.yyyy'), to_date('30.06.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2007', to_date('01.07.2007','dd.mm.yyyy'), to_date('31.07.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2007', to_date('01.08.2007','dd.mm.yyyy'), to_date('31.08.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2007', to_date('01.09.2007','dd.mm.yyyy'), to_date('30.09.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2007', to_date('01.10.2007','dd.mm.yyyy'), to_date('31.10.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2007', to_date('01.11.2007','dd.mm.yyyy'), to_date('30.11.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2007', to_date('01.12.2007','dd.mm.yyyy'), to_date('31.12.2007','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2008', to_date('01.01.2008','dd.mm.yyyy'), to_date('31.12.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2008', to_date('01.01.2008','dd.mm.yyyy'), to_date('31.01.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2008', to_date('01.02.2008','dd.mm.yyyy'), to_date('29.02.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2008', to_date('01.03.2008','dd.mm.yyyy'), to_date('31.03.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2008', to_date('01.04.2008','dd.mm.yyyy'), to_date('30.04.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2008', to_date('01.05.2008','dd.mm.yyyy'), to_date('31.05.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2008', to_date('01.06.2008','dd.mm.yyyy'), to_date('30.06.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2008', to_date('01.07.2008','dd.mm.yyyy'), to_date('31.07.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2008', to_date('01.08.2008','dd.mm.yyyy'), to_date('31.08.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2008', to_date('01.09.2008','dd.mm.yyyy'), to_date('30.09.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2008', to_date('01.10.2008','dd.mm.yyyy'), to_date('31.10.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2008', to_date('01.11.2008','dd.mm.yyyy'), to_date('30.11.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2008', to_date('01.12.2008','dd.mm.yyyy'), to_date('31.12.2008','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2009', to_date('01.01.2009','dd.mm.yyyy'), to_date('31.12.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2009', to_date('01.01.2009','dd.mm.yyyy'), to_date('31.01.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2009', to_date('01.02.2009','dd.mm.yyyy'), to_date('28.02.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2009', to_date('01.03.2009','dd.mm.yyyy'), to_date('31.03.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2009', to_date('01.04.2009','dd.mm.yyyy'), to_date('30.04.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2009', to_date('01.05.2009','dd.mm.yyyy'), to_date('31.05.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2009', to_date('01.06.2009','dd.mm.yyyy'), to_date('30.06.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2009', to_date('01.07.2009','dd.mm.yyyy'), to_date('31.07.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2009', to_date('01.08.2009','dd.mm.yyyy'), to_date('31.08.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2009', to_date('01.09.2009','dd.mm.yyyy'), to_date('30.09.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2009', to_date('01.10.2009','dd.mm.yyyy'), to_date('31.10.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2009', to_date('01.11.2009','dd.mm.yyyy'), to_date('30.11.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2009', to_date('01.12.2009','dd.mm.yyyy'), to_date('31.12.2009','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2010', to_date('01.01.2010','dd.mm.yyyy'), to_date('31.12.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2010', to_date('01.01.2010','dd.mm.yyyy'), to_date('31.01.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2010', to_date('01.02.2010','dd.mm.yyyy'), to_date('28.02.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2010', to_date('01.03.2010','dd.mm.yyyy'), to_date('31.03.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2010', to_date('01.04.2010','dd.mm.yyyy'), to_date('30.04.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2010', to_date('01.05.2010','dd.mm.yyyy'), to_date('31.05.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2010', to_date('01.06.2010','dd.mm.yyyy'), to_date('30.06.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2010', to_date('01.07.2010','dd.mm.yyyy'), to_date('31.07.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2010', to_date('01.08.2010','dd.mm.yyyy'), to_date('31.08.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2010', to_date('01.09.2010','dd.mm.yyyy'), to_date('30.09.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2010', to_date('01.10.2010','dd.mm.yyyy'), to_date('31.10.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2010', to_date('01.11.2010','dd.mm.yyyy'), to_date('30.11.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2010', to_date('01.12.2010','dd.mm.yyyy'), to_date('31.12.2010','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2011', to_date('01.01.2011','dd.mm.yyyy'), to_date('31.12.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2011', to_date('01.01.2011','dd.mm.yyyy'), to_date('31.01.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2011', to_date('01.02.2011','dd.mm.yyyy'), to_date('28.02.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2011', to_date('01.03.2011','dd.mm.yyyy'), to_date('31.03.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2011', to_date('01.04.2011','dd.mm.yyyy'), to_date('30.04.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2011', to_date('01.05.2011','dd.mm.yyyy'), to_date('31.05.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2011', to_date('01.06.2011','dd.mm.yyyy'), to_date('30.06.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2011', to_date('01.07.2011','dd.mm.yyyy'), to_date('31.07.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2011', to_date('01.08.2011','dd.mm.yyyy'), to_date('31.08.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2011', to_date('01.09.2011','dd.mm.yyyy'), to_date('30.09.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2011', to_date('01.10.2011','dd.mm.yyyy'), to_date('31.10.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2011', to_date('01.11.2011','dd.mm.yyyy'), to_date('30.11.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2011', to_date('01.12.2011','dd.mm.yyyy'), to_date('31.12.2011','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2012', to_date('01.01.2012','dd.mm.yyyy'), to_date('31.12.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2012', to_date('01.01.2012','dd.mm.yyyy'), to_date('31.01.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2012', to_date('01.02.2012','dd.mm.yyyy'), to_date('29.02.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2012', to_date('01.03.2012','dd.mm.yyyy'), to_date('31.03.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2012', to_date('01.04.2012','dd.mm.yyyy'), to_date('30.04.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2012', to_date('01.05.2012','dd.mm.yyyy'), to_date('31.05.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2012', to_date('01.06.2012','dd.mm.yyyy'), to_date('30.06.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2012', to_date('01.07.2012','dd.mm.yyyy'), to_date('31.07.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2012', to_date('01.08.2012','dd.mm.yyyy'), to_date('31.08.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2012', to_date('01.09.2012','dd.mm.yyyy'), to_date('30.09.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2012', to_date('01.10.2012','dd.mm.yyyy'), to_date('31.10.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2012', to_date('01.11.2012','dd.mm.yyyy'), to_date('30.11.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2012', to_date('01.12.2012','dd.mm.yyyy'), to_date('31.12.2012','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2013', to_date('01.01.2013','dd.mm.yyyy'), to_date('31.12.2013','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2013', to_date('01.01.2013','dd.mm.yyyy'), to_date('31.01.2013','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2013', to_date('01.02.2013','dd.mm.yyyy'), to_date('28.02.2013','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2013', to_date('01.03.2013','dd.mm.yyyy'), to_date('31.03.2013','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2013', to_date('01.04.2013','dd.mm.yyyy'), to_date('30.04.2013','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2013', to_date('01.05.2013','dd.mm.yyyy'), to_date('31.05.2013','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2013', to_date('01.06.2013','dd.mm.yyyy'), to_date('30.06.2013','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2013', to_date('01.07.2013','dd.mm.yyyy'), to_date('31.07.2013','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2013', to_date('01.08.2013','dd.mm.yyyy'), to_date('31.08.2013','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2013', to_date('01.09.2013','dd.mm.yyyy'), to_date('30.09.2013','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2013', to_date('01.10.2013','dd.mm.yyyy'), to_date('31.10.2013','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2013', to_date('01.11.2013','dd.mm.yyyy'), to_date('30.11.2013','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2013', to_date('01.12.2013','dd.mm.yyyy'), to_date('31.12.2013','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2014', to_date('01.01.2014','dd.mm.yyyy'), to_date('31.12.2014','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2014', to_date('01.01.2014','dd.mm.yyyy'), to_date('31.01.2014','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2014', to_date('01.02.2014','dd.mm.yyyy'), to_date('28.02.2014','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2014', to_date('01.03.2014','dd.mm.yyyy'), to_date('31.03.2014','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2014', to_date('01.04.2014','dd.mm.yyyy'), to_date('30.04.2014','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2014', to_date('01.05.2014','dd.mm.yyyy'), to_date('31.05.2014','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2014', to_date('01.06.2014','dd.mm.yyyy'), to_date('30.06.2014','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2014', to_date('01.07.2014','dd.mm.yyyy'), to_date('31.07.2014','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2014', to_date('01.08.2014','dd.mm.yyyy'), to_date('31.08.2014','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2014', to_date('01.09.2014','dd.mm.yyyy'), to_date('30.09.2014','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2014', to_date('01.10.2014','dd.mm.yyyy'), to_date('31.10.2014','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2014', to_date('01.11.2014','dd.mm.yyyy'), to_date('30.11.2014','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2014', to_date('01.12.2014','dd.mm.yyyy'), to_date('31.12.2014','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Anul 2015', to_date('01.01.2015','dd.mm.yyyy'), to_date('31.12.2015','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Ianuarie 2015', to_date('01.01.2015','dd.mm.yyyy'), to_date('31.01.2015','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Februarie 2015', to_date('01.02.2015','dd.mm.yyyy'), to_date('28.02.2015','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Martie 2015', to_date('01.03.2015','dd.mm.yyyy'), to_date('31.03.2015','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Aprilie 2015', to_date('01.04.2015','dd.mm.yyyy'), to_date('30.04.2015','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Mai 2015', to_date('01.05.2015','dd.mm.yyyy'), to_date('31.05.2015','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iunie 2015', to_date('01.06.2015','dd.mm.yyyy'), to_date('30.06.2015','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Iulie 2015', to_date('01.07.2015','dd.mm.yyyy'), to_date('31.07.2015','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('August 2015', to_date('01.08.2015','dd.mm.yyyy'), to_date('31.08.2015','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Septembrie 2015', to_date('01.09.2015','dd.mm.yyyy'), to_date('30.09.2015','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Octombrie 2015', to_date('01.10.2015','dd.mm.yyyy'), to_date('31.10.2015','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Noiembrie 2015', to_date('01.11.2015','dd.mm.yyyy'), to_date('30.11.2015','dd.mm.yyyy'));
insert into perioade (denumire,de_la,la) values ('Decembrie 2015', to_date('01.12.2015','dd.mm.yyyy'), to_date('31.12.2015','dd.mm.yyyy'));
commit;