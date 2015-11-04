select unitier.cod cod_ui, 
         upper(unitier.denumire) den_ui,
       ang.matricol marca,
       initcap(substr(trim(ang.nume) || ' ' || trim(ang.initiala) || ' ' ||
                      trim(ang.prenume),
                      1,
                      40)) nume_intreg,
       post.cod cod_post,
       lower(post.denumire) denumire_post,
       aa.functie_cod cod_functie,
       lower(f.denumire) denumire_functie,
       upper(aa.regimlucru_cod) regim_lucru
  from posturi              post,
       angajati             ang,
       alocari_angajat      aa,
       functii              f,
       unitati_ierarhice    unitier,
       alocari_stat_angajat al,
       perioade_angajati    pe
 where unitier.cod = post.unitier_cod
   and aa.angajat_matricol = ang.matricol
   and aa.pana_la is null
   and aa.post_id = post.id
   and aa.functie_cod = f.cod
   and ang.activ = 'D'
   and al.angajat_matricol = ang.matricol
   and al.perang_id = pe.id
   and pe.denumire = to_char(:denumire)
 order by 1
