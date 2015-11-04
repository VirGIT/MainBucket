select
         pa.denumire "Perioada", to_number(a.matricol) "Matricol",
         fun.de_la "Inceput alocare", fun.pana_la "Sfarsit alocare",
         initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume), 1, 40)) "Nume", a.cnp "CNP",
         upper(fun.unitier_cod || ' - ' || ui.denumire) "Unitate Ierarhica",
         fun.cod_func||' - '||lower(fun.den_fun) "Functia",
         fun.tipfunc_cod||' - '||tf.denumire "Tip functie",
         fun.nr_luni_in_functie "Nr. luni in functie",
         fun.regimlucru_cod||' - '||rl.denumire||' ('||rl.descriere||')' "Regim lucru",
         fun.cod_categ_post||' - '||upper(fun.den_categ_post) "Categorie post",
         p.cod||' - '||p.denumire "Post",
         to_date(fun.data_ang_soc,'dd.mm.yyyy') "Data angajarii APAVITAL",
         case when to_date(cros_hr.atribut_angajat(a.matricol,'DATA_LICH'),'dd.mm.yyyy') between fun.de_la and nvl(fun.pana_la, trunc(sysdate)) 
          then to_date(cros_hr.atribut_angajat(a.matricol,'DATA_LICH'),'dd.mm.yyyy') else null end as "Data Lichidarii",
         case when to_date(cros_hr.atribut_angajat(a.matricol,'DATA_REL'),'dd.mm.yyyy') between fun.de_la and nvl(fun.pana_la, trunc(sysdate)) 
          then to_date(cros_hr.atribut_angajat(a.matricol,'DATA_REL'),'dd.mm.yyyy') else null end as "Data Reluarii",
          
         case when fun.pana_la is not null then 'Functie alocata de la: '||fun.de_la||' pana la: '||fun.pana_la
                  else 'Functie actuala / Alocare incepand cu data de: '||fun.de_la end as "Eveniment"
         
from hr_functii_rj fun, alocari_angajat ala, angajati a, unitati_ierarhice ui, tipuri_functie tf, regimuri_de_lucru rl, posturi p, perioade_angajati pa

where
    fun.matricol = ala.angajat_matricol
   and fun.de_la = ala.de_la
   and fun.tipfunc_cod = tf.cod
   and fun.regimlucru_cod = rl.cod
   and fun.cod_categ_post = p.categpost_cod
   and a.matricol = ala.angajat_matricol
   and ala.post_id = p.id
   and ui.cod = fun.unitier_cod
   and ui.unitate_id = 461
   and pa.denumire = :perioada
   and fun.de_la between pa.dela and pa.la
   
   order by 2,5
   
