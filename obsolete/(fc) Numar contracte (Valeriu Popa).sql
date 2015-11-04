select distinct perid.luna, perid.perioada, 
sum(a1.u) Unitati_total, 
sum(a2.u) Unitati_luna, 
sum(a3.u) Unitati_BUGETARE, 
sum(a4.u) ASOCIATII_total, 
sum(a5.u) ASOCIATII_luna, 
sum(a6.u) PENTRU_ACM, 
sum(a7.u) CASNICI_total, 
sum(a8.u) CASNICI_luna 
from

(select substr(to_char(per.de_la,'dd.mm.yyyy'),4,2) luna, per.perioada from perioade_de_raportare pr,perioade per
where PR.PERIOADA=:p_perioada and per.de_la >=PR.DE_LA and per.la<=pr.la  
group by substr(to_char(per.de_la,'dd.mm.yyyy'),4,2),per.perioada order by 1) perid,

(select substr(to_char(per.de_la,'dd.mm.yyyy'),4,2) luna, per.perioada,count(*) U from contracte_furnizare cf,perioade_de_raportare pr,perioade per
where TRUNC(cf.CREAT_LA) BETWEEN TO_DATE('31.12.2000','dd.mm.yyyy') AND per.la  
AND CF.ACTIV='D'
AND SUBSTR(CF.NR,1,1) IN ('U')
and PR.PERIOADA=:p_perioada and per.de_la >=PR.DE_LA and per.la<=pr.la  
group by substr(to_char(per.de_la,'dd.mm.yyyy'),4,2),per.perioada order by 1) a1,

(select substr(to_char(per.de_la,'dd.mm.yyyy'),4,2) luna, per.perioada,count(*) U from contracte_furnizare cf,perioade_de_raportare pr,perioade per
where TRUNC(cf.CREAT_LA) BETWEEN per.de_la AND per.la  
AND CF.ACTIV='D'
AND SUBSTR(CF.NR,1,1) IN ('U')
and PR.PERIOADA=:p_perioada and per.de_la >=PR.DE_LA and per.la<=pr.la  
group by substr(to_char(per.de_la,'dd.mm.yyyy'),4,2),per.perioada order by 1) a2,

(select substr(to_char(per.de_la,'dd.mm.yyyy'),4,2) luna, per.perioada,count(*) U from contracte_furnizare cf,TERTI T,perioade_de_raportare pr,perioade per
where TRUNC(cf.CREAT_LA) BETWEEN TO_DATE('01.01.2000','dd.mm.yyyy') AND per.la  
AND CF.ACTIV='D'
AND CF.TERT_ID=T.ID
AND substr(t.clascli_cod,1,6)='UNIT_B'
AND SUBSTR(CF.NR,1,1) IN ('U')and PR.PERIOADA=:p_perioada and per.de_la >=PR.DE_LA and per.la<=pr.la  
group by substr(to_char(per.de_la,'dd.mm.yyyy'),4,2),per.perioada order by 1) a3,

(select substr(to_char(per.de_la,'dd.mm.yyyy'),4,2) luna, per.perioada,count(*) U from contracte_furnizare cf,perioade_de_raportare pr,perioade per
where TRUNC(cf.CREAT_LA) BETWEEN TO_DATE('31.12.2000','dd.mm.yyyy') AND per.la  
AND CF.ACTIV='D'
AND SUBSTR(CF.NR,1,1) IN ('A')and PR.PERIOADA=:p_perioada and per.de_la >=PR.DE_LA and per.la<=pr.la  
group by substr(to_char(per.de_la,'dd.mm.yyyy'),4,2),per.perioada order by 1) a4,

(select distinct a.luna, a.perioada, max(a.u) u from(
select substr(to_char(per.de_la,'dd.mm.yyyy'),4,2) luna, per.perioada,count(*) U from contracte_furnizare cf,perioade_de_raportare pr,perioade per
where TRUNC(cf.CREAT_LA) BETWEEN per.de_la AND per.la AND CF.ACTIV='D' AND SUBSTR(CF.NR,1,1) IN ('A')
and PR.PERIOADA=:p_perioada and per.de_la >=PR.DE_LA and per.la<=pr.la  
group by substr(to_char(per.de_la,'dd.mm.yyyy'),4,2),per.perioada
union all
select substr(to_char(per.de_la,'dd.mm.yyyy'),4,2) luna, per.perioada, 0 from perioade_de_raportare pr,perioade per
where PR.PERIOADA=:p_perioada and per.de_la >=PR.DE_LA and per.la<=pr.la
order by 1) a
group by a.luna, a.perioada
order by 1) a5,

(select luna, perioada,COUNT(*) U from (
select substr(to_char(per.de_la,'dd.mm.yyyy'),4,2) luna, per.perioada,substr(trim(cf.nr),2,5),count(*) n from contracte_furnizare cf,perioade_de_raportare pr,perioade per  
where cf.activ='D' AND SUBSTR(cf.NR,1,1) IN ('A','P') 
--AND TRUNC(CREAT_LA) BETWEEN TO_DATE('01.01.2000','dd.mm.yyyy') AND per.la  
AND TRUNC(cf.creat_la) BETWEEN TO_DATE('01.01.2000','dd.mm.yyyy') AND per.la   
and PR.PERIOADA=:p_perioada and per.de_la >=PR.DE_LA and per.la<=pr.la
group by substr(to_char(per.de_la,'dd.mm.yyyy'),4,2),per.perioada,substr(trim(nr),2,5))
where n>1   
group by luna,perioada order by 1) a6,

(select substr(to_char(per.de_la,'dd.mm.yyyy'),4,2) luna, per.perioada,count(*) U from contracte_furnizare cf,perioade_de_raportare pr,perioade per
where TRUNC(cf.CREAT_LA) BETWEEN TO_DATE('01.01.2000','dd.mm.yyyy') AND per.la  
AND CF.ACTIV='D'
AND SUBSTR(CF.NR,1,1) IN ('P')and PR.PERIOADA=:p_perioada and per.de_la >=PR.DE_LA and per.la<=pr.la  
group by substr(to_char(per.de_la,'dd.mm.yyyy'),4,2),per.perioada order by 1) a7,

(select substr(to_char(per.de_la,'dd.mm.yyyy'),4,2) luna, per.perioada,count(*) U from contracte_furnizare cf,perioade_de_raportare pr,perioade per
where TRUNC(cf.CREAT_LA) BETWEEN per.de_la AND per.la  
AND CF.ACTIV='D'
AND SUBSTR(CF.NR,1,1) IN ('P')and PR.PERIOADA=:p_perioada and per.de_la >=PR.DE_LA and per.la<=pr.la  
group by substr(to_char(per.de_la,'dd.mm.yyyy'),4,2),per.perioada order by 1) a8

where perid.luna = a1.luna and perid.perioada = a1.perioada
  and perid.luna = a2.luna and perid.perioada = a2.perioada
  and perid.luna = a3.luna and perid.perioada = a3.perioada
  and perid.luna = a4.luna and perid.perioada = a4.perioada
  and perid.luna = a5.luna and perid.perioada = a5.perioada
  and perid.luna = a6.luna and perid.perioada = a6.perioada
  and perid.luna = a7.luna and perid.perioada = a7.perioada
  and perid.luna = a8.luna and perid.perioada = a8.perioada
  
group by perid.luna, perid.perioada
order by 1