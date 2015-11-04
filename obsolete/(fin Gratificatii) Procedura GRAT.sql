CREATE OR REPLACE PROCEDURE RAJAC_IASI.GRAT_2011 AS
--DECLARE
  A                     NUMBER;
  p_n                   number(5);
  F_C_S                 number(5);
  p_S                   number(5);
  p_S_t                 number(5);
  NR_I                  NUMBER(15);
  ncrt                  number(15);
  MATR_ANTER            NUMBER(5);
  ACTUALIZARE_VENITURI  VARCHAR2(2) := 'D';
  POPULARE_ANGAJATI     VARCHAR2(2) := 'D';
  ACTUALIZARE_nem       VARCHAR2(2) := 'D';
  P_AN                  VARCHAR2(4) := 2011;
  ACTUALIZARE_sanctiuni VARCHAR2(2) := 'D';

  --create table GRATIFICATII_2011 as select * from GRATIFICATII_2009 where 1=0
  --DBMS_SQL.BIND_VARIABLE(cur, ':ACTUALIZARE_VENITURI', 'D');
  --EXECUTE DBMS_SQL.BIND_VARIABLE(ANGAJ, ':POPULARE_ANGAJATI', 'D');
  --EXECUTE DBMS_SQL.BIND_VARIABLE(cur, ':ACTUALIZARE_nem', 'D');

  --cursor a1 is select 1 from dual where :ACTUALIZARE_VENITURI='D' AND :POPULARE_ANGAJATI='D' and :ACTUALIZARE_nem='D';

  CURSOR VEN IS
    select MATRICOL,
           SUM(cros_hr.valvarang_num(matricol, P.ID, 'VALREG', 'N') +
               cros_hr.valvarang_num(matricol, P.ID, 'VFUNC', 'N') +
               cros_hr.valvarang_num(matricol, P.ID, 'VECH', 'N') +
               cros_hr.valvarang_num(matricol, P.ID, 'VAL_CO_FARAPRIM', 'N')) TOT_VEN
      FROM ANGAJATI, PERIOADE_ANGAJATI P
     WHERE TO_CHAR(P.DELA, 'YYYY') = '2011' --and :ACTUALIZARE_VENITURI='D' 
     group by matricol;

  CURSOR ANGAJ IS
    SELECT MATRICOL,
           INITCAP(A.NUME || ' ' || A.INITIALA || ' ' || A.PRENUME) nume_PRENUME,
           denunitier
      FROM ANGAJATI A,
           (SELECT ANGAJAT_MATRICOL, MAX(perang_id) mpid
              FROM ALOCARI_STAT_ANGAJAT AA
             WHERE EXISTS (SELECT ID
                      FROM PERIOADE_ANGAJATI
                     WHERE AA.PERANG_ID = ID
                       AND TO_CHAR(LA, 'YYYY') = '2011')
             group by angajat_matricol) asa,
           (select denumire             denunitier,
                   ui.cod,
                   asa.angajat_matricol,
                   asa.perang_id        pid
              from UNITATI_IERARHICE ui, ALOCARI_STAT_ANGAJAT asa
             where ui.cod = asa.unitier_cod) unit
     WHERE MATRICOL < 8000
       AND matricol = asa.angajat_matricol
       and unit.pid = asa.mpid
       and unit.angajat_matricol = A.matricol
       AND POPULARE_ANGAJATI = 'D'; --AND MATRICOL=:M;

  CURSOR NEM IS
    SELECT *
      FROM (SELECT MATRICOL,
                   INITCAP(A.NUME || ' ' || A.INITIALA || ' ' || A.PRENUME) nume_PRENUME,
                   SUM(cros_hr.valvarang_NUM(matricol, P.ID, 'ONEM', 'N')) -
                   8 *
                   MAX(cros_hr.valvarang_NUM(matricol, P.ID, 'MOTIVATE', 'N')) TOTAL_NEM
              FROM ANGAJATI A, PERIOADE_ANGAJATI p
             where TO_CHAR(dela, 'yyyy') = P_AN
             GROUP BY MATRICOL, A.NUME, A.PRENUME, A.INITIALA)
     where total_nem != 0
       and ACTUALIZARE_nem = 'D';

  --CURSOR CB IS SELECT * FROM 
  --(SELECT MATRICOL ,INITCAP(A.NUME||' '||A.INITIALA||' '||A.PRENUME) nume_PRENUME,
  -- SUM(cros_hr.valvarang_num(matricol,P.ID,'ZI_CC_CAS','N')+cros_hr.valvarang_num(matricol,P.ID,'ZI_CC_SOC','N') ) CC,
  -- SUM(cros_hr.valvarang_num(matricol,P.ID,'TZ_B','N')-cros_hr.valvarang_num(matricol,P.ID,'ZI_CC_CAS','N')-cros_hr.valvarang_num(matricol,P.ID,'ZI_CC_SOC','N') )CB,
  -- SUM(cros_hr.valvarang_num(matricol,P.ID,'ZINV','N')+cros_hr.valvarang_num(matricol,P.ID,'ZCS','N') )INV_CFS
  -- FROM angajati A,perioade_angajati p
  -- where to_char(dela,'yyyy')=:P_AN AND MATRICOL>=8000
  -- GROUP BY MATRICOL,A.NUME,A.PRENUME,A.INITIALA
  --)
  --where nvl(cc,0)+nvl(cb,0)+nvl(inv_cfs,0)>0 and :ACTUALIZARE_cb='D';

  CURSOR SANCT IS
    SELECT MATR matricol, SANCTIUNE, den_per
      FROM (select TO_NUMBER(MATRICOL) MATR,
                   cros_hr.valvarang_CHAR(matricol, P.ID, 'SANCTIUNE', 'N') SANCTIUNE,
                   p.denumire den_per
              from ANGAJATI A, PERIOADE_ANGAJATI p
             where TO_CHAR(dela, 'yyyy') = P_AN
             ORDER BY P.DELA) A
     where NVL(SANCTIUNE, 'NU ARE SANCTIUNI') != 'NU ARE SANCTIUNI'
       and ACTUALIZARE_sanctiuni = 'D'
     ORDER BY MATR; --,P.DELA 

  R sanct%rowtype;

  FUNCTION CALC_PROC_SANCT(F_C_S number, P_S varchar2) return Number is
  begin
    IF F_C_S >= 2 THEN
      RETURN 100;
    ELSE
      RETURN LEAST(100, p_s);
    END IF;
  end;

  function proc_sanctiune(v_sanctiune varchar2) return Number is
  begin
    if V_sanctiune = 'RETROGRADARE' then
      return 50;
    ELSIF V_sanctiune = 'PENALIZARE' then
      return 50;
    ELSIF V_sanctiune IN ('AVERTISMENT', 'MUSTRARE') then
      return 10;
    ELSE
      return 0;
    END IF;
  end;

  function F_COUNT_SANCTIUNI(v_matricol  number,
                             v_sanctiune varchar2,
                             V_DEN_PER   VARCHAR2) return Number is
    LUNA     VARCHAR2(20);
    AN       VARCHAR2(20);
    S_PRECED VARCHAR2(20);
    aa       number(10);
  begin
    SELECT TO_CHAR(DELA, 'MM')
      INTO LUNA
      FROM PERIOADE_ANGAJATI
     WHERE DENUMIRE = V_DEN_PER;
    SELECT TO_CHAR(DELA, 'YYYY')
      INTO AN
      FROM PERIOADE_ANGAJATI
     WHERE DENUMIRE = V_DEN_PER;
  
    select COUNT(*)
      into aa
      from (sELECT cros_hr.valvarang_CHAR(V_matricol, PID, 'SANCTIUNE', 'N') S_PREC
              FROM DUAL,
                   (SELECT ID pid
                      FROM PERIOADE_ANGAJATI
                     WHERE TO_CHAR(DELA, 'MM') + 1 = LUNA
                       AND TO_CHAR(DELA, 'YYYY') = AN));
    if aa = 1 then
      sELECT cros_hr.valvarang_CHAR(V_matricol, PID, 'SANCTIUNE', 'N')
        into s_preced
        FROM DUAL,
             (SELECT ID pid
                FROM PERIOADE_ANGAJATI
               WHERE TO_CHAR(DELA, 'MM') + 1 = LUNA
                 AND TO_CHAR(DELA, 'YYYY') = AN);
    else
      s_preced := 'nu are';
    end if;
    IF v_SANCTIUNE = S_PRECED THEN
      RETURN 0;
    ELSE
      RETURN 1;
    END IF;
  end;

  function calc_PROC_NEM(tot_nem number) return number is
    PRC NUMBER(5);
  BEGIN
    PRC := 0;
    IF TOT_NEM BETWEEN 1 AND 15 THEN
      PRC := 25;
    ELSIF TOT_NEM BETWEEN 16 AND 24 THEN
      PRC := 50;
    ELSE
      PRC := 100;
    END IF;
    IF TOT_NEM <= 0 THEN
      PRC := 0;
    END IF;
    return prc;
  END;

  --function Calc_PROC_cb (tzb number) return number is
  --A NUMBER(10);
  --begin
  --
  --  IF TZb BETWEEN 45 AND 65 THEN RETURN 25;
  --    ELSIF tzb BETWEEN 66 AND 100 THEN  RETURN 50;
  --    ELSIF tzb>100 THEN RETURN 100;
  --    else return 0;
  --  END IF; 
  --
  --end;

