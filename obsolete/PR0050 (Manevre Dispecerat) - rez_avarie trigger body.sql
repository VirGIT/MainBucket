declare
	cursor c is select distinct vva.valoare from valori_variabila_angajat vva, angajati a
	            where vva.angajat_matricol = a.matricol and vva.varang_cod = 'SEF_DISPECER' 
	                  and vva.perang_id = (select max(p.id) from perioade_angajati p)
	                  and a.usercros_nume = USER;
	                  r c%rowtype;

 old_value varchar2(1);
 
begin
	old_value := get_item_property('manevre_rj.rez_avarie',database_value);
	open c;
	fetch c into r;
	if c%notfound and old_value = 'D' then
		message('Nu se poate devalida un document validat.');
		message('Nu se poate devalida un document validat.',NO_ACKNOWLEDGE);
		:manevre_rj.rez_avarie:='D';
	elsif	c%found and old_value = r.valoare then 
		set_item_property('manevre_rj.rez_avarie',UPDATE_ALLOWED,PROPERTY_TRUE);
		close c;
		raise form_trigger_failure;
	end if;
end;

freeze_validat;