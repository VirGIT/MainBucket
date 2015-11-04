select rownum nrcrt, a.*
  from (select tert.cod, tert.nume || ' - ' || tert.strada || ' ' || tert.nr nume, soldtert.id sldid, soldtert.nr_doc factura, soldtert.data_doc, tert.unitier_cod sector, soldtert.tert_id, soldtert.valoare_lei valoare, soldtert.sold_lei sold, soldtert.tip
           from solduri_tert soldtert, terti tert
          where soldtert.tert_id = tert.id
            and soldtert.tip = 'FP'
            and soldtert.in_sold = 'D'
            and tert.cod = upper(:p_cod)
            and soldtert.cont_cont like '411%'
          order by replace(cros_util.extract_cuvant_nr(tert.cod, 1, '.'), 'Fost ') || '.' ||
                    lpad(cros_util.extract_cuvant_nr(tert.cod, 2, '.'), 4, '0') || '.' ||
                    lpad(cros_util.extract_cuvant_nr(tert.cod, 3, '.'), 3, '0'), soldtert.tip, soldtert.data_doc, soldtert.nr_doc) a
