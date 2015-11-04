select cc.doccit_id doc, ltrim(t.cod) "Cod client", ltrim(upper(t.nume)) "Client", adr."Adresa",
       cc.grupmas_id "Grup masura", ltrim(scont.seria) "Seria contor",
       ci.data "Data veche", ci.index_citit "Index vechi", cc.data "Data noua", cc.index_citit "Index nou",
       to_number(cc.index_citit) - to_number(ci.index_citit) "Consum", scont.stare "Stare"

from contoare_citite cc, terti t, grupuri_de_masura gm, citiri_contor ci, documente_citire dc,
(select ta.cod,
     decode(cf.nr_strada,null,s.denumire,ltrim(s.denumire)||' Nr.'||ltrim(cf.nr_strada))||
                decode(cf.bloc,null,'',' Bl.'||ltrim(cf.bloc))||
                decode(cf.scara,null,'',' Sc.'||ltrim(cf.scara))||
                decode(cf.etaj,null,'',' Et.'||ltrim(cf.etaj))||
                decode(cf.apartament,null,'',' Ap.'||ltrim(cf.apartament))||
                decode(cf.judet,null,'',' Jud:'||ltrim(cf.judet))||
                decode(cf.localitate,null,'',' Loc:'||ltrim(cf.localitate)) "Adresa"
                   from terti ta, 
                        strazi s,
                        contracte_furnizare cf
   where
    cf.tert_id = ta.id and
    cf.judet = s.judet and
    cf.localitate = s.localitate and
    cf.strada_cod = s.cod) adr,
    
    (select c.id, c.seria, sc.denumire stare from contoare c, stari_contor sc where c.starcont_cod = sc.cod) scont
    
where cc.doccit_id(+) = dc.id 
  and dc.nr = :nr_doc
  and t.cod = adr.cod(+)
  and gm.id = cc.grupmas_id 
  and t.cod = gm.simbol(+)
  and cc.contor_id = scont.id(+)
  and ci.id = (select max(id) from citiri_contor where contor_id = cc.contor_id and grupmas_id = cc.grupmas_id and id_document < 
                (select distinct dcit.id from documente_citire dcit where dcit.nr = :nr_doc))
  
  order by to_number(substr(t.cod,2))