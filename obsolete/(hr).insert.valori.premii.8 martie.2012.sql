insert into valori_variabila_angajat
  (select matricol angajat_matricol,
          'PREM_8_MARTIE' varang_cod,
           2344 perang_id,
          '150' valoare,
          'RAJAC_IASI' modificata_de,
          sysdate modificata_la
     from angajati a, alocari_stat_angajat aa
    where aa.angajat_matricol = a.matricol
      and substr(cnp, 1, 1) = '2')
      and a.activ = 'D';
      
commit;

--delete valori_variabila_angajat where perang_id=1883 and varang_cod='PREM_8_MARTIE'

--select * from valori_variabila_angajat where angajat_matricol=2306 and perang_id=2344 and varang_cod='PREM_8_MARTIE'
