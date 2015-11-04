SELECT 11 ORD,
       'FOND SALARII (Tot.dr.-CB DPMOS)' DEN,
       '641.' || DECODE(LENGTH(centrucost_cod), 3, '0', '') ||
       SUBSTR(centrucost_cod, 3, LENGTH(centrucost_cod) - 2) DEBIT,
       '421.00' CREDIT,
       SUM(VALOARE - CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                           A.PERANG_ID,
                                           'VAL_PROIECT',
                                           'N')) FDSAL,
       cc.cod || ' ' || cc.denumire DELEGAT
  FROM UNITATI_IERARHICE        U,
       VALORI_VARIABILA_ANGAJAT V,
       ALOCARI_STAT_ANGAJAT     A,
       centre_de_cost           cc
 WHERE V.ANGAJAT_MATRICOL = A.ANGAJAT_MATRICOL
   AND A.UNITIER_COD = U.COD
   AND VARANG_COD = 'VENIT_FS'
   AND V.PERANG_ID = :p_perang_id
   AND A.PERANG_ID = :p_perang_id
   AND U.COD <> '193'
   AND CROS_HR.VALVARANG_CHAR(A.ANGAJAT_MATRICOL,
                              A.PERANG_ID,
                              'ACTIVITATE',
                              'N') != 'DIRIGINTARE'
   and cc.cod = u.centrucost_cod
 GROUP BY cc.cod || ' ' || cc.denumire, u.centrucost_cod
UNION
SELECT 21 ORD,
       '20.8% CAS UNITATE' DEN,
       '6451.' || DECODE(LENGTH(centrucost_cod), 3, '0', '') ||
       SUBSTR(centrucost_cod, 3, LENGTH(centrucost_cod) - 2) DEBIT,
       '4311.00' CREDIT,
       SUM(ROUND(DECODE(GRUPA2,
                        'D',
                        (CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                               A.PERANG_ID,
                                               'VENIT_FS',
                                               'N') - NVL(TV_B_SOC, 0) /*- -- modificat la 11.07.2012
                        CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                               A.PERANG_ID,
                                               'GRATIFICATIE',
                                               'N')*/) * 0.27,
                        (CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                               A.PERANG_ID,
                                               'VENIT_FS',
                                               'N') - NVL(TV_B_SOC, 0) /*- -- modificat la 11.07.2012
                        CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                               A.PERANG_ID,
                                               'GRATIFICATIE',
                                               'N') */ -
                        CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                               A.PERANG_ID,
                                               'VAL_PROIECT',
                                               'N') +
                        ROUND(((CASE
                                 WHEN A.perang_id = 2885 AND
                                      CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                            A.PERANG_ID,
                                                            'TZ_B',
                                                            'N') -
                                      CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                            A.PERANG_ID,
                                                            'ZFAAMBP_FAAMBP',
                                                            'N') -
                                      CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                            A.PERANG_ID,
                                                            'DIFZ_FAAMBP',
                                                            'N') -
                                      CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                            A.PERANG_ID,
                                                            'ZFAAMBP_SOC',
                                                            'N') -
                                      Cros_Hr.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                            A.PERANG_ID,
                                                            'TZ_CAS_NEPLAT',
                                                            'N') =
                                      CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                            A.PERANG_ID,
                                                            'ZILE_LUNA',
                                                            'N') THEN
                                  21
                                 ELSE
                                  CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL, A.PERANG_ID, 'TZ_B', 'N') -
                                  CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                        A.PERANG_ID,
                                                        'ZFAAMBP_FAAMBP',
                                                        'N') -
                                  CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                        A.PERANG_ID,
                                                        'DIFZ_FAAMBP',
                                                        'N') -
                                  CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                        A.PERANG_ID,
                                                        'ZFAAMBP_SOC',
                                                        'N') -
                                  Cros_Hr.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                        A.PERANG_ID,
                                                        'TZ_CAS_NEPLAT',
                                                        'N')
                               END) * 0.35 * :CF_SAL_MEDIU) /
                               DECODE(A.perang_id,
                                      2885,
                                      22,
                                      CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                            A.PERANG_ID,
                                                            'ZILE_LUNA',
                                                            'N')),
                               0)) * 0.208),
                 0)) VENIT_TVBSOC,
       cc.cod || ' ' || cc.denumire DELEGAT
  FROM UNITATI_IERARHICE U,
       VALORI_VARIABILA_ANGAJAT V,
       ALOCARI_STAT_ANGAJAT A,
       centre_de_cost cc,
       (SELECT A.TV_B_SOC, b.m
          FROM (SELECT VALOARE TV_B_SOC, ANGAJAT_MATRICOL M
                  FROM VALORI_VARIABILA_ANGAJAT V
                 WHERE VARANG_COD = 'TV_B_SOC'
                   AND V.PERANG_ID = :p_perang_id) A,
               (SELECT 0, ANGAJAT_matricol m
                  FROM ALOCARI_STAT_ANGAJAT
                 WHERE PERANG_ID = :p_perang_id) B
         WHERE A.M(+) = B.M),
       (SELECT VALOARE GRUPA2, ANGAJAT_MATRICOL M_GR2
          FROM VALORI_VARIABILA_ANGAJAT V
         WHERE VARANG_COD = 'SPOR_DEOS'
           AND V.PERANG_ID = :p_perang_id) C,
       (SELECT VALOARE TIP_COL, ANGAJAT_MATRICOL M_COL
          FROM VALORI_VARIABILA_ANGAJAT V
         WHERE VARANG_COD = 'TIP_COL_NUMERIC'
           AND V.PERANG_ID = :p_perang_id) D
 WHERE V.ANGAJAT_MATRICOL = A.ANGAJAT_MATRICOL
   AND A.UNITIER_COD = U.COD
   AND VARANG_COD = 'MARCA'
   AND V.PERANG_ID = :p_perang_id
   AND M = A.ANGAJAT_MATRICOL
   AND C.M_GR2 = A.ANGAJAT_MATRICOL
   AND C.M_GR2 = D.M_COL
   AND A.PERANG_ID = :p_perang_id
   AND U.COD <> '193'
   AND CROS_HR.VALVARANG_CHAR(A.ANGAJAT_MATRICOL,
                              A.PERANG_ID,
                              'ACTIVITATE',
                              'N') != 'DIRIGINTARE'
   and cc.cod = u.centrucost_cod
 GROUP BY cc.cod || ' ' || cc.denumire, centrucost_cod
