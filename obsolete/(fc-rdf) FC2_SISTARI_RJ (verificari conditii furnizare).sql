select odc.tert_id idtert, odc.data_dec, max(odc.note_dec) note_dec, odc.loccons_nr loc, odc.contrfurn_id contr, co.servfurn_nr serv, c.activa, c.nr
         
           from ordine_deconectare odc, contracte_furnizare cf, contorizari co, conditii_furnizare c
         
          where
         
          cf.id = odc.contrfurn_id
       and cf.activ = 'D'
       and cf.inchis = 'N'
       
       and co.contrfurn_id = odc.contrfurn_id
       and co.loccons_nr = odc.loccons_nr
       and c.contrfurn_id = odc.contrfurn_id
       and c.loccons_nr = odc.loccons_nr
       and c.servfurn_nr = co.servfurn_nr
         
       and odc.aprobat_dec = :p_aprobat_dec
       and odc.executat_rec = 'N'
       and odc.anulat = :p_anulat
       and odc.executat_dec = :p_executat_dec
       
       and odc.tert_id = (select tt.id from terti tt where tt.cod = 'U275')
         
          group by odc.tert_id, odc.data_dec, odc.loccons_nr, odc.contrfurn_id, co.servfurn_nr, c.activa, c.nr
          order by 4,8