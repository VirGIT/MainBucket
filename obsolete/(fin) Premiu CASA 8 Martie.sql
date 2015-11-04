SELECT cod_unit_ier,
       MATR to_number_vv_matricol,
       nume,
       NVL(avans, 0) avans,
       NVL(avans, 0) av,
       semnatura,
       den_unit_ier,
       NVL(litere_c, 'zero') litere_c,
       categ,
       brut,
       brut - avans cas
  FROM (SELECT vv.cod_unit_ier COD_UNIT_IER,
               TO_NUMBER(vv.matricol) MATR,
               vv.nume NUME,
               dif.avans AVANS,
               vv.semnatura SEMNATURA,
               vv.den_unit_ier den_unit_ier,
               litere_c,
               categ,
               denp,
               brut
          FROM (SELECT DISTINCT TO_NUMBER(A.unitier_cod) cod_unit_ier,
                                TO_NUMBER(A.MATRICOL) mm,
                                RTRIM(A.NUME || ' ' || RTRIM(A.PRENUME)) NUME,
                                TO_NUMBER(v.valoare) AVANS,
                                TO_NUMBER(vvv.valoare) brut,
                                '_________________' SEMNATURA,
                                U.DENUMIRE || ' - ' ||
                                DECODE(Categ,
                                       'TESA',
                                       'TESA',
                                       DECODE(Categ,
                                              'MUNCITOR',
                                              'MUNCITORI',
                                              '????')) den_UNIT_IER,
                                litere_c,
                                CATEG,
                                p.denumire denp
                  FROM ANGAJATI A,
                       UNITATI_IERARHICE U,
                       VALORI_VARIABILA_ANGAJAT v,
                       PERIOADE_ANGAJATI p,
                       VALORI_VARIABILA_ANGAJAT vvv,
                       (SELECT RTRIM(Valoare_In_Litere(SUM(VV.valoare))) LITERE_C,
                               A.UNITIER_COD COD_U,
                               VA.VALOARE categ
                          FROM VALORI_VARIABILA_ANGAJAT VA,
                               PERIOADE_ANGAJATI        p,
                               VALORI_VARIABILA_ANGAJAT vv,
                               ALOCARI_STAT_ANGAJAT     A
                         WHERE (VA.VARANG_COD = 'CATEG_PERS' AND
                               VA.ANGAJAT_MATRICOL = A.ANGAJAT_MATRICOL --AND a.MATRICOL NOT IN () and a.activ='D' 
                               AND A.unitier_cod NOT IN ('99', '330', '300') AND
                               VA.PERANG_ID = p.ID AND vv.perang_id = p.ID AND
                               p.ID = :p_perang_id
                               -- p.denumire='Martie 2007' 
                               AND vv.varang_cod = 'PREMIU_CASA' AND
                               VV.ANGAJAT_MATRICOL = VA.ANGAJAT_MATRICOL AND
                               A.PERANG_ID = P.ID)
                         GROUP BY A.UNITIER_COD, VA.VALOARE),
                       (SELECT A.angajat_MATRICOL M_CATEG,
                               A.UNITIER_COD      COD_U1,
                               V.VAloare          CATEG1
                          FROM VALORI_VARIABILA_ANGAJAT V,
                               ALOCARI_STAT_ANGAJAT     A,
                               PERIOADE_ANGAJATI        P
                         WHERE V.VARANG_COD = 'CATEG_PERS'
                           AND A.perang_id = p.ID
                           AND V.ANGAJAT_MATRICOL = A.angajat_MATRICOL
                           AND V.PERANG_ID = P.ID
                           AND p.ID = :p_perang_id)
                --P.DENUMIRE='Martie 2007' )
                 WHERE (A.UNITIER_COD = U.COD AND COD_U = A.UNITIER_COD AND
                       A.MATRICOL = M_CATEG AND CATEG = CATEG1 AND
                       COD_U = COD_U1 AND v.varang_cod = 'PREMIU_CASA' AND
                       v.angajat_matricol = A.matricol AND
                       v.perang_id = p.ID AND p.ID = :p_perang_id and
                       vvv.varang_cod = 'PREM_8_MARTIE' AND
                       VvV.ANGAJAT_MATRICOL = A.MATRICOL and
                       vvv.perang_id = p.id
                       --and p.denumire='Martie 2007'
                       )) DIF,
               (SELECT A.unitier_cod cod_unit_ier,
                       A.matricol,
                       RTRIM(A.NUME || ' ' || RTRIM(A.PRENUME)) NUME,
                       0 AVANS,
                       '_________________' SEMNATURA,
                       U.DENUMIRE || ' - ' ||
                       DECODE(VA.VALOARE,
                              'TESA',
                              'TESA',
                              DECODE(VA.VALOARE,
                                     'MUNCITOR',
                                     'MUNCITORI',
                                     '????')) den_unit_ier,
                       A.CNP
                  FROM ANGAJATI                 A,
                       UNITATI_IERARHICE        U,
                       VALORI_VARIABILA_ANGAJAT VA,
                       PERIOADE_ANGAJATI        p
                 WHERE A.ACTIV = 'D'
                   AND VA.PERANG_ID = p.ID
                   AND p.ID = :p_perang_id
                      --and p.denumire='Martie 2007' 
                   AND SUBSTR(A.cnp, 1, 1) = '2'
                   AND A.UNITIER_COD = U.COD
                   AND VA.VARANG_COD = 'CATEG_PERS'
                   AND VA.ANGAJAT_MATRICOL = A.MATRICOL
                   AND A.UNITIER_COD NOT IN ('99', '330')) VV
         WHERE dif.Mm(+) = TO_NUMBER(VV.MATRICOL)
           AND vv.cod_unit_ier NOT IN ('99', '330', '300')
           and dif.avans > 0
         ORDER BY 1, 2)