UNION
SELECT 22 ORD,
       '5.2% SANATATE UNITATE' DEN,
       '6453.' || DECODE(LENGTH(centrucost_cod), 3, '0', '') ||
       SUBSTR(centrucost_cod, 3, LENGTH(centrucost_cod) - 2) DEBIT,
       '4313.01' CREDIT,
       SUM(ROUND(NVL(V.VALOARE - CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                       A.PERANG_ID,
                                                       'VAL_PROIECT',
                                                       'N'),
                     0) * 0.052,
                 0)) VENIT_7_UNIT,
       cc.cod || ' ' || cc.denumire DELEGAT
  FROM UNITATI_IERARHICE        U,
       VALORI_VARIABILA_ANGAJAT V,
       ALOCARI_STAT_ANGAJAT     A,
       centre_de_cost           cc
 WHERE V.ANGAJAT_MATRICOL = A.ANGAJAT_MATRICOL
   AND A.UNITIER_COD = U.COD
   AND VARANG_COD = 'VENIT_FS'
   AND V.PERANG_ID = :p_perang_id
   AND A.PERANG_ID = :p_perang_id
   AND U.COD <> '193'
   AND CROS_HR.VALVARANG_CHAR(A.ANGAJAT_MATRICOL,
                              A.PERANG_ID,
                              'ACTIVITATE',
                              'N') != 'DIRIGINTARE'
   and cc.cod = u.centrucost_cod
 GROUP BY cc.cod || ' ' || cc.denumire, centrucost_cod
