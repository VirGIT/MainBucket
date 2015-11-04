create table destinatii_adeverinta_rj (
tip_adeverinta varchar2(30),
destinatie varchar2(40)
);

commit;

comment on column destinatii_adeverinta_rj.tip_adeverinta is 'Tipul adeverintei emise de APAVITAL';
comment on column destinatii_adeverinta_rj.destinatie is 'Destinatia (scopul emiterii adeverintei)';

commit;

insert into destinatii_adeverinta_rj values ('MEDICALA','medic de familie');
insert into destinatii_adeverinta_rj values ('MEDICALA','altele');
insert into destinatii_adeverinta_rj values ('MEDICALA','spital');
insert into destinatii_adeverinta_rj values ('MEDICALA','C.A.S.');
insert into destinatii_adeverinta_rj values ('SALARIAT','spital');
insert into destinatii_adeverinta_rj values ('SALARIAT','medic de familie');
insert into destinatii_adeverinta_rj values ('SALARIAT','banca');
insert into destinatii_adeverinta_rj values ('SALARIAT','tribunal');
insert into destinatii_adeverinta_rj values ('SALARIAT','altele');
insert into destinatii_adeverinta_rj values ('SALARIAT','C.A.S.');

commit;
