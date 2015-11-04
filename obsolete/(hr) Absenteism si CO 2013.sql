/*
Script-ul aduce numarul de ore/zile absente de la serviciu pe parcursul unui an, defalcat pe luni,
din ore nemotivate, concedii medicate, de maternitate, concedii fara salariu, concedii de odihna ...
*/
select  uis.cod||' -  '||uis.denumire directia, 
        u.cod||' -  '||u.denumire unitate, 
        a.matricol, 
        p.denumire,
        initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40)) nume,    
        sum(cros_hr.valvarang_num(matricol, p.id, 'ONEM','N')) - 8 *
        max(cros_hr.valvarang_num(matricol, p.id, 'MOTIVATE','')) ore_nemotivate,
        cros_hr.valvarang_num(matricol, p.id, 'TZ_B','N') zile_cm,
        cros_hr.valvarang_num(matricol, p.id, 'ZCS','N') zile_cfs,
        cros_hr.valvarang_num(matricol, p.id, 'ZI_SAR_SOC','N')+
        cros_hr.valvarang_num(matricol, p.id, 'ZI_SAR_CAS','N')+
        cros_hr.valvarang_num(matricol, p.id, 'ZDSAR_CAS','N') zile_maternitate,
        cros_hr.valvarang_num(matricol, p.id, 'Z_CO','N') zile_co
                           
     from angajati a, alocari_stat_angajat aa, perioade_angajati p, unitati_ierarhice u, unitati_ierarhice uis
              
             where     a.unitier_cod = u.cod and aa.unitier_cod = u.cod and aa.angajat_matricol = a.matricol and aa.perang_id = p.id 
                   and a.activ = 'D' and aa.unitier_cod <> '300' 
                   and u.unitier_cod = uis.cod
                   and to_char(dela,'yyyy') = 2013
             group by 
             u.cod||' -  '||u.denumire, uis.cod||' -  '||uis.denumire,
             a.matricol, p.denumire, initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40)), p.id
             having
        cros_hr.valvarang_num(matricol, p.id, 'ONEM','N') - 8 *
        cros_hr.valvarang_num(matricol, p.id, 'MOTIVATE','') +
        cros_hr.valvarang_num(matricol, p.id, 'TZ_B','N') +
        cros_hr.valvarang_num(matricol, p.id, 'ZCS','N') +
        cros_hr.valvarang_num(matricol, p.id, 'ZI_SAR_SOC','N') +
        cros_hr.valvarang_num(matricol, p.id, 'ZI_SAR_CAS','N') +
        cros_hr.valvarang_num(matricol, p.id, 'ZDSAR_CAS','N') +
        cros_hr.valvarang_num(matricol, p.id, 'Z_CO','N') <> 0
       
order by 5, p.id
