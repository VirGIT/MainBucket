CREATE OR REPLACE procedure RAJAC_IASI.populare_control_acces_rj as
begin
  execute immediate ('delete card_acces where matricol < 5000');
--  execute immediate ('update card_acces set foto = empty_blob()');
  
  -- se insereaza in card_acces datele actualizate ale angajatilor activi pe ultima perioada
  
    insert into card_acces
      select         a.matricol as matricol,
                       a.matricol as legitimatie,
                       upper(a.nume) as nume,
                       initcap(substr(trim(a.prenume),1,40)) as prenume, 
                       lower(f.denumire) as functia,
                       u.cod as cod_ui,
                       upper(u.denumire) as den_ui,
                       'D' as activ,
                       'N' as tiparita,
                       empty_blob() as foto
               from alocari_stat_angajat        aa,
                       angajati                           a,
                       adrese_angajat                 t,
                       unitati_ierarhice                u,
                       functii                               f,
                       valori_variabila_angajat     v,
                       perioade_angajati             p
               where aa.unitier_cod != 203
                   and aa.perang_id = p.id
                   and a.activ = 'D'
                   and a.matricol = aa.angajat_matricol
                   and p.id = (select max(per.id) from perioade_angajati per)
                   and a.matricol = t.angajat_matricol
                   and aa.unitier_cod = u.cod
                   and v.angajat_matricol = a.matricol
                   and v.perang_id = p.id
                   and v.varang_cod = 'FUNCTIA'
                   and f.cod = v.valoare;
                   commit;
         update card_acces set tiparita = 'D' where activ = 'D';
         commit;          
                   -- incarc pozele in card_acces
declare
  cursor c is select ltrim(rtrim(matricol)) matricol from card_acces; --where tiparita = 'N' ;
  r c%rowtype;
  v_filename varchar2(32);
  
begin
  
  dbms_output.put_line('Begin foto !');

  for r in c loop
  
    v_filename := r.matricol||'.jpg';

    update_img_rj(r.matricol, v_filename);
    
  end loop;
  
  dbms_output.put_line('End Update foto !');
  
  exception
    WHEN OTHERS THEN
      dbms_output.put_line('Err '||sqlerrm||v_filename);
  
end;
commit;
   
             end;
/
