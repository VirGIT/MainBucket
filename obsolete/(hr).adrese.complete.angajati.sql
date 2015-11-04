select distinct aa.angajat_matricol, 
             initcap(substr(trim(an.nume) || ' ' || trim(an.initiala) || ' ' ||
                                      trim(an.prenume),
                                      1,
                                      40)) nume_intreg,
             decode(aa.nr_strada,null,aa.strada,'Str.'||aa.strada||' Nr.'||ltrim(aa.nr_strada))||
                decode(aa.bloc,null,'',' Bl.'||ltrim(aa.bloc))||
                decode(aa.scara,null,'',' Sc.'||ltrim(aa.scara))||
                decode(aa.etaj,null,'',' Eaa.'||ltrim(aa.etaj))||
                decode(aa.apt,null,'',' Ap.'||ltrim(aa.apt))||
                decode(aa.cod_postal,null,'',' Cod Postal:'||trim(aa.cod_postal))
                || ', Jud.' || aa.judet || ', Loc.' || aa.localitate adresa_detaliat
                
                   from adrese_angajat aa, angajati an
                   where aa.valabila = 'D' and
                             an.activ = 'D' and
                             aa.angajat_matricol = an.matricol