UNION
SELECT 24 ORD,
       '0.5% SOMAJ UNITATE' DEN,
       '6452.' || DECODE(LENGTH(centrucost_cod), 3, '0', '') ||
       SUBSTR(centrucost_cod, 3, LENGTH(centrucost_cod) - 2) DEBIT,
       '4371.00' CREDIT,
       SUM(ROUND(NVL(V.VALOARE - CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                       A.PERANG_ID,
                                                       'AJ_IMP3',
                                                       'N') /*- -- modificat la 11.07.2012
                     CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                           A.PERANG_ID,
                                           'GRATIFICATIE',
                                           'N') */ -
                     CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                           A.PERANG_ID,
                                           'VAL_PROIECT',
                                           'N'),
                     0) * 0.005 * TIP_COL,
                 0)) VENIT_7_UNIT,
       cc.cod || ' ' || cc.denumire DELEGAT
  FROM UNITATI_IERARHICE U,
       VALORI_VARIABILA_ANGAJAT V,
       ALOCARI_STAT_ANGAJAT A,
       centre_de_cost cc,
       (SELECT VALOARE TIP_COL, ANGAJAT_MATRICOL M_COL
          FROM VALORI_VARIABILA_ANGAJAT V
         WHERE VARANG_COD = 'TIP_COL_NUMERIC'
           AND V.PERANG_ID = :p_perang_id) D
 WHERE V.ANGAJAT_MATRICOL = A.ANGAJAT_MATRICOL
   AND A.UNITIER_COD = U.COD
   AND VARANG_COD = 'VENIT_FS'
   AND V.PERANG_ID = :p_perang_id
   AND A.ANGAJAT_MATRICOL = M_COL
   AND m_col NOT IN (2598)
   AND A.PERANG_ID = :p_perang_id
   AND U.COD NOT IN ('300', '193')
   AND CROS_HR.VALVARANG_CHAR(A.ANGAJAT_MATRICOL,
                              A.PERANG_ID,
                              'ACTIVITATE',
                              'N') != 'DIRIGINTARE'
   and cc.cod = u.centrucost_cod
 GROUP BY cc.cod || ' ' || cc.denumire, centrucost_cod
