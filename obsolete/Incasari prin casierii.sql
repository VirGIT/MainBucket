create or replace view fc_platitori_casierii_rj as

select t.unitier_cod sector, 'Casierii Apavital' centru, count(distinct(furn.tert_id)) nr_platitori
from incasari_furnizare furn, conturi c, terti t, perioade_facturare pf
where c.cont like '5311%' 
          and furn.data between add_months(pf.la,-1) and pf.la 
          and pf.perioada = rajac_pkg.get_perioada () 
          --and pf.perioada like :denumire
          and t.unitier_cod = rajac_pkg.get_unitier_cod () 
          --and t.unitier_cod like :unitier_cod
          and furn.cont_cont = c.cont
          and furn.tert_id = t.id
          and furn.validat = 'D' and furn.anulata = 'N'
          group by t.unitier_cod
          
          union
          
select t.unitier_cod sector, 'Prin alte mijloace de plata' centru, count(distinct(furn.tert_id)) nr_platitori
from incasari_furnizare furn, conturi c, terti t, perioade_facturare pf
where c.cont not like '5311%' 
          and furn.data between add_months(pf.la,-1) and pf.la 
          and pf.perioada = rajac_pkg.get_perioada () 
          --and pf.perioada like :denumire
          and t.unitier_cod = rajac_pkg.get_unitier_cod () 
          --and t.unitier_cod like :unitier_cod
          and furn.cont_cont = c.cont
          and furn.tert_id = t.id
          and furn.validat = 'D' and furn.anulata = 'N'
          group by t.unitier_cod;
		  
show errors;


exec ad_usr.set_user(user); 
--DROP PUBLIC SYNONYM fc_platitori_casierii_rj; 
CREATE PUBLIC SYNONYM fc_platitori_casierii_rj FOR RAJAC_IASI.fc_platitori_casierii_rj; 
GRANT SELECT ON RAJAC_IASI.fc_platitori_casierii_rj TO CROS_VIEW;


-- RAPOARTE_MODUL_SERVER_RJ
declare 
    l_id number(10); 
begin 
    l_id := null; 
    adauga_raport_modserv_rj('FC','Platitori casierii','Filtru : perioada facturare + sectorul de facturare','fc_platitori_casierii_rj', 'LUNA', 'D', l_id); -- RAPOARTE_MODUL_SERVER_RJ
    adauga_acces_raport_modserv_rj(L_ID, 'RAJAC_IASI'); -- acces_rap_mod_serv_rj
    adauga_acces_raport_modserv_rj(l_id, 'MARICICA_S');       
    commit; 
end;