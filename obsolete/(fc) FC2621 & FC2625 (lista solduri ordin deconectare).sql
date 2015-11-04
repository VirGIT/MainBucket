select rownum, soldtert.nr_doc factura, soldtert.data_doc, soldtert.tert_id, soldtert.sold_lei sold
           from solduri_tert soldtert, terti tert
          where soldtert.tert_id = tert.id
            and soldtert.tip = 'FP'
            and soldtert.in_sold = 'D'
            and soldtert.cont_cont like '411%'

