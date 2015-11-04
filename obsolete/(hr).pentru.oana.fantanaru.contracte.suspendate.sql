select distinct an.matricol, an.stareang_cod contract,
             initcap(substr(trim(an.nume) || ' ' || trim(an.initiala) || ' ' ||
                                      trim(an.prenume),
                                      1,
                                      40)) nume_intreg,
             decode(aa.nr_strada,null,aa.strada,aa.strada||' Nr.'||ltrim(aa.nr_strada))||
                decode(aa.bloc,null,'',' Bl.'||ltrim(aa.bloc))||
                decode(aa.scara,null,'',' Sc.'||ltrim(aa.scara))||
                decode(aa.etaj,null,'',' Eaa.'||ltrim(aa.etaj))||
                decode(aa.apt,null,'',' Ap.'||ltrim(aa.apt))||
                decode(aa.cod_postal,null,'',' Cod Postal:'||trim(aa.cod_postal)
                || ', Jud.' || aa.judet || ', Loc.' || aa.localitate) adresa_detaliat
            
            from adrese_angajat aa, angajati an--, alocari_stat_angajat al--, perioade_angajati p
                   
                   where aa.valabila = 'D' and
                       --      an.activ = 'D' and
                             aa.angajat_matricol = an.matricol and
                          --   al.angajat_matricol = an.matricol and 
                          --   al.perang_id = p.id
                         --    and al.perang_id = :p_id
                              an.STAREANG_COD in ('50 "E" C.M.','51 "a" C.M.','52"E"')
                             
                             order by 3