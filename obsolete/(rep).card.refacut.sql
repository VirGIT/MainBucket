select 
car.matricol matricol, 
ca.nume||' '||ca.prenume nume, 
ca.cod_ui||' - '||ca.den_ui unitatea, 
ca.functia functia,
car.refacut_la data_refacerii,
car.motivul_refacerii,
count(car.matricol) nr_refaceri
from card_acces ca, card_acces_refacut car
where car.matricol = ca.matricol (+)
group by 
car.matricol, 
ca.nume||' '||ca.prenume, 
ca.cod_ui||' - '||ca.den_ui, 
ca.functia, 
car.refacut_la, 
car.motivul_refacerii
order by 1