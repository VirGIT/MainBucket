/*
numar de persoane pe categorii de clienti si sectoare
*/ 

select decode(cfur.TIPCONTFUR_COD,'CAGE','AGENTI ECONOMICI','CASO','ASOCIATII','CPOP','AB.CASNICI') tip_abonat,
         ui.denumire,CFUR.unitier_cod,cfur.LOCALITATE,sum(va.VALOARE) nr_persoane
from conditii_furnizare cf,valori_atribut va,contracte_furnizare cfur,unitati_ierarhice ui 
where contrfurn_id=cf.CONTRFURN_ID and loccons_nr=cf.loccons_nr and servfurn_nr=cf.servfurn_nr 
         and cf.nr=(select max(nr) from conditii_furnizare cf1 where cf.contrfurn_id=cf1.contrfurn_id and cf.loccons_nr=cf1.loccons_nr and cf.servfurn_nr=cf1.servfurn_nr group by cf1.contrfurn_id,cf1.loccons_nr,cf1.servfurn_nr)
         and cf.activa='D' and cf.validata='D' 
         --and cf.tiptarif_cod LIKE ('APA%')
         --and cf.tiptarif_cod not IN ('ACM_AGE','ACM_ASO','ACM_POP')
         and cfur.id=cf.CONTRFURN_ID
         and ui.COD=cfur.unitier_COD
         and va.id=cf.ATRIB_ID and va.atrib_cod='PERS' 
group by cfur.tipcontfur_cod,cfur.unitier_cod,localitate,ui.denumire

/*
numar de persoane pe categorii de clienti si sectoare
*/ 
