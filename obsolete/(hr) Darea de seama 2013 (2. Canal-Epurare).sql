select '2.   CANAL-EPURARE' "Activitatea", 
 null "Total (nr mediu anual)", sum(a.co) "CO fara prima", sum(a.prima) "Prima de vacanta", sum(a.cas_soc) "CAS Apavital", sum(a.premii) "Premii", sum(a.venit_fs) "Fond salarii", 
 sum(a.gratif) "Gratificatii", sum(a.tichet) "Tichete", sum(a.cas) "CAS", sum(a.somaj) "Somaj", sum(a.pensie) "Pensii", sum(a.sanatate) "Sanatate", sum(a.impozit) "Impozite" from
(select sum(cros_hr.valvarang_num(a.matricol,pa.id,'VAL_CO_CALCULAT','N')) co,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'PRIMA','N')) prima,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'TV_B_SOC','N')) cas_soc,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'PREM_SPECIAL','N')) premii,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'VENIT_FS','N')) venit_fs,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'GRATIFICATIE','N')) gratif,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'V_TICHETE','N')) tichet,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'TV_B_FAAMBP','N'))+
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'TV_B_CAS','N')) cas,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'AJSOMAJ','N')) somaj,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'VAL_CAS','N')) pensie,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'V_SANAT','N')) sanatate,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'VAL_IMP','N')) impozit
   from angajati a, alocari_stat_angajat asa, perioade_angajati pa
    where a.matricol = asa.angajat_matricol and a.matricol < 8000
        and asa.perang_id between  3005 and 3206 -- Anul 2013 
        and asa.unitier_cod in (142,255,256,143,257,258)    
        and asa.perang_id = pa.id) a
        
        union all
        
select '2.1     din care femei' "Activitatea", 
 null "Total (nr mediu anual)", sum(a.co) "CO fara prima", sum(a.prima) "Prima de vacanta", sum(a.cas_soc) "CAS Apavital", sum(a.premii) "Premii", sum(a.venit_fs) "Fond salarii",
 sum(a.gratif) "Gratificatii", sum(a.tichet) "Tichete", sum(a.cas) "CAS", sum(a.somaj) "Somaj", sum(a.pensie) "Pensii", sum(a.sanatate) "Sanatate", sum(a.impozit) "Impozite" from
(select sum(cros_hr.valvarang_num(a.matricol,pa.id,'VAL_CO_CALCULAT','N')) co,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'PRIMA','N')) prima,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'TV_B_SOC','N')) cas_soc,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'PREM_SPECIAL','N')) premii,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'VENIT_FS','N')) venit_fs,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'GRATIFICATIE','N')) gratif,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'V_TICHETE','N')) tichet,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'TV_B_FAAMBP','N'))+
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'TV_B_CAS','N')) cas,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'AJSOMAJ','N')) somaj,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'VAL_CAS','N')) pensie,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'V_SANAT','N')) sanatate,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'VAL_IMP','N')) impozit
   from angajati a, alocari_stat_angajat asa, perioade_angajati pa
    where a.matricol = asa.angajat_matricol and a.matricol < 8000
        and asa.perang_id between  3005 and 3206 -- Anul 2013 
        and asa.unitier_cod in (142,255,256,143,257,258)  
        and substr(a.cnp,1,1) in (2,6)     
        and asa.perang_id = pa.id) a
        
                union all
        
select '2.2   din care barbati' "Activitatea", 
 null "Total (nr mediu anual)", sum(a.co) "CO fara prima", sum(a.prima) "Prima de vacanta", sum(a.cas_soc) "CAS Apavital", sum(a.premii) "Premii", sum(a.venit_fs) "Fond salarii",
 sum(a.gratif) "Gratificatii", sum(a.tichet) "Tichete", sum(a.cas) "CAS", sum(a.somaj) "Somaj", sum(a.pensie) "Pensii", sum(a.sanatate) "Sanatate", sum(a.impozit) "Impozite" from
(select sum(cros_hr.valvarang_num(a.matricol,pa.id,'VAL_CO_CALCULAT','N')) co,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'PRIMA','N')) prima,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'TV_B_SOC','N')) cas_soc,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'PREM_SPECIAL','N')) premii,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'VENIT_FS','N')) venit_fs,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'GRATIFICATIE','N')) gratif,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'V_TICHETE','N')) tichet,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'TV_B_FAAMBP','N'))+
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'TV_B_CAS','N')) cas,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'AJSOMAJ','N')) somaj,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'VAL_CAS','N')) pensie,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'V_SANAT','N')) sanatate,
         sum(cros_hr.valvarang_num(a.matricol,pa.id,'VAL_IMP','N')) impozit
   from angajati a, alocari_stat_angajat asa, perioade_angajati pa
    where a.matricol = asa.angajat_matricol and a.matricol < 8000
        and asa.perang_id between  3005 and 3206 -- Anul 2013 
         and asa.unitier_cod in (142,255,256,143,257,258) 
        and substr(a.cnp,1,1) in (1,5)     
        and asa.perang_id = pa.id) a
        
        
/*
select round(count(a.matricol)/12,0) toti from angajati a, alocari_stat_angajat al, perioade_angajati p
where a.matricol = al.angajat_matricol and al.perang_id = p.id and a.matricol < 8000
    and p.id between 3005 and 3206 and al.unitier_cod in (142,255,256,143,257,258) 
    
    union all
    
    select round(count(a.matricol)/12,0) femei from angajati a, alocari_stat_angajat al, perioade_angajati p
where a.matricol = al.angajat_matricol and al.perang_id = p.id and a.matricol < 8000 and substr(a.cnp,1,1) in (2,6)
    and p.id between 3005 and 3206 and al.unitier_cod in (142,255,256,143,257,258) 
    
    union all
    
    select round(count(a.matricol)/12,0) barbati from angajati a, alocari_stat_angajat al, perioade_angajati p
where a.matricol = al.angajat_matricol and al.perang_id = p.id and a.matricol < 8000 and substr(a.cnp,1,1) in (1,5)
    and p.id between 3005 and 3206 and al.unitier_cod in (142,255,256,143,257,258) 
*/       

