select 
ac.cod_ui ui_cod,
case when length(ac.den_ui) < 27 then chr(10)||ac.den_ui else ac.den_ui end  ui,
ac.matricol,
ac.nume,
ac.prenume,
ac.functia functie,
ac.foto
from 
card_acces  ac
where tiparita = 'N' and length(ac.foto) > 0
order by 4,5