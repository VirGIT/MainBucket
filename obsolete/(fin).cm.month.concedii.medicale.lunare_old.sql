SELECT
 A.marca,
 A.nume,
 A.prenume,
 A.cnp,
 '' CNP_COPIL,
 A.tz_b,
 TO_NUMBER(NULL) TZ_FNUASS,
 A.zc_cas,
 A.tv_b_cas TV_FNUASS,
 A.cjas,
 m.cod_boala cod_boala,
 UPPER(NVL(TRIM(SUBSTR(M.serie_CERTIFicat,
                       1,
                       INSTR(M.serie_CERTIFicat, ' ', 2))),
           M.serie_CERTIFicat)) SERIE_CCM,
 nr_certificat NUMAR_CCM,
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

  FROM (SELECT
         ROUND(TO_NUMBER(angajat_matricol), 0) marca,
         p.ID,
         nume,
         prenume,
         cnp,
         cros_hr.valvarang_num(angajat_matricol, p.ID, 'TZ_B', 'N') -
         cros_hr.valvarang_num(angajat_matricol, p.ID, 'DIFZ_SOC', 'N') -
         cros_hr.valvarang_num(angajat_matricol, p.ID, 'DIFZ_CAS', 'N') -
         cros_hr.valvarang_num(angajat_matricol, p.ID, 'TZ_CAS_NEPLAT', 'N') tz_b,
         cros_hr.valvarang_num(angajat_matricol, p.ID, 'ZC_CAS', 'N') zc_cas,
         TO_CHAR(cros_hr.valvarang_num(angajat_matricol,
                                       p.ID,
                                       'TV_B_CAS',
                                       'N') -
                 cros_hr.valvarang_num(angajat_matricol,
                                       p.ID,
                                       'DIFB_CAS',
                                       'N')) tv_b_cas,
         cros_hr.valvarang_num(angajat_matricol, p.ID, 'CJAS_NEAMT', 'N') cjas
          FROM PERIOADE_ANGAJATI p, ANGAJATI A, ALOCARI_STAT_ANGAJAT aa
         WHERE aa.perang_id = p.ID
           AND p.denumire = :pd
           AND A.matricol = aa.angajat_matricol
         ORDER BY 3, 1) A,
       MEDICALE m
 WHERE m.matricol(+) = A.marca
   AND m.perang_id(+) = A.ID
   AND COD_BOALA IS NOT NULL
 order by 2, 1;