UNION
SELECT 61 ORD,
       '0.279% FOND ACCIDENTE : BOLI PROFESIONALE' DEN,
       '635.' || DECODE(LENGTH(centrucost_cod), 3, '0', '') ||
       SUBSTR(centrucost_cod, 3, LENGTH(centrucost_cod) - 2) DEBIT,
       '447.02' CREDIT,
       SUM(ROUND(DECODE(GRUPA2,
                        'D',
                        (CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                               A.PERANG_ID,
                                               'VENIT_FS',
                                               'N') - NVL(TV_B_SOC, 0) /* - -- modificat la 11.07.2012
                        CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                               A.PERANG_ID,
                                               'GRATIFICATIE',
                                               'N')*/) * 0.27,
                        (CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                               A.PERANG_ID,
                                               'VENIT_FS',
                                               'N') - NVL(TV_B_SOC, 0) /* - -- modificat la 11.07.2012
                        CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                               A.PERANG_ID,
                                               'GRATIFICATIE',
                                               'N') */ -
                        CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                               A.PERANG_ID,
                                               'VAL_PROIECT',
                                               'N') +
                        ROUND(((CASE
                                 WHEN A.perang_id = 2885 AND
                                      CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                            A.PERANG_ID,
                                                            'TZ_B',
                                                            'N') -
                                      CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                            A.PERANG_ID,
                                                            'ZFAAMBP_FAAMBP',
                                                            'N') -
                                      CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                            A.PERANG_ID,
                                                            'DIFZ_FAAMBP',
                                                            'N') -
                                      CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                            A.PERANG_ID,
                                                            'ZFAAMBP_SOC',
                                                            'N') -
                                      Cros_Hr.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                            A.PERANG_ID,
                                                            'TZ_CAS_NEPLAT',
                                                            'N') =
                                      CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                            A.PERANG_ID,
                                                            'ZILE_LUNA',
                                                            'N') THEN
                                  21
                                 ELSE
                                  CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL, A.PERANG_ID, 'TZ_B', 'N') -
                                  CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                        A.PERANG_ID,
                                                        'ZFAAMBP_FAAMBP',
                                                        'N') -
                                  CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                        A.PERANG_ID,
                                                        'DIFZ_FAAMBP',
                                                        'N') -
                                  CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                        A.PERANG_ID,
                                                        'ZFAAMBP_SOC',
                                                        'N') -
                                  Cros_Hr.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                        A.PERANG_ID,
                                                        'TZ_CAS_NEPLAT',
                                                        'N')
                               END) * :CF_SAL_MIN) /
                              
							  DECODE(A.perang_id,
                                      2885,
                                      22,
                                      CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                            A.PERANG_ID,
                                                            'ZILE_LUNA',
                                                            'N')),
                               0)) * 0.00279),
                 0)) VENIT_7_UNIT,
       cc.cod || ' ' || cc.denumire DELEGAT
  FROM UNITATI_IERARHICE U,
       VALORI_VARIABILA_ANGAJAT V,
       ALOCARI_STAT_ANGAJAT A,
       centre_de_cost cc,
       (SELECT A.TV_B_SOC, b.m
          FROM (SELECT VALOARE TV_B_SOC, ANGAJAT_MATRICOL M
                  FROM VALORI_VARIABILA_ANGAJAT V
                 WHERE VARANG_COD = 'TV_B_SOC'
                   AND V.PERANG_ID = :p_perang_id) A,
               (SELECT 0, ANGAJAT_matricol m
                  FROM ALOCARI_STAT_ANGAJAT
                 WHERE PERANG_ID = :p_perang_id) B
         WHERE A.M(+) = B.M),
       (SELECT VALOARE GRUPA2, ANGAJAT_MATRICOL M_GR2
          FROM VALORI_VARIABILA_ANGAJAT V
         WHERE VARANG_COD = 'SPOR_DEOS'
           AND V.PERANG_ID = :p_perang_id) C,
       (SELECT VALOARE TIP_COL, ANGAJAT_MATRICOL M_COL
          FROM VALORI_VARIABILA_ANGAJAT V
         WHERE VARANG_COD = 'TIP_COL_NUMERIC'
           AND V.PERANG_ID = :p_perang_id) D
 WHERE V.ANGAJAT_MATRICOL = A.ANGAJAT_MATRICOL
   AND A.UNITIER_COD = U.COD
   AND VARANG_COD = 'MARCA'
   AND V.PERANG_ID = :p_perang_id
   AND M = A.ANGAJAT_MATRICOL
   AND C.M_GR2 = A.ANGAJAT_MATRICOL
   AND C.M_GR2 = D.M_COL
   AND A.PERANG_ID = :p_perang_id
   AND U.COD <> '193'
   AND CROS_HR.VALVARANG_CHAR(A.ANGAJAT_MATRICOL,
                              A.PERANG_ID,
                              'ACTIVITATE',
                              'N') != 'DIRIGINTARE'
   and cc.cod = u.centrucost_cod
 GROUP BY cc.cod || ' ' || cc.denumire, u.centrucost_cod
UNION
SELECT 60 ORD,
       '4% FOND SOLIDARITATE' DEN,
       '635.' || DECODE(LENGTH(centrucost_cod), 3, '0', '') ||
       SUBSTR(centrucost_cod, 3, LENGTH(centrucost_cod) - 2) DEBIT,
       '447.01' CREDIT,
       SUM(:CF_SAL_MIN * 0.02) VENIT_7_UNIT,
       cc.cod || ' ' || cc.denumire DELEGAT
  FROM UNITATI_IERARHICE U, ALOCARI_STAT_ANGAJAT A, centre_de_cost cc --, angajati ang
 WHERE A.UNITIER_COD = U.COD --and a.angajat_matricol=ang.matricol and ang.activ='D'
   AND A.PERANG_ID = :p_perang_id
   AND U.COD NOT IN ('193', '300', '330')
   AND CROS_HR.VALVARANG_CHAR(A.ANGAJAT_MATRICOL,
                              A.PERANG_ID,
                              'ACTIVITATE',
                              'N') != 'DIRIGINTARE'
   AND A.angajat_matricol NOT IN (854, 2427, 545, 93, 2468, 1816, 2513) -- PE ACESTE MARCI SUNT PERSOANE CU HANDICAP
   and cc.cod = u.centrucost_cod
 GROUP BY cc.cod || ' ' || cc.denumire, u.centrucost_cod
