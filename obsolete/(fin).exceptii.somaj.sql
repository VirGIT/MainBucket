SELECT ROWNUM NRCRT, A.*
  FROM (SELECT A.matricol,
               A.nume,
               CROS_HR.VALVARANG_NUM(MATRICOL, :id_luna_crt, 'VENIT_FS', 'N') -
               CROS_HR.VALVARANG_NUM(MATRICOL, :id_luna_crt, 'AJ_IMP3', 'N') -
               CROS_HR.VALVARANG_NUM(MATRICOL,
                                     :id_luna_crt,
                                     'GRATIFICATIE',
                                     'N') BAZACALCUL,
               NVL(B.VALOARE, 0) AJSOMAJ,
               A.luna
          FROM (SELECT p.denumire luna,
                       MATRICOL,
                       SUBSTR(TRIM(NUME) || ' ' || TRIM(INITIALA) || ' ' ||
                              TRIM(PRENUME),
                              1,
                              40) NUME,
                       ROUND((V.VALOARE -
                             CROS_HR.VALVARANG_NUM(MATRICOL,
                                                    :id_luna_crt,
                                                    'AJ_IMP3',
                                                    'N') -
                             CROS_HR.VALVARANG_NUM(ANGAJAT_MATRICOL,
                                                    P.ID,
                                                    'GRATIFICATIE',
                                                    'N')) / 200) * 200 TARIFAR
                  FROM VALORI_VARIABILA_ANGAJAT V,
                       ANGAJATI,
                       PERIOADE_ANGAJATI        p
                 WHERE V.VARANG_COD = 'VENIT_FS'
                   AND V.PERANG_ID = :id_luna_crt
                   AND ANGAJAT_MATRICOL = MATRICOL
                   AND p.ID = :id_luna_crt
                MINUS
                SELECT p.denumire luna,
                       MATRICOL,
                       SUBSTR(TRIM(NUME) || ' ' || TRIM(INITIALA) || ' ' ||
                              TRIM(PRENUME),
                              1,
                              40) NUME,
                       ROUND(V.VALOARE) * 200
                  FROM VALORI_VARIABILA_ANGAJAT V,
                       ANGAJATI,
                       PERIOADE_ANGAJATI        p
                 WHERE V.VARANG_COD = 'AJSOMAJ'
                   AND V.PERANG_ID = :id_luna_crt
                   AND ANGAJAT_MATRICOL = MATRICOL
                   AND p.ID = :id_luna_crt) A,
               (SELECT *
                  FROM VALORI_VARIABILA_ANGAJAT
                 WHERE VARANG_COD = 'AJSOMAJ'
                   AND PERANG_ID = :id_luna_crt) B
         WHERE A.MATRICOL = B.ANGAJAT_MATRICOL(+)
           AND A.MATRICOL < 8000
         ORDER BY TO_NUMBER(MATRICOL)) A
 WHERE NOT (AJSOMAJ = 0 AND BAZACALCUL = 0)
