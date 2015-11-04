
create or replace view hr_concedii_medicale_rj as
-- EXPORT CONCEDII MEDICALE LUNARE 
SELECT A.MARCA,
       A.NUME,
       A.PRENUME,
       A.CNP,
       '' CNP_COPIL,
       A.TZ_B,
       TO_NUMBER(NULL) TZ_FNUASS,
       A.ZC_CAS,
       A.TV_B_CAS TV_FNUASS,
       A.CJAS,
       M.COD_BOALA COD_BOALA,
       UPPER(NVL(TRIM(SUBSTR(M.SERIE_CERTIFICAT,
                             1,
                             INSTR(M.SERIE_CERTIFICAT, ' ', 2))),
                 M.SERIE_CERTIFICAT)) SERIE_CCM,
       NR_CERTIFICAT NUMAR_CCM,
       '' SERIE_CCM_INITIAL,
       '' NR_CCM_INITIAL,
       '' COD_URG,
       '' BOLI_INF_CONT_GR_A,
       '' DATA_ACORD,
       '' ZI_PRE_ANG,
       '' LOC_PRES,
       '' SUM_ANG,
       '' DATA_INC,
       '' DATA_SF,
       '' BAZA_CALC,
       '' ZI_BZ_CALC,
       '' MZBCI,
       '' ME_NR

  FROM (SELECT ROUND(TO_NUMBER(ANGAJAT_MATRICOL), 0) MARCA,
               P.ID,
               NUME,
               PRENUME,
               CNP,
               CROS_HR.VALVARANG_NUM(ANGAJAT_MATRICOL, P.ID, 'TZ_B', 'N') -
               CROS_HR.VALVARANG_NUM(ANGAJAT_MATRICOL, P.ID, 'DIFZ_SOC', 'N') -
               CROS_HR.VALVARANG_NUM(ANGAJAT_MATRICOL, P.ID, 'DIFZ_CAS', 'N') -
               CROS_HR.VALVARANG_NUM(ANGAJAT_MATRICOL,
                                     P.ID,
                                     'TZ_CAS_NEPLAT',
                                     'N') TZ_B,
               CROS_HR.VALVARANG_NUM(ANGAJAT_MATRICOL, P.ID, 'ZC_CAS', 'N') ZC_CAS,
               TO_CHAR(CROS_HR.VALVARANG_NUM(ANGAJAT_MATRICOL,
                                             P.ID,
                                             'TV_B_CAS',
                                             'N') -
                       CROS_HR.VALVARANG_NUM(ANGAJAT_MATRICOL,
                                             P.ID,
                                             'DIFB_CAS',
                                             'N')) TV_B_CAS,
               CROS_HR.VALVARANG_NUM(ANGAJAT_MATRICOL,
                                     P.ID,
                                     'CJAS_NEAMT',
                                     'N') CJAS
          FROM PERIOADE_ANGAJATI P, ANGAJATI A, ALOCARI_STAT_ANGAJAT AA
         WHERE AA.PERANG_ID = P.ID
	   	-- AND P.DENUMIRE = :PERIOADA
           AND P.DENUMIRE = rajac_pkg.get_perioada ()
           AND A.MATRICOL = AA.ANGAJAT_MATRICOL
         ORDER BY 3, 1) A,
       MEDICALE M
 WHERE M.MATRICOL(+) = A.MARCA
   AND M.PERANG_ID(+) = A.ID
   AND COD_BOALA IS NOT NULL
 ORDER BY 2, 1;

show errors;


exec ad_usr.set_user(user); 
--DROP PUBLIC SYNONYM hr_concedii_medicale_rj; 
CREATE PUBLIC SYNONYM hr_concedii_medicale_rj FOR RAJAC_IASI.hr_concedii_medicale_rj; 
GRANT SELECT ON RAJAC_IASI.hr_concedii_medicale_rj TO CROS_VIEW;



-- RAPOARTE_MODUL_SERVER_RJ
declare 
    l_id number(10); 
begin 
    l_id := null; 
    adauga_raport_modserv_rj('HR','Concedii Medicale','Filtru : perioada','hr_concedii_medicale_rj', 'LUNA', 'D', l_id); -- RAPOARTE_MODUL_SERVER_RJ
    adauga_acces_raport_modserv_rj(L_ID, 'RAJAC_IASI'); -- acces_rap_mod_serv_rj
    adauga_acces_raport_modserv_rj(l_id, 'MARGARETA');
        
    commit; 
end;
