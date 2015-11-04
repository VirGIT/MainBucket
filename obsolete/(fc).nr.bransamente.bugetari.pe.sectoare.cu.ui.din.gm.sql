/*
nr bransamente bugetari pe sectoare
*/


    select gm.unitier_cod, count(a.grupmas_id) bransamente_bugetari--, gm.*, a.*
    from contracte_furnizare cf, grupuri_de_masura gm, 
        (
        select * 
        from contorizari cz 
        where contrfurn_id<>0 
            and not exists (select 1 from conditii_furnizare where contrfurn_id=cz.contrfurn_id and loccons_nr=cz.loccons_nr
                               and servfurn_nr=cz.servfurn_nr and condfurn_nr=cz.condfurn_nr and activa='N' and validata='D')
        ) a
    where a.contrfurn_id=cf.id
          and cf.tert_id in (select id from terti where clascli_cod like 'UNIT_B%')
          AND a.condfurn_nr=(select max(nr) from conditii_furnizare cf1 
                                                               where a.contrfurn_id=cf1.contrfurn_id 
                                                               and a.loccons_nr=cf1.loccons_nr 
                                                               and a.servfurn_nr=cf1.servfurn_nr 
                                                               and cf1.activa='D' and cf1.validata='D' 
                                                               group by cf1.contrfurn_id,cf1.loccons_nr,cf1.servfurn_nr)          
          and a.grupmas_id in (select id from grupuri_de_masura where tipgrupmas_cod in ('AR','AIN') and simbol like 'U%' and ruta_cod<>'1')
          and GM.ID=a.grupmas_id
          --and gm.unitier_cod='S11A'
    group by gm.unitier_cod
    --and gm.id='29083'
    order by 1


/*
nr bransamente bugetari pe sectoare
*/