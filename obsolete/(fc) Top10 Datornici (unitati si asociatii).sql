--din raportul actual
select t.cod, t.nume, b.sold, sum(a.sold) sold_penalitate, nvl(b.sold,0)+nvl(sum(a.sold),0) total from 
(
--PENALITATILE NEFACTURATE

(select a.tert_id, a.penalizare sold
from penalizari_de_incasat a, facturi_furnizare b
where b.id=a.nr_doc_notif
)



UNION all
--PENALITATILE DIN SOLD
(select st.tert_id, st.sold    
from solduri_tert st, facturi_furnizare ff
where st.sold<>0 
and st.idorg=ff.id and st.tip='PFP' 
)
                


UNION all
--PENALITATI PT FACTURI NEACHITATE
(select st.tert_id, round(cros_fact.valoare_penalizare(st.id,trunc(sysdate)),2) sold
from solduri_tert st
where st.sold<>0 and st.tip='FP'
)
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



UNION all
-- penalitati facturate pe facturi furnizare
(select st.tert_id, st.sold_lei sold
from solduri_tert st where st.in_sold='D' and st.tip='FP' and st.cont_cont='461.01'
)



) a,
(select distinct soldtert.tert_id, sum(soldtert.sold_lei) sold
           from solduri_tert soldtert, terti tert
          where soldtert.tert_id = tert.id
            and soldtert.tip = 'FP'
            and soldtert.in_sold = 'D'
            and tert.cod like 'A%'
            and soldtert.cont_cont like '411%'
                                group by soldtert.tert_id) b
--
-- cage, caso, cpop, cvid, cspec
-- tipuri_contract_furnizare
, terti t
where  A.TERT_ID=t.id
    and T.JUDET = 'IASI' and T.LOCALITATE = 'IASI'
            and t.cod like 'A%'
            and a.tert_id = b.tert_id(+)
group by t.cod, t.nume, b.sold
order by 5 desc