UNION
SELECT 23 ORD,
       '0.85% CONTRIBUTIE PT. CONCEDII SI INDEMNIZATII' DEN,
       '6453.' || DECODE(LENGTH(centrucost_cod), 3, '0', '') ||
       SUBSTR(centrucost_cod, 3, LENGTH(centrucost_cod) - 2) DEBIT,
       '4314.02' CREDIT,
       SUM(ROUND(NVL(V.VALOARE - CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                       A.PERANG_ID,
                                                       'VAL_PROIECT',
                                                       'N'),
                     0) * 0.0085,
                 0)) VENIT_7_UNIT,
       cc.cod || ' ' || cc.denumire DELEGAT
  FROM UNITATI_IERARHICE        U,
       VALORI_VARIABILA_ANGAJAT V,
       ALOCARI_STAT_ANGAJAT     A,
       centre_de_cost           cc
 WHERE V.ANGAJAT_MATRICOL = A.ANGAJAT_MATRICOL
   AND A.UNITIER_COD = U.COD
   AND VARANG_COD = 'VENIT_FS'
   AND V.PERANG_ID = :p_perang_id
   AND A.PERANG_ID = :p_perang_id
   AND U.COD <> '193'
   AND CROS_HR.VALVARANG_CHAR(A.ANGAJAT_MATRICOL,
                              A.PERANG_ID,
                              'ACTIVITATE',
                              'N') != 'DIRIGINTARE'
  -- and a.angajat_matricol < 8000
   and cc.cod = u.centrucost_cod
 GROUP BY cc.cod || ' ' || cc.denumire, u.centrucost_cod
--where delegat is not null
UNION
SELECT 71 ORD,
       '0.25% FOND DE GARANTARE PT. PLATA CREANTELOR SALARIALE' DEN,
       '635.' || DECODE(LENGTH(centrucost_cod), 3, '0', '') ||
       SUBSTR(centrucost_cod, 3, LENGTH(centrucost_cod) - 2) DEBIT,
       '447.03' CREDIT,
       SUM(ROUND(NVL(V.VALOARE - CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                                       A.PERANG_ID,
                                                       'AJ_IMP3',
                                                       'N') /* - -- modificat la 11.07.2012
                     CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                           A.PERANG_ID,
                                           'GRATIFICATIE',
                                           'N') */ -
                     CROS_HR.VALVARANG_NUM(A.ANGAJAT_MATRICOL,
                                           A.PERANG_ID,
                                           'VAL_PROIECT',
                                           'N'),
                     0) * 0.0025 * TIP_COL,
                 0)) VENIT_7_UNIT,
       cc.cod || ' ' || cc.denumire DELEGAT
  FROM UNITATI_IERARHICE U,
       VALORI_VARIABILA_ANGAJAT V,
       ALOCARI_STAT_ANGAJAT A,
       centre_de_cost cc,
       (SELECT VALOARE TIP_COL, ANGAJAT_MATRICOL M_COL
          FROM VALORI_VARIABILA_ANGAJAT V
         WHERE VARANG_COD = 'TIP_COL_NUMERIC'
           AND V.PERANG_ID = :p_perang_id) D
 WHERE V.ANGAJAT_MATRICOL = A.ANGAJAT_MATRICOL
   AND A.UNITIER_COD = U.COD
   AND VARANG_COD = 'VENIT_FS'
   AND V.PERANG_ID = :p_perang_id
   AND A.ANGAJAT_MATRICOL = M_COL
   AND A.PERANG_ID = :p_perang_id
   AND U.COD NOT IN ('300', '193')
   AND CROS_HR.VALVARANG_CHAR(A.ANGAJAT_MATRICOL,
                              A.PERANG_ID,
                              'ACTIVITATE',
                              'N') != 'DIRIGINTARE'
   and cc.cod = u.centrucost_cod
 GROUP BY cc.cod || ' ' || cc.denumire, u.centrucost_cod
 ORDER BY 1, delegat
