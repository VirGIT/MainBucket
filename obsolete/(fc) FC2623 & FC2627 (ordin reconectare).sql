SELECT  x.tert                AS x_tert,
        x.cod_client          AS x_cod_client,
        x.nume_client         AS x_nume_client,
        x.adresa_client       AS x_adresa_client,
        ROUND(SUM(x.sold),2)  AS x_valoare_sold,
        ROUND((penx.sold),2)  AS x_penalitati,
        COUNT(x.nr_doc)       AS x_nr_facturi,
        x.data_deconectarii   AS x_data_deconectarii,
        x.data_reconectarii   AS x_data_reconectarii,
        x.aprobat_dec_la      AS x_aprobat_dec_la,
        x.aprobat_rec_la      AS x_aprobat_rec_la,
        x.note_deconectare    AS x_note_deconectare,
        x.note_reconectare    AS x_note_reconectare,
        x.nr_notificare       AS x_nr_notificare,
        x.data_notificare     AS x_data_notificare,
        x.nr_loccons          AS x_nr_loccons,
        x.adresa_loccons      AS x_adresa_loccons,
        case when y.tip_contor is null then '  -' else y.tip_contor end AS x_tip_contor,
        case when y.seria_contor is null then '  -' else y.seria_contor end AS x_seria_contor, 
        case when y.sigiliu_contor is null then '  -' else y.sigiliu_contor end AS x_sigiliu_contor, 
        case when y.specificatii_contor is null then 'CONTOR DEMONTAT' else y.specificatii_contor end AS x_specificatii_contor, 
        x.cod_ui              AS x_cod_ui, 
        x.cod_den_ui          AS x_cod_ui, 
     -- x.responsabili_consum AS x_responsabili_consum,
        x.adresa_fact         AS x_adresa_fact,
        x.adresa_pct_consum   AS x_adresa_pct_consum,
        x.persoane_contact    AS x_persoane_contact,
     -- x.semnatura_dir_gen,          
        x.nume_dir_gen        AS x_nume_dir_gen,
     -- x.semnatura_birou,    
        x.nume_birou          AS x_nume_birou,
     -- x.semnatura_sef_facturare,
        x.nume_sef_facturare  AS x_sef_facturare,
        x.intocmit_de         AS x_intocmit_de   
          
                     
FROM
 
(SELECT t.ID AS tert, od.id as idod,
        t.cod AS cod_client,
        t.nume AS nume_client,
        t.strada || ' ' || t.nr || ', Bl. ' || t.bloc || ', Sc. ' ||t.scara || ', Et. ' || t.etaj || ', Ap. ' || t.apart || ', ' ||t.localitate || ', ' || 'Jud.' || t.judet AS adresa_client,
        od.data_dec AS data_deconectarii,
        od.data_rec AS data_reconectarii,
        od.aprobat_dec_la AS aprobat_dec_la,
        od.aprobat_rec_la AS aprobat_rec_la,
        od.note_dec AS note_deconectare,
        od.note_rec AS note_reconectare,
        od.nr AS nr_notificare,
        od.DATA AS data_notificare,
        od.loccons_nr AS nr_loccons,
        s.denumire || ', Nr.' || lc.nr_strada || ', ' ||lc.localitate || ', Jud.' || lc.judet AS adresa_loccons,
        st.sold_lei AS sold,
        st.data_doc, 
        st.nr_doc,
        od.data_dec,
        u.cod AS cod_ui, 
        u.cod ||' - '|| u.denumire AS cod_den_ui, 
        u.responsabili_consum AS responsabili_consum,
        s2.denumire|| ' ' || cf.nr_strada || ', Bl. ' || cf.bloc || ', Sc. ' ||cf.scara || ', Et. ' || cf.etaj || ', Ap. ' || cf.apartament || ', ' ||cf.localitate || ', ' || 'Jud.' || cf.judet AS adresa_fact,
        s.denumire|| ' ' || gm.numar || ', Bl. ' || gm.bloc || ', Sc. ' ||gm.scara || ', Et. ' || gm.etaj || ', Ap. ' || gm.apart || ', ' ||gm.localitate || ', ' || 'Jud.' || gm.judet AS adresa_pct_consum,
        case when t.cod like 'P%' then t.tel else persoane_contact_terti (t.id) end AS persoane_contact,
    -- (select foto from semnaturi_rj where unitier_cod = 'DIR_GEN' and sysdate between de_la and nvl(la,sysdate)) semnatura_dir_gen,
       (select nume from semnaturi_rj where unitier_cod = 'DIR_GEN' and sysdate between de_la and nvl(la,sysdate)) nume_dir_gen,
    -- (select foto from semnaturi_rj where unitier_cod = rajac_pkg.get_ui_rel_cod(cf.unitier_cod,'BIR_COM') and sysdate between de_la and nvl(la,sysdate)) semnatura_birou,
        nvl((select nume from semnaturi_rj where unitier_cod = rajac_pkg.get_ui_rel_cod(cf.unitier_cod,'BIR_COM') and sysdate between de_la and nvl(la,sysdate)),cf.unitier_cod) nume_birou,
    -- (select foto from semnaturi_rj where unitier_cod = 'FACTURARE' and sysdate between de_la and nvl(la,sysdate)) semnatura_sef_facturare,
       (select nume from semnaturi_rj where unitier_cod = 'FACTURARE' and sysdate between de_la and nvl(la,sysdate)) nume_sef_facturare,
        cros_ad.nume_complet(user) intocmit_de

FROM ORDINE_DECONECTARE  od,
         TERTI                t,
         STRAZI               s,
         LOCURI_CONSUM       lc,
         SOLDURI_TERT        st,
         GRUPURI_DE_MASURA   gm, 
         UNITATI_IERARHICE    u,
         CONTRACTE_FURNIZARE cf,
         STRAZI              s2
        
WHERE     od.anulat = 'N'
      AND od.tert_id = t.ID
      AND od.tert_id = lc.tert_id
      AND lc.tert_id = t.ID
      AND lc.judet = s.judet
      AND lc.localitate = s.localitate
      AND lc.strada_cod = s.cod 
      AND t.ID = st.tert_id(+)
      AND od.tert_id = t.ID 
      AND lc.tert_id = t.ID
      AND st.tip(+) = 'FP'
      AND st.in_sold(+) = 'D'
      AND st.cont_cont(+) LIKE '411%'
      AND gm.tert_id = t.ID 
      AND od.loccons_nr = lc.nr
      AND u.cod = od.unitier_cod 
      AND cf.tert_id = t.ID 
      AND cf.judet = s2.judet
      AND cf.localitate =  s2.localitate
      AND cf.strada_cod = s2.cod
      AND gm.loccons_nr = lc.nr
      AND od.contrfurn_id = cf.ID 
                           and od.aprobat_dec = 'D'
                           and od.executat_dec = 'D'
						   and od.aprobat_rec = 'D'
                           and od.executat_rec = 'N'  
                           and od.anulat = 'N'
      AND od.ID = :p_id
) x,

