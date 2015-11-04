select
  decode (persoane_contact_terti (t.id), 
              null, 
              decode(t.tel,null,'fara telefon','Tel: '||t.tel), 
              'Tel: '||persoane_contact_terti (t.id)) contact,             
 c.id,
 c.seria, 
 gm.unitier_cod, 
 c.grupmas_id, 
 c.data_metrologica, 
 c.starcont_cod, 
 c.tipcont_cod, 
 c.regcont_cod, 
 gm.ruta_cod, 
 gm.centru, 
 gm.carnet, 
 initcap(t.nume||' '||t.localitate) client, 
 t.judet t_jud, 
 decode(gm.loccons_nr,0,'',gm.loccons_nr) loccons_nr, 
 gm.contrfurn_id, 
 lc.judet lc_jud, 
 lc.localitate lc_loc, 
 lc.strada_cod,
 lc.nr_strada, 
 initcap(decode(lc.bloc,null,'','Bl.')||lc.bloc||decode(lc.scara,null,'',' Sc.')||lc.scara||decode(lc.etaj,null,'',' Etj.')||lc.etaj||decode(lc.apartament,null,'',' Ap.')||lc.rest_adresa) adr, 
 initcap(s.denumire) str_den, 
 t.clascli_cod, 
 ui.denumire ui_den, 
 cc.denumire cc_den, 
 t.cod


FROM contoare c, terti t, grupuri_de_masura gm, locuri_consum lc, strazi s, unitati_ierarhice ui, clase_client cc, contracte_furnizare cf

where 
        clascli_cod like :p_clascli and gm.unitier_cod like :punitier and c.regcont_cod like :pregcont_cod
    and c.tipcont_cod like nvl(:p_tipcont_cod, '%')
    and c.tipcont_cod <> 'AGEPREL' and c.tipcont_cod <> 'CFICT' and c.starcont_cod <> 'LA_CLIENT' 
    and c.starcont_cod like decode(:p_starcont,'Montat','MONTAT','Indiferent','MONTAT','1') 
    and c.grupmas_id = gm.id   

    and gm.tert_id = cf.tert_id
    and cf.id = lc.contrfurn_id 
    and gm.loccons_nr = lc.nr and lc.tert_id = t.id 
    
    and lc.strada_cod = s.cod and lc.judet = s.judet and lc.localitate = s.localitate 
    and gm.unitier_cod = ui.cod and t.clascli_cod = cc.cod 
    and (
    (c.data_metrologica < to_date('09.10.2000','dd.mm.yyyy') and add_months(c.data_metrologica,24)<sysdate+:nrzile) or
    (c.data_metrologica >= to_date('09.10.2000','dd.mm.yyyy') and c.data_metrologica < to_date('02.06.2006','dd.mm.yyyy') and add_months(c.data_metrologica,36)<sysdate+:nrzile) or
    (c.data_metrologica >= to_date('02.06.2006','dd.mm.yyyy') and add_months(c.data_metrologica,60)<sysdate+:nrzile))
    
