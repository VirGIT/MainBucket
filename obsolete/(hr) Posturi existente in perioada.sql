select unitier.cod || ' - ' || unitier.denumire denumire_completa, a4.instalatie, post.regimlucru_cod, a1.cod_cor, a1.den_cor, count(*) nr_pers
  from posturi post, unitati_ierarhice unitier, (select p.id, va.valoare cod_cor, vpa.denumire den_cor
           from posturi p, valori_atribut va, valori_posibile_atribut vpa
          where p.atrib_id = va.id
            and va.atrib_cod =
                'COD_COR_NOU'
            and va.valoare =
                vpa.valoare
            and vpa.atrib_cod =
                'COD_COR_NOU') a1, (select p.id, va.valoare instalatie
           from posturi p, valori_atribut va
          where p.atrib_id = va.id
            and va.atrib_cod = 'INSTALATIE') a4
 where unitier.cod = post.unitier_cod
   and post.la is null
   and a1.id(+) = post.id
   and a4.id(+) = post.id
   and post.unitier_cod = unitier.cod
      
   and unitier.cod in (select unitier_cod
                         from utilizatori_unitate
                        where usercros_nume = user
                          and pentru_personal = 'D')
   and (unitier.cod like :p_unitier_cod or :p_unitier_cod = '%')
 group by unitier.cod || ' - ' || unitier.denumire, a4.instalatie, post.regimlucru_cod, a1.cod_cor, a1.den_cor
 order by 6
