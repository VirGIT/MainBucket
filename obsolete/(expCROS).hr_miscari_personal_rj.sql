select distinct upper(func.unitier_cod || ' - ' || ui.denumire) "Unitate Ierarhica",
                to_number(regexp_replace(a.matricol, '[A-Za-z]')) "Matricol",
                initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40)) "Nume",
                a.cnp "CNP",
                lower(func.den_fun) "Functia",
                lower(ps.denumire) "Post",
                upper(func.regimlucru_cod) "Regim Lucru",
                'Inceperea activitatii' "Eveniment",
                to_date(v.valoare,'dd.mm.yyyy') "Data Eveniment"
  from valori_variabila_angajat v,
       angajati                 a,
       hr_functii_rj            func,
       unitati_ierarhice        ui,
       perioade_angajati        p,
       posturi                  ps
 where v.perang_id = p.id
   and v.varang_cod = 'DATA_ANG'
   and v.angajat_matricol = a.matricol
   and to_date(v.valoare,'dd.mm.yyyy') - p.dela >= 0
   and a.matricol = func.matricol
   and to_date(v.valoare,'dd.mm.yyyy') between func.de_la 
   and nvl(func.pana_la, trunc(sysdate))
   and ui.cod = func.unitier_cod
   and ui.unitate_id = 461
   and func.cod_func = ps.functie_cod
   and ui.cod = ps.unitier_cod
   and p.denumire like &p_denumire

union all

select distinct upper(func.unitier_cod || ' - ' || ui.denumire) "Unitate Ierarhica",
                to_number(regexp_replace(a.matricol, '[A-Za-z]')) "Matricol",
                initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40)) "Nume",
                a.cnp "CNP",
                lower(func.den_fun) "Functia",
                lower(ps.denumire) "Post",
                upper(func.regimlucru_cod) "Regim Lucru",
                'Reluarea activitatii' "Eveniment",
                to_date(cros_hr.atribut_angajat(a.matricol,'DATA_REL'),'dd.mm.yyyy') "Data Eveniment"
  from angajati          a,
       perioade_angajati p,
       hr_functii_rj     func,
       unitati_ierarhice ui,
       posturi           ps
 where to_date(cros_hr.atribut_angajat(a.matricol,'DATA_REL'),'dd.mm.yyyy') - p.dela >= 0
   and a.matricol = func.matricol
   and ui.cod = func.unitier_cod
   and ui.unitate_id = 461
   and to_date(cros_hr.atribut_angajat(a.matricol,'DATA_REL'),'dd.mm.yyyy') between func.de_la 
   and nvl(func.pana_la, trunc(sysdate))
   and func.cod_func = ps.functie_cod
   and ui.cod = ps.unitier_cod
   and p.denumire like &p_denumire
   
union all
   
select distinct upper(func.unitier_cod || ' - ' || ui.denumire) "Unitate Ierarhica",
                to_number(regexp_replace(a.matricol, '[A-Za-z]')) "Matricol",
                initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40)) "Nume",
                a.cnp "CNP",
                lower(func.den_fun) "Functia",
                'NESPECIFICAT' "Post",
                upper(func.regimlucru_cod) "Regim Lucru",
                'Terminarea activitatii' "Eveniment",
                to_date(cros_hr.atribut_angajat(a.matricol,'DATA_LICH'),'dd.mm.yyyy') "Data Eveniment"
  from angajati          a,
       perioade_angajati p,
       hr_functii_rj     func,
       unitati_ierarhice ui  
 where to_date(cros_hr.atribut_angajat(a.matricol,'DATA_LICH'),'dd.mm.yyyy') - p.dela >= 0
   and a.matricol = func.matricol
   and ui.cod = func.unitier_cod
   and ui.unitate_id = 461
   and to_date(cros_hr.atribut_angajat(a.matricol,'DATA_LICH'),'dd.mm.yyyy') between func.de_la 
   and nvl(func.pana_la, trunc(sysdate)) 
   and to_char(to_date(cros_hr.atribut_angajat(a.matricol,'DATA_LICH'),'dd.mm.yyyy'),'mm') = to_char(to_date(p.dela,'dd.mm.yyyy'),'mm')
   and p.denumire like &p_denumire   
   
   order by 8,9,1,3,5,6,7
