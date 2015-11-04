select unitier.cod||' - '||unitier.denumire denumire_completa
    --  ,post.id id_post
      ,post.cod cod_post
      ,post.denumire denumire_post
      ,A1.COD_COR,A1.DEN_COR
      ,A2.INSTALATIE
   --   ,A3.DATA_FISA_POST
      ,ang.MATRICOL
  , initcap(substr(trim(ang.nume) || ' ' || trim(ang.initiala) || ' ' ||
                                      trim(ang.prenume),
                                      1,
                                      40)) nume_intreg
                                      ,   decode(ada.nr_strada,null,ada.strada,'Str.'||ada.strada||' Nr.'||ltrim(ada.nr_strada))||
                decode(ada.bloc,null,'',' Bl.'||ltrim(ada.bloc))||
                decode(ada.scara,null,'',' Sc.'||ltrim(ada.scara))||
                decode(ada.etaj,null,'',' Eaa.'||ltrim(ada.etaj))||
                decode(ada.apt,null,'',' Ap.'||ltrim(ada.apt))||
                decode(ada.cod_postal,null,'',' Cod Postal:'||trim(ada.cod_postal))
                || ', Jud.' || ada.judet || ', Loc.' || ada.localitate adresa_detaliat
      ,aa.FUNCTIE_COD
      ,F.DENUMIRE denumire_functie,
      to_number(CROS_HR.VALVARANG_NUM(al.angajat_matricol,pe.id,'SALARIU_INC','N'))        AS SALARIU_INCADRARE,
        to_number(CROS_HR.VALVARANG_NUM(al.angajat_matricol,pe.id,'ORE_NORMA','N'))        AS NORMA,
             ROUND(Cros_Hr.VALVARANG_NUM(al.angajat_matricol,
                                   pe.id,
                                   'SPOR_FUNC',
                                   'N') / 100 *
             Cros_Hr.VALVARANG_NUM(al.angajat_matricol,
                                   pe.id,
                                   'SALARIU_INC',
                                   'N'),
             0) VALOARE_SPOR_CONDUCERE,
             to_number(CROS_HR.VALVARANG_NUM(al.angajat_matricol,pe.id,'SPOR_FUNC','N'))        AS PR_SPOR_CONDUCERE,
              ROUND(Cros_Hr.VALVARANG_NUM(al.angajat_matricol,
                                   pe.id,
                                   'SPOR_DOCTORAT',
                                   'N') / 100 *
             Cros_Hr.VALVARANG_NUM(al.angajat_matricol,
                                   pe.id,
                                   'SALARIU_INC',
                                   'N'),
             0) VALOARE_SPOR_DOCTORAT,
             to_number(CROS_HR.VALVARANG_NUM(al.angajat_matricol,pe.id,'SPOR_DOCTORAT','N'))        AS PR_SPOR_DOCTORAT,
             to_number(CROS_HR.VALVARANG_NUM(al.angajat_matricol,pe.id,'VSP25','N'))        AS VALOARE_SPOR_SOFER,
           case when to_number(CROS_HR.VALVARANG_NUM(al.angajat_matricol,pe.id,'VSP25','N'))  = 0 then 0 else to_number('25') end AS PR_SPOR_SOFER,
             AA.REGIMLUCRU_COD regim_lucru
from   posturi post,angajati ang,alocari_angajat aa,FUNCTII F, adrese_angajat ada
      ,unitati_ierarhice unitier, alocari_stat_angajat al, perioade_angajati pe
      ,(select P.ID,VA.VALOARE COD_COR,VPA.DENUMIRE DEN_COR from posturi p,valori_atribut va,VALORI_POSIBILE_ATRIBUT VPA
        where p.atrib_id=va.ID and va.ATRIB_COD='COD_COR_NOU' AND VA.VALOARE=VPA.VALOARE AND vPa.ATRIB_COD='COD_COR_NOU') A1
      ,(select P.ID,VA.VALOARE INSTALATIE from posturi p,valori_atribut va where p.atrib_id=va.ID and va.ATRIB_COD='INSTALATIE' ) A2
      ,(select P.ID,VA.VALOARE DATA_FISA_POST from posturi p,valori_atribut va where p.atrib_id=va.ID and va.ATRIB_COD='DATA_FISA_POST') A3
where unitier.cod = post.unitier_cod
        and aa.ANGAJAT_MATRICOL=ang.MAtricol
        and aa.pana_la is null
        and aa.post_id=post.id
        and aa.pana_la is null
        AND A1.ID(+)=POST.ID
        AND A2.ID(+)=POST.ID
        AND A3.ID(+)=POST.ID
        AND aa.FUNCTIE_COD=F.COD
        and
        ada.valabila = 'D' and
                             ang.activ = 'D' and
                             ada.angajat_matricol = ang.matricol and
                              al.angajat_matricol = ang.matricol and
                                al.perang_id = pe.id
                             and al.perang_id = :p_id
                          --   al.perang_id = 2665
                          --   and ang.matricol = 2776
      --  and unitier.cod in (select unitier_cod from utilizatori_unitate where usercros_nume = user and pentru_personal = 'D')
      --  and (unitier.cod like :p_unitier_cod or :p_unitier_cod = '%')
order by 1