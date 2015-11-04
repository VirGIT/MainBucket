select distinct 
         sel.marca, sel.nume, sel.cnp, sel.adresa, sel.functia, sel.cod||' - '||sel.denui unitatea, sel.compartiment, sel.data_angajarii, sel.vechime, sel.activ, 
         sel.an, sel.luna, sel.ore_lucrate, sel.ore_suplimentare, sel.os_25, sel.os_75, sel.os_100, sel.os_125, sel.os_150, sel.os_200, sel.on_25, sel.os_sd, sel.ore_co, sel.ore_bo, sel.ore_platite
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
                  --   to_date(to_char(CROS_HR.VALVARANG_CHAR(aa.angajat_matricol,p.id,'DATA_ANG','N'))) data_angajarii,
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VECHIME_ANI','N')) vechime,
                       decode (a.activ,'D','activ','N','inactiv') activ,
                       substr(p.denumire,-4,40) an,
                       substr(p.denumire,0,40) luna,
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'REGIE','N')) ore_lucrate,
                       
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS25','N')) +
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS75','N')) +
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS100','N')) +
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS125','N')) +
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS150','N')) +
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS200','N')) ore_suplimentare,
                       
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS200','N')) os_200,
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS25','N')) os_25,
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS100','N')) os_100,
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS75','N')) os_75,
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS125','N')) os_125,
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS150','N')) os_150,
                       
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'ZCO_LC','N')) * 8 ore_co,
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'TZ_B','N')) * 8 ore_bo,
                       
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'ON25','N')) on_25,
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS_SD','N')) os_sd,
                       
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'REGIE','N')) +
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS25','N')) +
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS75','N')) +
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS100','N')) +
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS125','N')) +
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS150','N')) +
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS200','N')) +
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'ON25','N')) +
                       to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'OS_SD','N')) ore_platite
                      
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
                   and substr(p.denumire,-4,40) in ('2010','2011')
                   and v.varang_cod = 'FUNCTIA'
                   and vv.varang_cod='DATA_ANG'
                   and f.cod = v.valoare
                   
                -- and a.matricol = 1080
                   order by nume, p.id
                   
                   ) sel
                   

                   
                   
