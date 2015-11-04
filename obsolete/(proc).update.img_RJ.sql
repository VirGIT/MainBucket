create or replace procedure update_img_rj(p_id       VARCHAR2,
                                          p_filename VARCHAR2) as
  dst_file BLOB;
  src_file BFILE;
  lgh_file BINARY_INTEGER;
  v_nok    varchar2(250);

begin
  -- lock record
  SELECT foto
    INTO dst_file
    FROM card_acces
   WHERE matricol = p_id
     FOR UPDATE;

  src_file := BFILENAME('CROS', p_filename);

  if dbms_lob.fileexists(src_file) = 1 then
    begin
      --dbms_output.put_line('Marca '||p_id);
    
      -- open the file
      dbms_lob.open(src_file, dbms_lob.file_readonly);
    
      -- determine length
      lgh_file := dbms_lob.getlength(src_file);
    
      -- read the file
      dbms_lob.loadfromfile(dst_file, src_file, lgh_file);
    
      -- update the blob field
      UPDATE card_acces SET foto = dst_file WHERE matricol = p_id;
    
      -- close file
      dbms_lob.close(src_file);
    
    end;
  else
    -- update the blob field  
    UPDATE card_acces
       SET foto = EMPTY_BLOB()
     where matricol = p_id;

  end if;
  commit;
end;
/
