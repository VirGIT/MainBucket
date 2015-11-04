/*
begin ad_usr.set_user(user); end;
/
*/

select  
         balan.cont_cont cont
       , substr(balan.cont_cont, 1, 1) clasa
       , balan.denumire denumire
       , balan.sold0db sold_initial_db
       , balan.sold0cr sold_initial_cr
       , balan.rulajdb rulaj_curent_db
       , balan.rulajcr rula_curent_cr
       , balan.totaldb rulaj_cumulat_db
       , balan.totalcr rulaj_cumulat_cr
       , balan.solddb sold_db
       , balan.soldcr sold_cr
   from  balanta_analitica balan, conturi_vizibile contviz
  where balan.unitate_id = 461
    and  balan.cont_cont = contviz.cont_cont
    and  balan.unitate_id = contviz.unitate_id
    and  balan.perrap_perioada = 'Ian-dec 2012' -- VEZI PERIOADA !!!
    and  ( nvl( balan.sold0db, 0 ) <> 0 
         or  nvl( balan.sold0cr, 0 ) <> 0 
         or  nvl( balan.rulajdb, 0 ) <> 0 
         or  nvl( balan.rulajcr, 0 ) <> 0 
         or  nvl( balan.totaldb, 0 ) <> 0 
         or  nvl( balan.totalcr, 0 ) <> 0 
         or  nvl( balan.solddb , 0 ) <> 0 
         or  nvl( balan.soldcr , 0 ) <> 0 
            )

  and cros_co.get_atribc(balan.unitate_id , balan.cont_cont , 'CONT_COEZIUNE') = 'D'

  order by 1