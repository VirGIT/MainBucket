select distinct 
         sel.marca, sel.nume, sel.cnp, sel.adresa, sel.functia, sel.cod||' - '||sel.denui unitatea, sel.compartiment, sel.data_angajarii, sel.vechime, sel.activ, 
         sel.an, sel.luna, sel.premii, sel.gratificatie, sel.spor_doctorat, sel.spor_conducere, spor_sofer, sel.ore_noapte, sel.ore_suplimentare, sel.ore_weekend,
         sel.valoare_co, sel.valoare_regie
from (select initcap(substr(trim(nume) || ' ' || trim(initiala) || ' ' ||
                                      trim(prenume),
                                      1,
                                      40)) nume,
                       a.cnp,
                       matricol marca,
                       replace(trim(trim(t.strada) || ' ' ||
                                    trim(t.nr_strada) || ' ' || trim(t.bloc) || ' ' ||
                                    trim(t.scara) || ' ' || trim(t.etaj) || ' ' ||
                                    trim(t.apt) || ' ' || ' Loc. ' ||
                                    trim(t.localitate) || ' ' || ' Jud. ' ||
                                    trim(t.judet) || ' ' ||
                                    trim(t.cod_postal)),
                               '  ',
                               ' ') adresa,
                       f.cod cod_functie,
                       f.denumire functia,
                       decode(decode(substr(f.cod,2,1),1,'f',2,'f',3,'p',4,'f',5,'p',decode(substr(f.cod,4,1),4,'f',5,'p',null)),'p','productie','f','functional') compartiment,
                       al.regimlucru_cod,
                       trim(aa.unitier_cod) || ' ' || trim(u.denumire) loc_de_munca,
                       '                             ' obs,
                       u.cod,
                       u.denumire denui,
                       TO_DATE(vv.VALOARE,'DD.MM.YYYY') data_angajarii,
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VECHIME_ANI','N')) vechime,
                       decode (a.activ,'D','activ','N','inactiv') activ,
                       substr(p.denumire,-4,40) an,
                       substr(p.denumire,0,40) luna,
                       
                       to_number(cros_hr.valvarang_num(aa.angajat_matricol,p.id,'PREM_NORMAL','N')) +
                       to_number(cros_hr.valvarang_num(aa.angajat_matricol,p.id,'PREM_EXCEP','N')) +
                       to_number(cros_hr.valvarang_num(aa.angajat_matricol,p.id,'PREM_PASTI_BRUT','N')) +
                       to_number(cros_hr.valvarang_num(aa.angajat_matricol,p.id,'PREM_SPECIAL','N')) +
                       to_number(cros_hr.valvarang_num(aa.angajat_matricol,p.id,'PREM_SEM_I','N')) +
                       to_number(cros_hr.valvarang_num(aa.angajat_matricol,p.id,'PR_S_SEM_I','N')) +
                       to_number(cros_hr.valvarang_num(aa.angajat_matricol,p.id,'PREM_CRAC_BRUT','N')) +
                       to_number(cros_hr.valvarang_num(aa.angajat_matricol,p.id,'PR_S_CRAC_BRUT','N')) premii,
                       
                       to_number(cros_hr.valvarang_num(aa.angajat_matricol,p.id,'GRATIFICATIE','N')) gratificatie,
                       
                       ROUND(Cros_Hr.VALVARANG_NUM(aa.angajat_matricol,
                                   p.id,
                                   'SPOR_DOCTORAT',
                                   'N') / 100 *
             Cros_Hr.VALVARANG_NUM(aa.angajat_matricol,
                                   p.id,
                                   'SALARIU_INC',
                                   'N'),
             0) SPOR_DOCTORAT,
                       
                       ROUND(Cros_Hr.VALVARANG_NUM(aa.angajat_matricol,
                                   p.id,
                                   'SPOR_FUNC',
                                   'N') / 100 *
             Cros_Hr.VALVARANG_NUM(aa.angajat_matricol,
                                   p.id,
                                   'SALARIU_INC',
                                   'N'),
             0) SPOR_CONDUCERE,
             
             to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VSP25','N')) spor_sofer,
             
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VON25','N')) ore_noapte,
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VOSUP','N')) ore_suplimentare,
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VOS_SD','N')) ore_weekend,
					   
					   to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'CO_PL','N')) valoare_co,
                       
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VALREG','N')) valoare_regie
					   
					   
                       
                      
                  from alocari_stat_angajat     aa,
                       angajati                 a,
                       adrese_angajat           t,
                       unitati_ierarhice        u,
                       functii                  f,
                       valori_variabila_angajat v,
                       valori_variabila_angajat vv,
                       perioade_angajati        p,
                       alocari_angajat al
                 where aa.unitier_cod not in ('203','300') and 
                         aa.perang_id = p.id and
                         al.angajat_matricol = a.matricol
                   and a.activ = 'D'
                   and a.matricol = aa.angajat_matricol
                   and a.matricol = t.angajat_matricol
                   and aa.unitier_cod = u.cod
                   and v.angajat_matricol = a.matricol
                   and vv.angajat_matricol = a.matricol
                   and v.perang_id = p.id
                   and vv.perang_id = p.id
				   
                   and to_char(p.dela,'yyyy') = &p_an
				   
                   and v.varang_cod = 'FUNCTIA'
                   and vv.varang_cod = 'DATA_ANG'
                   and f.cod = v.valoare
                   
                  -- and a.matricol in (2776,2383)
                   
                   ) sel
                   
                   

                   
                   
