select ang.*
from
   (select 
               cod "Cod UI",
               denui "Unitate Ierarhica",
               cods "Cod UI Superioara",
               denuis "Unitate Ierarhica Superioara",
               marca "Matricol",
               nume_intreg "Nume Intreg",
               cnp "CNP",
               functia "Functia",
               tip_func "Tipul Functiei",
               ani||'  ani' "Varsta",
               categ_angajat "Categorie Angajat",
               case 
            when ani < 20 then ' sub 20 ani'
            when ani between 20 and 29 then 'intre 20 si 29 ani'
            when ani between 30 and 39 then 'intre 30 si 39 ani'
            when ani between 40 and 49 then 'intre 40 si 49 ani'
            when ani between 50 and 59 then 'intre 50 si 59 ani'
            when ani between 60 and 65 then 'intre 60 si 65 ani'
            else 'peste 65 ani'
        end as "Grupa de Varsta"
          from (select initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' ||
                                      trim(a.prenume),
                                      1,
                                      40)) nume_intreg,             
                       a.cnp,
                       a.matricol marca,
                       lower(f.denumire) functia,
                       u.cod,
                       upper(u.denumire) denui,
                       uis.cod cods,
                       upper(uis.denumire) denuis,
                       f.tipfunc_cod tip_func,
                       to_char(floor(months_between(to_date('31.12.2012','dd.mm.yyyy'),to_date(substr(a.cnp,6,2)||'.'||substr(a.cnp,4,2)||'.19'||substr(a.cnp,2,2),'dd.mm.yyyy'))/12)) ani,
                       to_char(cros_hr.valvarang_char(aa.angajat_matricol,p.id,'CATEG_PERS','N')) as categ_angajat
                       
                  from alocari_stat_angajat     aa,
                       angajati                 a,
                       adrese_angajat           t,
                       unitati_ierarhice        u,
                       unitati_ierarhice        uis,
                       functii                  f,
                       valori_variabila_angajat v,
                       perioade_angajati        p
                
                 where aa.unitier_cod != 203
                   and aa.perang_id = p.id
                   and a.matricol < 8000
                   and a.matricol = aa.angajat_matricol
                   and p.denumire like &p_denumire
                   and a.matricol = t.angajat_matricol
                   and aa.unitier_cod = u.cod
                   and v.angajat_matricol = a.matricol
                   and v.perang_id = p.id
                   and v.varang_cod = 'FUNCTIA'
                   and f.cod = v.valoare
                   and u.unitier_cod = uis.cod
                   
                 --  and a.matricol in (2776,2729)
                   
                 order by 2,4,6,9) a
        
        order by 1
        ) ang
