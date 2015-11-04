-- incarc pozele in angajati_foto_card
declare
  cursor c is select ltrim(rtrim(matricol)) matricol from card_acces where tiparita = 'N' ;
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
