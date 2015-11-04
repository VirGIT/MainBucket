       select
       'Client :'||chr(10)||
     t.nume|| ' - ' || t.cod||chr(10)||
     'Adresa client :'||chr(10)||
     decode(cf.nr_strada,null,s.denumire,'Str:'||ltrim(s.denumire)||' Nr.'||ltrim(cf.nr_strada))||
                decode(cf.bloc,null,'',' Bl.'||ltrim(cf.bloc))||
                decode(cf.scara,null,'',' Sc.'||ltrim(cf.scara))||
                decode(cf.etaj,null,'',' Et.'||ltrim(cf.etaj))||
                decode(cf.apartament,null,'',' Ap.'||ltrim(cf.apartament))||
                decode(cf.rest_adresa,null,'',' '||ltrim(cf.rest_adresa))||chr(10)||
                decode(cf.cod_postal,null,'',' CP:'||ltrim(cf.cod_postal))||
                decode(cf.judet,null,'',' Jud:'||ltrim(cf.judet))||
                decode(cf.localitate,null,'',' Loc:'||ltrim(cf.localitate))
                 adresa_detaliat
                   from terti t, 
                          strazi s,
                          contracte_furnizare cf
    where ( upper(t.cod) = :x_cod_client ) and
                cf.tert_id = t.id and
                cf.judet = s.judet and
                cf.localitate = s.localitate and
                cf.strada_cod = s.cod