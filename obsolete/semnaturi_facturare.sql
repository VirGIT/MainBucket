insert into semnaturi_rj (de_la,la,unitier_cod,matricol,nume,nume_n,foto) values (
to_date('01.01.1900','dd.mm.yyyy'),null,'F1014','1014','Carmen Anderson',null,empty_blob());
insert into semnaturi_rj (de_la,la,unitier_cod,matricol,nume,nume_n,foto) values (
to_date('01.01.1900','dd.mm.yyyy'),null,'F2663','2663','Gicu Ciobanu',null,empty_blob());
insert into semnaturi_rj (de_la,la,unitier_cod,matricol,nume,nume_n,foto) values (
to_date('01.01.1900','dd.mm.yyyy'),null,'F1896','1896','Danut Ursache',null,empty_blob());
insert into semnaturi_rj (de_la,la,unitier_cod,matricol,nume,nume_n,foto) values (
to_date('01.01.1900','dd.mm.yyyy'),null,'F26','26','Dorin Chiorcea',null,empty_blob());
insert into semnaturi_rj (de_la,la,unitier_cod,matricol,nume,nume_n,foto) values (
to_date('01.01.1900','dd.mm.yyyy'),null,'F90','90','Eduard Dumea',null,empty_blob());
insert into semnaturi_rj (de_la,la,unitier_cod,matricol,nume,nume_n,foto) values (
to_date('01.01.1900','dd.mm.yyyy'),null,'F213','213','Gabriela Gheorghiu',null,empty_blob());
insert into semnaturi_rj (de_la,la,unitier_cod,matricol,nume,nume_n,foto) values (
to_date('01.01.1900','dd.mm.yyyy'),null,'F2319','2319','Corneliu Groza',null,empty_blob());
insert into semnaturi_rj (de_la,la,unitier_cod,matricol,nume,nume_n,foto) values (
to_date('01.01.1900','dd.mm.yyyy'),null,'F777','777','Mariana Constantin',null,empty_blob());
insert into semnaturi_rj (de_la,la,unitier_cod,matricol,nume,nume_n,foto) values (
to_date('01.01.1900','dd.mm.yyyy'),null,'F104','104','Romeo Popescu',null,empty_blob());
insert into semnaturi_rj (de_la,la,unitier_cod,matricol,nume,nume_n,foto) values (
to_date('01.01.1900','dd.mm.yyyy'),null,'111','2510','Valeriu Popa',null,empty_blob());
insert into semnaturi_rj (de_la,la,unitier_cod,matricol,nume,nume_n,foto) values (
to_date('01.01.1900','dd.mm.yyyy'),null,'F2886','2886','Edmond Mihalache',null,empty_blob());
insert into semnaturi_rj (de_la,la,unitier_cod,matricol,nume,nume_n,foto) values (
to_date('01.01.1900','dd.mm.yyyy'),null,'F2611','2611','Radu Hincu',null,empty_blob());
commit;

--update angajati set usercros_nume = 'EDMONDM' where matricol = 2886;

--select * from angajati where matricol in (2886,2611,2510,2663,1896,26,90,213,2319,777,104)

--select foto from semnaturi_rj where matricol = (select distinct matricol from angajati where usercros_nume = user) and sysdate between de_la and nvl(la,sysdate) semnatura


