DROP VIEW HR_STATISTICA_RJ;

/* Formatted on 06/03/2014 09:31:38 (QP5 v5.256.13226.35510) */
CREATE OR REPLACE FORCE VIEW HR_STATISTICA_RJ
(
   DELA,
   LA,
   COD_UNIT_IER,
   MATRICOL,
   DEN_FUN,
   SALARIU_INC,
   AJ_IMP1,
   AJ_IMP2,
   AJ_IMP3,
   AJSOMAJ_CALC,
   AJSOMAJ_EXCEPT,
   ON25,
   ORE_NORMA,
   OS_SD,
   OS200,
   PREM_CRAC_BRUT,
   PREM_PASTI_BRUT,
   PREM_SPECIAL,
   PRIMAA,
   PRIMAS,
   REGIE,
   GRATIFICATIE,
   TV_B_FAAMBP,
   TV_B_CAS,
   TZ_B,
   TZ_B_CAS,
   TZ_B_SOC,
   VAL_CAS_CALC,
   VAL_CAS_EXCEPT,
   VAL_IMP_CALC,
   VAL_IMP_EXCEPT,
   VENIT_BRUT,
   VENIT_FS,
   VON25,
   VOS_SD,
   V_SANAT_CALC,
   V_SANAT_EXCEPT,
   V_TICHETE,
   Z_CAS_NEPLATITE,
   Z_SOC_NEPLATITE,
   Z_CO,
   Z_NEM,
   ZCO_LC,
   ZFAAMBP_FAAMBP
)
AS
   SELECT "DELA",
          "LA",
          "COD_UNIT_IER",
          "MATRICOL",
          "DEN_FUN",
          "SALARIU_INC",
          "AJ_IMP1",
          "AJ_IMP2",
          "AJ_IMP3",
          "AJSOMAJ_CALC",
          "AJSOMAJ_EXCEPT",
          "ON25",
          "ORE_NORMA",
          "OS_SD",
          "OS200",
          "PREM_CRAC_BRUT",
          "PREM_PASTI_BRUT",
          "PREM_SPECIAL",
          "PRIMAA",
          "PRIMAS",
          "REGIE",
          "GRATIFICATIE",
          "TV_B_FAAMBP",
          "TV_B_CAS",
          "TZ_B",
          "TZ_B_CAS",
          "TZ_B_SOC",
          "VAL_CAS_CALC",
          "VAL_CAS_EXCEPT",
          "VAL_IMP_CALC",
          "VAL_IMP_EXCEPT",
          "VENIT_BRUT",
          "VENIT_FS",
          "VON25",
          "VOS_SD",
          "V_SANAT_CALC",
          "V_SANAT_EXCEPT",
          "V_TICHETE",
          "Z_CAS_NEPLATITE",
          "Z_SOC_NEPLATITE",
          "Z_CO",
          "Z_NEM",
          "ZCO_LC",
          "ZFAAMBP_FAAMBP"
     FROM (SELECT p.dela,
                  p.la,
                  aa.unitier_cod cod_unit_ier,
                  TO_NUMBER (
                     REGEXP_REPLACE (aa.angajat_matricol, '[A-Za-z]'))
                     matricol,
                  func.den_fun,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'SALARIU_INC',
                                                    'N'))
                     AS SALARIU_INC,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'AJ_IMP1',
                                                    'N'))
                     AS AJ_IMP1,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'AJ_IMP2',
                                                    'N'))
                     AS AJ_IMP2,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'AJ_IMP3',
                                                    'N'))
                     AS AJ_IMP3,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'AJSOMAJ_CALC',
                                                    'N'))
                     AS AJSOMAJ_CALC,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'AJSOMAJ_EXCEPT',
                                                    'N'))
                     AS AJSOMAJ_EXCEPT,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'ON25',
                                                    'N'))
                     AS ON25,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'ORE_NORMA',
                                                    'N'))
                     AS ORE_NORMA,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'OS_SD',
                                                    'N'))
                     AS OS_SD,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'OS200',
                                                    'N'))
                     AS OS200,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'PREM_CRAC_BRUT',
                                                    'N'))
                     AS PREM_CRAC_BRUT,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'PREM_PASTI_BRUT',
                                                    'N'))
                     AS PREM_PASTI_BRUT,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'PREM_SPECIAL',
                                                    'N'))
                     AS PREM_SPECIAL,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'PRIMAA',
                                                    'N'))
                     AS PRIMAA,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'PRIMAS',
                                                    'N'))
                     AS PRIMAS,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'REGIE',
                                                    'N'))
                     AS REGIE,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'GRATIFICATIE',
                                                    'N'))
                     AS GRATIFICATIE,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'TV_B_FAAMBP',
                                                    'N'))
                     AS TV_B_FAAMBP,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'TV_B_CAS',
                                                    'N'))
                     AS TV_B_CAS,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'TZ_B',
                                                    'N'))
                     AS TZ_B,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'TZ_B_CAS',
                                                    'N'))
                     AS TZ_B_CAS,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'TZ_B_SOC',
                                                    'N'))
                     AS TZ_B_SOC,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'VAL_CAS_CALC',
                                                    'N'))
                     AS VAL_CAS_CALC,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'VAL_CAS_EXCEPT',
                                                    'N'))
                     AS VAL_CAS_EXCEPT,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'VAL_IMP_CALC',
                                                    'N'))
                     AS VAL_IMP_CALC,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'VAL_IMP_EXCEPT',
                                                    'N'))
                     AS VAL_IMP_EXCEPT,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'VENIT_BRUT',
                                                    'N'))
                     AS VENIT_BRUT,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'VENIT_FS',
                                                    'N'))
                     AS VENIT_FS,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'VON25',
                                                    'N'))
                     AS VON25,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'VOS_SD',
                                                    'N'))
                     AS VOS_SD,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'V_SANAT_CALC',
                                                    'N'))
                     AS V_SANAT_CALC,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'V_SANAT_EXCEPT',
                                                    'N'))
                     AS V_SANAT_EXCEPT,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'V_TICHETE',
                                                    'N'))
                     AS V_TICHETE,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'Z_CAS_NEPLATITE',
                                                    'N'))
                     AS Z_CAS_NEPLATITE,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'Z_SOC_NEPLATITE',
                                                    'N'))
                     AS Z_SOC_NEPLATITE,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'Z_CO',
                                                    'N'))
                     AS Z_CO,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.angajat_matricol,
                                                    p.id,
                                                    'Z_NEM',
                                                    'N'))
                     AS Z_NEM,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.ANGAJAT_MATRICOL,
                                                    p.id,
                                                    'ZCO_LC',
                                                    'N'))
                     AS ZCO_LC,
                  TO_NUMBER (CROS_HR.VALVARANG_NUM (aa.ANGAJAT_MATRICOL,
                                                    p.id,
                                                    'ZFAAMBP_FAAMBP',
                                                    'N'))
                     AS ZFAAMBP_FAAMBP
             FROM PERIOADE_ANGAJATI p,
                  ALOCARI_STAT_ANGAJAT aa,
                  HR_FUNCTII_RJ func
            WHERE     aa.perang_id = p.id
                  AND p.calculata = 'D'
                  AND p.inchisa = 'D'
                  -- and p.dela >= :p_dela and p.la <= :p_la
                  /* and aa.angajat_matricol in
                     (15, 2587, 2161, 2776, 2772, 2725, 2633, 153, 776, 2707, 2762, 1269, 2731, 404, 756, 374, 376, 380, 386, 1386, 1635, 1669, 249, 1164, 1631, 1037, 1048, 1760, 1838, 580, 1310, 1349, 1751, 1042, 1241, 1267, 1348, 2241, 2353, 499, 329, 2813, 1160)
      */
                  AND aa.angajat_matricol = func.matricol
                  AND aa.unitier_cod = func.unitier_cod
                  AND p.dela >= func.de_la
                  AND p.la <= NVL (func.pana_la, SYSDATE));
