/*
nr contracte bugetari pe sectoare
*/

select clascli_cod,unitier_cod,count(nr) nr_contracte from 
(
select cf.nr,cf.unitier_cod,t.clascli_cod from contracte_furnizare  cf,terti t where tipcontfur_cod='CAGE' and activ='D' and inchis='N' and cf.tert_id=t.id and t.CLASCLI_COD like 'UNIT_B%'
)
group by clascli_cod,unitier_cod

/*
nr contracte bugetari pe sectoare
*/