BEGIN

  A    := 0;
  NR_I := 0;
  NCRT := 0;
  for v in angaj loop
    A := A + 1;
  end loop;
  IF POPULARE_ANGAJATI = 'D' then
    NR_I := NR_I + A;
  end if;

  A := 0;
  for v in nem loop
    A := A + 1;
  end loop;
  IF ACTUALIZARE_NEM = 'D' then
    NR_I := NR_I + A;
  end if;

  --A:=0;
  --for v in cb loop
  --a:=a+1;
  --end loop;
  --IF :ACTUALIZARE_CB='D' then
  --  NR_I:=NR_I+A;
  --end if;  

  A := 0;
  for v in SANCT loop
    A := A + 1;
  end loop;
  IF ACTUALIZARE_sanctiuni = 'D' then
    NR_I := NR_I + A;
  end if;

  A := 0;
  IF POPULARE_ANGAJATI = 'D' then
    delete GRATIFICATII_2011;
    commit;
    FOR V IN ANGAJ LOOP
      A := A + 1;
      INSERT INTO GRATIFICATII_2011
        (MATRICOL,
         NUME_PRENUME,
         den_unit_ier,
         TOTAL_NEM,
         PROC_NEM,
         PROC_SANCT,
         VENITURI,
         VENIT_AFECTAT_PROC)
      VALUES
        (V.MATRICOL, V.NUME_PRENUME, v.denunitier, 0, 0, 0, 0, 0);
      IF MOD(A, 100) = 0 THEN
        COMMIT;
      END IF;
      NCRT := NCRT + 1;
      UPDATE AAA_BP
         SET ROWPROCESSED = NCRT,
             PERCENT      = TO_CHAR(100 * NCRT / nr_i, '9,999.000') || ' %';
      COMMIT;
    END LOOP;
  END IF;
  commit;

  IF ACTUALIZARE_NEM = 'D' then
    FOR V IN NEM LOOP
      UPDATE GRATIFICATII_2011
         SET TOTAL_NEM = V.TOTAL_NEM
       WHERE MATRICOL = V.MATRICOL;
      A := A + 1;
      IF MOD(A, 100) = 0 THEN
        COMMIT;
      END IF;
      NCRT := NCRT + 1;
      UPDATE AAA_BP
         SET ROWPROCESSED = NCRT,
             PERCENT      = TO_CHAR(100 * NCRT / nr_i, '9,999.000') || ' %';
      COMMIT;
      p_n := calc_proc_nem(v.total_nem);
      UPDATE GRATIFICATII_2011
         SET PROC_NEM = P_n
       WHERE MATRICOL = v.MATRICOL;
    
    END LOOP;
  END IF;
  commit;

  --IF :ACTUALIZARE_CB='D' then
  --   FOR V IN CB LOOP        
  --     UPDATE GRATIFICATII_2002 SET CC=V.CC, CB=V.CB, INV_CFS=V.INV_CFS WHERE MATRICOL=V.MATRICOL;
  --     p_s_t:=Calc_PROC_cb(v.cc+v.cb+v.inv_cfs);
  --     UPDATE GRATIFICATII_2002 SET proc_cb=P_S_T WHERE MATRICOL=V.MATRICOL;
  --     A:=A+1;
  --     IF MOD(A,100)=0 THEN
  --      COMMIT;
  --     END IF;
  --NCRT:=NCRT+1;
  --UPDATE impdate.AAA_BP SET ROWPROCESSED=NCRT,PERCENT=TO_CHAR(100*NCRT/nr_i,'9,999.000')||' %';
  --COMMIT; 
  --   END LOOP;
  --END IF;
  --commit;

  IF ACTUALIZARE_sanctiuni = 'D' then
    OPEN SANCT;
    FETCH SANCT
      INTO R;
    CLOSE SANCT;
    MATR_ANTER := R.MATRICOL;
    F_C_S      := 0;
    P_S        := 0;
    FOR V IN SANCT LOOP
      --      for VV IN SANCT AND VV.MATRICOL=V.MATRICOL LOOP
      IF V.MATRICOL = MATR_ANTER THEN
        F_C_S := F_C_S +
                 F_COUNT_SANCTIUNI(V.MATRICOL, V.SANCTIUNE, V.DEN_PER);
        P_S   := proc_sanctiune(V.SANCTIUNE); --p_s + proc..
      ELSE
        --loop;
        p_s_t := CALC_PROC_SANCT(F_C_S, P_S);
        UPDATE GRATIFICATII_2011
           SET PROC_SANCT = p_s_t
         WHERE MATRICOL = MATR_ANTER;
        MATR_ANTER := V.MATRICOL;
        F_C_S      := 0;
        P_S        := 0;
        F_C_S      := F_C_S +
                      F_COUNT_SANCTIUNI(V.MATRICOL, V.SANCTIUNE, V.DEN_PER);
        P_S        := proc_sanctiune(V.SANCTIUNE); --p_s + proc..
      END IF;
      A := A + 1;
      IF MOD(A, 100) = 0 THEN
        COMMIT;
      END IF;
      NCRT := NCRT + 1;
      UPDATE AAA_BP
         SET ROWPROCESSED = NCRT,
             PERCENT      = TO_CHAR(100 * NCRT / nr_i, '9,999.000') || ' %';
      COMMIT;
    END LOOP;
  END IF;
  commit;

  IF ACTUALIZARE_VENITURI = 'D' then
    NR_I := NVL(NR_I, 0) + 1400;
    FOR V IN VEN LOOP
      UPDATE GRATIFICATII_2011
         SET VENITURI = V.TOT_VEN
       WHERE MATRICOL = V.MATRICOL;
      --     UPDATE GRATIFICATII_2002 SET VENIT_AFECTAT_PROC=VENITURI*round(GREATEST(0,100-PROC_NEM-PROC_CB-PROC_SANCT)/100,0) WHERE MATRICOL=V.MATRICOL;
      UPDATE GRATIFICATII_2011
         SET VENIT_AFECTAT_PROC = VENITURI *
                                  ROUND(GREATEST(0,
                                                 100 - PROC_NEM - PROC_SANCT) / 100,
                                        0)
       WHERE MATRICOL = V.MATRICOL;
      A := A + 1;
      IF MOD(A, 100) = 0 THEN
        COMMIT;
      END IF;
      NCRT := NCRT + 1;
      UPDATE AAA_BP
         SET ROWPROCESSED = NCRT,
             PERCENT      = TO_CHAR(100 * NCRT / nr_i, '9,999.000') || ' %';
      COMMIT;
    END LOOP;
  END IF;
  COMMIT;
  DELETE GRATIFICATII_2011 WHERE MATRICOL >= 8000;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('TOTAL INREGISTR.: ' || TO_CHAR(NR_I));
end;
/
