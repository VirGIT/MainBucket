select

u.cod ||' - '|| u.denumire  as unitier,
p.denumire luna,

sum(to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'SALARIU_INC','N'))) as salariu_incadrare,
sum(to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VALREG','N'))) as valoare_regie,
sum(to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VENIT_FS','N'))) as venit_din_FS,
sum(to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VENIT_BRUT','N'))) as total_drepturi,

sum(round(
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VSP5','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VSP10','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VSP15','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VSP25','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VOSUP','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VOT8','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VCONDG','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VPERIC','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VNOCIV','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VFIDEL','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VFUNC','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VDOCT','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VCCM','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VON25','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VOS_SD','N')))) as valoare_sporuri,

sum(to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'V_TICHETE','N'))) as valoare_tichete_masa,

sum(round(
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VAL_CO_FARAPRIM','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'PRIMA','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'AJ_IMP1','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'AJ_IMP2','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'AJ_IMP3','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'COL_V_BRUT','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'AJ_DECES_BRUT','N')))) as valoare_CO_plus_ajutoare,

sum(round(
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'PREM_NORMAL','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'PREM_EXCEP','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'GRATIFICATIE','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'PREM_PASTI_BRUT','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'PREM_SPECIAL','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'PREM_SEM_I','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'PR_S_SEM_I','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'PREM_CRAC_BRUT','N'))+
to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'PR_S_CRAC_BRUT','N')))) as diverse_sume,

sum(to_number(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,p.id,'VAL_PROIECT','N'))) as valoare_proiect,

   sum(round(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,
                                   p.id,
                                   'SPOR_FUNC',
                                   'N') / 100 *
             CROS_HR.VALVARANG_NUM(aa.angajat_matricol,
                                   p.id,
                                   'SALARIU_INC',
                                   'N'),
             0)) as valoare_spor_conducere,
             
    sum(round(CROS_HR.VALVARANG_NUM(aa.angajat_matricol,
                                   p.id,
                                   'SPOR_DOCTORAT',
                                   'N') / 100 *
             CROS_HR.VALVARANG_NUM(aa.angajat_matricol,
                                   p.id,
                                   'SALARIU_INC',
                                   'N'),
             0)) as valoare_spor_doctorat

from alocari_stat_angajat aa, angajati a, unitati_ierarhice u, perioade_angajati p

where 

aa.angajat_matricol = a.matricol
and u.activa = 'D' 
and a.activ = 'D' 
and aa.perang_id = p.id

and p.denumire like '%2011%' and p.denumire <> 'Decembrie 2011'
and aa.unitier_cod = u.cod 
and u.cod not in ('203','300','220')
and p.calculata = 'D' and p.inchisa = 'D'

and u.cod in ('129','132')

group by
u.cod ||' - '|| u.denumire,  
p.id,
p.denumire

order by 1, p.id