(select distinct tt.id as idtert, ord.id as idord,
                c.tipcont_cod AS tip_contor,
                c.seria AS seria_contor,
                c.sigiliu AS sigiliu_contor,
                rco.denumire AS specificatii_contor
                
                from terti tt,
                        locuri_consum loc,
                        contracte_furnizare conf,
                        grupuri_de_masura gma,
                        contoare c,
                        regimuri_contor rco,
                        ordine_deconectare ord
                     
           where tt.id = gma.tert_id
             and tt.id = conf.tert_id
             and tt.id = loc.tert_id
             and conf.id = loc.contrfurn_id 
             and gma.loccons_nr = loc.nr
             and gma.contrfurn_id = conf.id
             and gma.activ = 'D'
             and (case when gma.grupmas_id is not null and exists (select con.grupmas_id from contoare con where con.grupmas_id = gma.id)    
                    then gma.id 
                            when gma.grupmas_id is null then gma.id
                    else gma.grupmas_id
                       end)  = c.grupmas_id  
             and c.tipcont_cod != 'EMITRADIO'
             and rco.tipcont_cod = c.tipcont_cod
             and rco.cod = c.regcont_cod 
             and rco.activ = 'D'
             and tt.id = ORD.TERT_ID
             and ORD.CONTRFURN_ID = conf.id
             and ORD.LOCCONS_NR = loc.nr
                           and ord.aprobat_dec = 'D'
                           and ord.executat_dec = 'D'
						   and ord.aprobat_rec = 'D'
                           and ord.executat_rec = 'N'  
                           and ord.anulat = 'N' 
             and ord.id = :p_id             
            ) y,

(select tert_id, sum(penal) sold
          from (
                select tert_id, sum(sold) penal
                  from (select st.tert_id, st.sold
                           from solduri_tert st, facturi_furnizare ff
                          where st.sold <> 0
                            and st.idorg = ff.id
                            and st.tip = 'PFP'
                            )
                 group by tert_id
                 
                UNION
                
                select tert_id, sum(sold) penal
                  from (select st.tert_id, st.sold_lei sold
                          from solduri_tert st
                         where st.in_sold = 'D'
                           and st.tip = 'FP'
                           and st.cont_cont = '461.01'
                           )
                 group by tert_id)
         group by tert_id
                
) penx
             
WHERE 
penx.tert_id (+) = x.tert and
y.idtert (+) = x.tert and
y.idord (+) = x.idod

GROUP BY x.tert,
         x.cod_client,
         x.nume_client,
         x.adresa_client,
         x.data_deconectarii,
         x.data_reconectarii,
         x.aprobat_dec_la,
         x.aprobat_rec_la,
         x.note_deconectare,
         x.note_reconectare,
         x.nr_notificare,
         x.data_notificare,
         x.nr_loccons,
         x.adresa_loccons,                     
         y.tip_contor,
         y.seria_contor,
         y.sigiliu_contor,
         y.specificatii_contor,
         x.cod_ui, 
         x.cod_den_ui,
      -- x.responsabili_consum,
         x.adresa_fact,
         x.adresa_pct_consum,
         x.persoane_contact,
      -- x.semnatura_dir_gen,          
         x.nume_dir_gen,
      -- x.semnatura_birou,    
         x.nume_birou,
      -- x.semnatura_sef_facturare,
         x.nume_sef_facturare,
         x.intocmit_de,
         penx.sold  
