   SELECT
          aa.unitier_cod||' - '||upper(ui.denumire) unitate,
          a.matricol,
          initcap(substr(trim(a.nume) || ' ' || trim(a.initiala) || ' ' || trim(a.prenume),1,40)) nume_intreg,
          cp.denumire den_categ_post,
          p.regimlucru_cod,
          aa.functie_cod cod_func,
          lower(f.denumire) den_fun,
          f.tipfunc_cod,
          p.cod cod_post,
          p.denumire denumire_post
         
     FROM 
          alocari_angajat aa,
          angajati a,
          unitati_ierarhice ui,
          functii f,
          posturi p,
          categorii_posturi cp
    WHERE  
                 aa.post_id = p.id
          AND aa.functie_cod = f.cod
          AND a.matricol = aa.angajat_matricol
          AND aa.unitier_cod = ui.cod
          AND p.categpost_cod = cp.cod
          and aa.pana_la is null
          and a.activ = 'D' and ui.activa = 'D'
          
          order by 1