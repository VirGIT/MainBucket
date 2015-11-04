select rownum,
       a.marca,
       nume,
       cnp,
       brut_gratif,
       cas,
       sanat,
       imp_venit,
       net_gratif,
       semnatura
  from (select angajat_matricol marca,
               initcap(substr(trim(aa.nume) || ' ' || trim(aa.initiala) || ' ' ||
                              trim(aa.prenume),
                              1,
                              40)) nume,
               aa.cnp cnp,
               to_number(round(valoare, 0)) brut_gratif,
               round(round(valoare, 0) * 0.105, 0) cas,
               round(round(valoare, 0) * 0.055, 0) sanat,
               round((round(valoare, 0) - 
			          round(round(valoare, 0) * 0.105, 0) -
                      round(round(valoare, 0) * 0.055, 0)) * 0.16,
                     0) imp_venit,
               
               round(valoare, 0) - round(round(valoare, 0) * 0.055) - round(round(valoare, 0) * 0.105, 0) -
               round((round(valoare, 0) - 
			          round(round(valoare, 0) * 0.105, 0) -
                      round(round(valoare, 0) * 0.055, 0)) * 0.16,
                     0) net_gratif,
               '...............................' semnatura
          from valori_variabila_angajat_gr a, angajati aa
         where a.angajat_matricol = aa.matricol
           and a.activ = 'N'
           and round(valoare, 0) > 0) a
