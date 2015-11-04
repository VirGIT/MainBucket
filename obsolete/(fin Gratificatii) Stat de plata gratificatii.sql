select ROWNUM NRCRT,
       A.marca,
       NUME,
       cnp,
       BRUT_GRATIF,
       SANAT,
       IMP_VENIT,
       NET_GRATIF,
       semnatura
  from (SELECT 1,
               A.marca,
               NUME,
               cnp,
               BRUT_GRATIF,
               SANAT,
               IMP_VENIT,
               NET_GRATIF,
               semnatura
          FROM (SELECT angajat_MATRICOL marca,
                       SUBSTR(trim(nume) || ' ' || TRIM(INITIALA) || ' ' ||
                              trim(prenume),
                              1,
                              40) nume,
                              aa.cnp cnp,
                       TO_NUMBER(ROUND(VALOARE, 0)) BRUT_GRATIF,
                       ROUND(ROUND(VALOARE, 0) * 0.055, 0) SANAT,
                       ROUND((ROUND(VALOARE, 0) -
                             ROUND(ROUND(VALOARE, 0) * 0.055, 0)) * 0.16,
                             0) IMP_VENIT,
                       
                       ROUND(VALOARE, 0) - ROUND(ROUND(VALOARE, 0) * 0.055) -
                       ROUND((ROUND(VALOARE, 0) -
                             ROUND(ROUND(VALOARE, 0) * 0.055, 0)) * 0.16,
                             0) NET_GRATIF,
                       '...............................' SEMNATURA
                  FROM VALORI_VARIABILA_ANGAJAT_GR A, ANGAJATI AA
                 WHERE A.ANGAJAT_MATRICOL = AA.MATRICOL
                   AND A.ACTIV = 'N'
                   AND ROUND(VALOARE, 0) > 0) A
        
        UNION
        SELECT 0,
               NULL,NULL,
               '~    TOTAL :.......................',
               SUM(ROUND(VALOARE, 0)),
               SUM(ROUND(ROUND(VALOARE, 0) * 0.055)),
               SUM(ROUND((ROUND(VALOARE, 0) -
                         ROUND(ROUND(VALOARE, 0) * 0.055, 0)) * 0.16,
                         0)),
               --SUM(IMP_VENIT),
               SUM(ROUND(VALOARE, 0) - ROUND(ROUND(VALOARE, 0) * 0.055) -
                   ROUND((ROUND(VALOARE, 0) -
                         ROUND(ROUND(VALOARE, 0) * 0.055, 0)) * 0.16,
                         0)),
               NULL
          FROM VALORI_VARIABILA_ANGAJAT_GR
         WHERE ACTIV = 'N'
         ORDER BY 3) A
