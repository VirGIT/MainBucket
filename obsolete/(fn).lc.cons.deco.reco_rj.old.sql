CREATE OR REPLACE function RAJAC_IASI.LC_CONS_SIST_RJ(p_tert         number,
                                           P_DATA         DATE,
                                           p_aprobat_dec  varchar2,
                                           p_anulat       varchar2,
                                           p_executat_dec varchar2)
  return varchar2 is
  cursor c is
    SELECT t.cod,
           OD.TERT_ID,
           OD.LOCCONS_NR,
           decode(lc.bloc, null, '- ', ltrim(lc.bloc)) bloc,
           decode(lc.scara, null, '- ', ltrim(lc.scara)) scara,
           decode(st.denumire, null, '- ', ltrim(st.denumire)) denumire,
           decode(lc.nr_strada, null, '- ', ltrim(lc.nr_strada)) nr_strada
      FROM ORDINE_DECONECTARE OD, LOCURI_CONSUM LC, terti t, strazi st
     WHERE OD.DATA_DEC = TRUNC(P_DATA)
       AND OD.TERT_ID = P_TERT
       and od.TERT_ID = t.id
       and lc.JUDET = st.JUDET
       and lc.LOCALITATE = st.LOCALITATE
       and lc.STRADA_COD = st.cod
       AND OD.LOCCONS_NR = LC.NR
       AND OD.TERT_ID = LC.TERT_ID
       and od.aprobat_dec = p_aprobat_dec
       and od.EXECUTAT_REC = 'N'
       and od.anulat = p_anulat
       and od.executat_dec = p_executat_dec;
  r c%rowtype;
  s varchar2(9999) := '';
begin
  FOR R IN C LOOP
    if substr(r.cod, 1, 1) = 'A' then
      S := S || 'Str.' || r.denumire || ', Nr.' || r.nr_strada|| ', Bl.' || r.bloc || ', Sc.' || r.scara || ' ;' ||CHR(10);
    else
      s := s || 'Str.' || r.denumire || ', Nr.' || r.nr_strada || ' ;' ||CHR(10);
    end if;
  end loop;
  return S;
end;
/




CREATE OR REPLACE function RAJAC_IASI.LC_CONS_DECO_RJ(p_tert         number,
                                           P_DATA         DATE,
                                           p_aprobat_dec  varchar2,
                                           p_anulat       varchar2,
                                           p_executat_dec varchar2)
  return varchar2 is
  cursor c is
    SELECT t.cod,
           OD.TERT_ID,
           OD.LOCCONS_NR,
           decode(lc.bloc, null, '- ', ltrim(lc.bloc)) bloc,
           decode(lc.scara, null, '- ', ltrim(lc.scara)) scara,
           decode(st.denumire, null, '- ', ltrim(st.denumire)) denumire,
           decode(lc.nr_strada, null, '- ', ltrim(lc.nr_strada)) nr_strada
      FROM ORDINE_DECONECTARE OD, LOCURI_CONSUM LC, terti t, strazi st
     WHERE OD.DATA = TRUNC(P_DATA)
       AND OD.TERT_ID = P_TERT
       and od.TERT_ID = t.id
       and lc.JUDET = st.JUDET
       and lc.LOCALITATE = st.LOCALITATE
       and lc.STRADA_COD = st.cod
       AND OD.LOCCONS_NR = LC.NR
       AND OD.TERT_ID = LC.TERT_ID
       and od.aprobat_dec = p_aprobat_dec
       and od.APROBAT_REC = 'N'
       and od.anulat = p_anulat
       and od.executat_dec = p_executat_dec;
  r c%rowtype;
  s varchar2(9999) := '';
begin
  FOR R IN C LOOP
    if substr(r.cod, 1, 1) = 'A' then
      S := S || 'Str.' || r.denumire || ', Nr.' || r.nr_strada|| ', Bl.' || r.bloc || ', Sc.' || r.scara || ' ;' ||CHR(10);
    else
      s := s || 'Str.' || r.denumire || ', Nr.' || r.nr_strada || ' ;' ||CHR(10);
    end if;
  end loop;
  return S;
end;
/
