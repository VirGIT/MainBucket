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
           decode(lc.nr_strada,null,st.denumire,'Str.'||st.denumire||', Nr.'||ltrim(lc.nr_strada))||
           decode(lc.bloc,null,'',', Bl. '||ltrim(lc.bloc))||
           decode(lc.scara,null,'',', Sc. '||ltrim(lc.scara)) adresa
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
   
      S := S || r.adresa || ' ;' ||CHR(10);
   
  end loop;
  return S;
end;
/
