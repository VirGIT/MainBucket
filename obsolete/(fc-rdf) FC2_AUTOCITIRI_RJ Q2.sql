select distinct dc.id, dc.din din_data, dc.unitier_cod||' - '||u.denumire sector, dc.perfact_perioada perioada, dc.note, dc.nr document
from documente_citire dc, unitati_ierarhice u, contoare_citite cont 
where dc.unitier_cod = u.cod(+) and cont.doccit_id(+) = dc.id and dc.nr = :nr_doc