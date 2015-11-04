    select a.matricol,              
           initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40)) nume,
           p.denumire luna,
              sum(cros_hr.valvarang_num(a.matricol, p.id, 'VALREG', 'N') +
                  cros_hr.valvarang_num(a.matricol, p.id, 'VFUNC', 'N') +
                  cros_hr.valvarang_num(a.matricol, p.id, 'VECH', 'N') +
                  cros_hr.valvarang_num(a.matricol, p.id, 'VAL_CO_FARAPRIM', 'N')) venit
                  
      from angajati a, perioade_angajati p
      
     where to_char(p.dela,'yyyy') = &p_an
     group by a.matricol, initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40)), p.denumire
                                      
                                      order by 2
