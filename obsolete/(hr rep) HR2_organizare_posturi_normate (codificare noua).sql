select ui.cod, ui.denumire,
(decode(tm.top_management,null,0,tm.top_management)+decode(c.conducere,null,0,c.conducere)+decode(s.specialitate,null,0,s.specialitate)+decode(ma.maistri,null,0,ma.maistri)+decode(mc.muncitori_calificati,null,0,mc.muncitori_calificati)+decode(mn.muncitori_necalificati,null,0,mn.muncitori_necalificati)) TOTAL,
decode(tm.top_management,null,0,tm.top_management) top_management,
decode(c.conducere,null,0,c.conducere) conducere,
decode(ma.maistri,null,0,ma.maistri) maistri,
decode(s.specialitate,null,0,s.specialitate) specialitate, 
decode(mc.muncitori_calificati,null,0,mc.muncitori_calificati) muncitori_calificati , 
decode(mn.muncitori_necalificati,null,0,mn.muncitori_necalificati) muncitori_necalificati

from
unitati_ierarhice ui,

(select fun.unitier_cod ui, count(fun.matricol) top_management from hr_functii_rj fun where fun.cod_categ_post = 1 and fun.pana_la is null group by fun.unitier_cod) tm, 
(select p.unitier_cod ui, count(p.cod) top_management from posturi p where p.categpost_cod = 1 and p.la is null group by p.unitier_cod) tm_e,

(select fun.unitier_cod ui, count(fun.matricol) conducere from hr_functii_rj fun where fun.cod_categ_post = 2 and fun.pana_la is null group by fun.unitier_cod) c,
(select p.unitier_cod ui, count(p.cod) conducere from posturi p where p.categpost_cod = 2 and p.la is null group by p.unitier_cod) c_e,

(select fun.unitier_cod ui, count(fun.matricol) specialitate from hr_functii_rj fun where fun.cod_categ_post = 4 and fun.pana_la is null group by fun.unitier_cod) s,
(select p.unitier_cod ui, count(p.cod) specialitate from posturi p where p.categpost_cod = 4 and p.la is null group by p.unitier_cod) s_e,

(select fun.unitier_cod ui, count(fun.matricol) maistri from hr_functii_rj fun where fun.cod_categ_post = 3 and fun.pana_la is null group by fun.unitier_cod) ma,
(select p.unitier_cod ui, count(p.cod) maistri from posturi p where p.categpost_cod = 3 and p.la is null group by p.unitier_cod) ma_e,

(select fun.unitier_cod ui, count(fun.matricol) muncitori_calificati from hr_functii_rj fun where fun.cod_categ_post = 5 and fun.pana_la is null group by fun.unitier_cod) mc,
(select p.unitier_cod ui, count(p.cod) muncitori_calificati from posturi p where p.categpost_cod = 5 and p.la is null group by p.unitier_cod) mc_e,

(select fun.unitier_cod ui, count(fun.matricol) muncitori_necalificati from hr_functii_rj fun where fun.cod_categ_post = 6 and fun.pana_la is null group by fun.unitier_cod) mn,
(select p.unitier_cod ui, count(p.cod) muncitori_necalificati from posturi p where p.categpost_cod = 6 and p.la is null group by p.unitier_cod) mn_e

where ui.activa = 'D' 
and ui.tipunit_cod not in ('GEST','CASA') 
and ui.cod not like 'S%' 
and ui.cod not like 'LAB%' 
and ui.cod not like 'REGIST%'
and ui.cod not in (300,330)
and ui.cod = tm.ui(+) and ui.cod = tm_e.ui(+)
and ui.cod = c.ui(+) and ui.cod = c_e.ui(+)
and ui.cod = s.ui(+) and ui.cod = s_e.ui(+)
and ui.cod = ma.ui(+) and ui.cod = ma_e.ui(+)
and ui.cod = mc.ui(+) and ui.cod = mc_e.ui(+)
and ui.cod = mn.ui(+) and ui.cod = mn_e.ui(+)
 order by 1