create table val_ind_perf_rj (
perrap_cod varchar2(12),
unitier_cod varchar2(15),
angajat_matricol varchar2(15),
ind_cod varchar2(32),
numarator number(15,5),
numitor number(15,5),
corectie number(5),
creata_de varchar2(50),
creata_la date,
modificata_de varchar2(50),
modificata_la varchar2(50)
);
commit;


CREATE OR REPLACE TRIGGER TRG_INDPERF_MODDE
before insert or update
ON val_ind_perf_rj referencing old as old new as new
for each row
begin
:new.modificata_de := user;
end TRG_INDPERF_MODDE;
/

CREATE OR REPLACE TRIGGER TRG_INDPERF_MODLA
before insert or update
ON val_ind_perf_rj referencing old as old new as new
for each row
begin
:new.modificata_la := sysdate;
end TRG_INDPERF_MODLA;
/