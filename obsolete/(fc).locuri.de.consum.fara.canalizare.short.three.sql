/*
locuri de consum fara canalizare
*/

select c.nr, T.CLASCLI_COD,
       t.nume, 
       s.denumire || ' ' || c.nr_strada || ',' || c.bloc || ',' || c.scara || ',' ||
       c.scara || ',' || c.etaj || ',' || c.apartament || ' Jud. ' ||
       c.judet || ' Loc.' || c.localitate || ' Cod ' || c.cod_postal adresa_contract,
       b.simbol cod,
       b.unitier_cod,
       b.loccons_nr,
       b.judet,
       b.localitate,
       b.denumire,
       b.numar,
       b.bloc,
       b.scara,
       b.apart,
       b.etaj,
       b.nr_persoane
  from contracte_furnizare c,
       terti t,
       strazi s,
       (select gm.simbol,
               gm.unitier_cod,
               t.nume,
               gm.LOCCONS_NR,
               gm.judet,
               gm.localitate,
               str.denumire,
               gm.numar,
               gm.bloc,
               gm.scara,
               gm.APART,
               gm.etaj,
               a.nr_persoane
          from grupuri_de_masura gm,
               strazi str,
               terti t,
               (select distinct contract,
                                locul_de_consum,
                                localitate,
                                judet,
                                nr_persoane
                  from (select distinct cf.id as contract,
                                        cf.localitate,
                                        cf.judet,
                                        cf.tipcontfur_cod tip,
                                        cf.NR,
                                        cfr.loccons_nr as locul_de_consum,
                                        ts.denumire serviciu_furnizat,
                                        ts.cod,
                                        --cfr.tiptarif_cod,
                                        va.nr_persoane
                          from contracte_furnizare cf,
                               --contorizari cz,
                               conditii_furnizare cfr,
                               tipuri_serviciu_furnizat ts,
                               tipuri_tarif_furnizare tf,
                               (select id, sum(valoare) nr_persoane
                                  from valori_atribut va
                                 where Va.ATRIB_COD = 'PERS'
                                 group by id) va,
                               (select max(cf.nr) nr,
                                       cf.contrfurn_id,
                                       cf.loccons_nr,
                                       cf.servfurn_nr
                                  from conditii_furnizare cf
                                 group by cf.contrfurn_id,
                                          cf.loccons_nr,
                                          cf.servfurn_nr) a
                         where cf.id = cfr.contrfurn_id
                           and cfr.nr = a.nr
                           and cfr.contrfurn_id = a.contrfurn_id
                           and cfr.loccons_nr = a.loccons_nr
                           and cfr.servfurn_nr = a.servfurn_nr
                              and cfr.activa = 'D' and cfr.validata = 'D'
                           and cfr.tiptarif_cod = tf.cod
                           and tf.tipserv_cod = ts.cod                           
                           and ts.cod in ('APA', 'AIN') -- era gresit inainte APAIN !!!
                           and CFR.ATRIB_ID = Va.ID(+)
                           and nvl(cf.activ, 'N') = 'D'
                           and nvl(cf.inchis, 'N') = 'N')
                 where not exists
                 (select contrfurn_id
                          from parametri_furnizare
                         where (parcontr_cod = 'PROCAN' and valoare <> 0)
                           and contrfurn_id = contract and loccons_nr = locul_de_consum)) a
         where gm.contrfurn_id = a.contract
           and gm.loccons_nr = a.locul_de_consum
           and gm.tert_id = t.id and GM.TIPGRUPMAS_COD <> 'CAN' -- scoatem grupurile de masura care au DOAR METEO
           and (gm.strada = str.cod and gm.judet = str.judet and gm.localitate = str.localitate)) b
 where (c.strada_cod = s.cod and s.judet = c.judet and
       s.localitate = c.localitate)
   and c.nr = b.simbol
   and c.tert_id = t.id
   --and c.nr in ('P33970','P33778')
-- 'contract not in (select contrfurn_id from parametri_furnizare where (parcontr_cod='PROCAN' and valoare <>0))
--
--       )
--       group by tip,judet,localitate

/*
locuri de consum fara canalizare
*/