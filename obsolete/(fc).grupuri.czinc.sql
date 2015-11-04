/*
grupuri czinc
*/

select a.*, cz.grupmas_id,cz.tipcz_cod 
from
(select cfur.nr,cf.loccons_nr,CFUR.unitier_cod,cf.SERVFURN_NR,cf.NR cfnr,cfur.id
--,cz.GRUPMAS_ID,cz.TIPCZ_COD
	   from conditii_furnizare cf
	   --,valori_atribut va
	   ,contracte_furnizare cfur
	   --,unitati_ierarhice ui
	   --,contorizari cz 
	   where cfur.tipcontfur_cod like '%' 
	   and contrfurn_id=cf.CONTRFURN_ID and loccons_nr=cf.loccons_nr and servfurn_nr=cf.servfurn_nr 
	   and cf.nr=(select max(nr) from conditii_furnizare cf1 where cf.contrfurn_id=cf1.contrfurn_id and cf.loccons_nr=cf1.loccons_nr and cf.servfurn_nr=cf1.servfurn_nr group by cf1.contrfurn_id,cf1.loccons_nr,cf1.servfurn_nr)
	   and cf.activa='D' and cf.validata='D' 
	   and cf.tiptarif_cod like ('%_CZ')
	   and cfur.id=cf.CONTRFURN_ID and cfur.nr<>'U0') a,
	   contorizari cz
where
cz.contrfurn_id=a.id and cz.LOCCONS_NR=a.loccons_nr and cz.SERVFURN_NR=a.SERVFURN_NR and cz.condfurn_nr=a.cfnr
	   and cz.TIPCZ_COD='CZINC'
/*
grupuri czinc
*/