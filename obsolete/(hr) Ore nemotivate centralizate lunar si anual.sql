select * from
(select a.matricol,
       initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40)) nume,
        sum(cros_hr.valvarang_num(matricol, p.id, 'ONEM', 'N')) - 8 *
        max(cros_hr.valvarang_num(matricol, p.id, 'MOTIVATE', '')) ore_nemotivate
                   
              from angajati a, perioade_angajati p
              
             where to_char(dela,'yyyy') = &p_an
             group by a.matricol, initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40))
) nemotivate

where nemotivate.ore_nemotivate <> 0             