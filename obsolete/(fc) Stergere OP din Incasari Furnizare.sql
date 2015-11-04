SELECT idorg,SUM(VALOARE) FROM solduri_tert WHERE idorg IN (
--ca sa intoarca si suma comenteaza selectul de mai jos
--SELECT * FROM solduri_tert WHERE idorg IN (

--- >>>> de AICI 1. - ruleaza cu F9 .
select id from incasari_furnizare where nr=2401 and data=to_date('24/01/2014', 'DD/MM/YYYY')  
and tert_id=(SELECT TERT_ID FROM CONTRACTE_FURNIZARE WHERE NR = 'A1038')
--- <<<< pana AICI 

--) 
) group by idorg

/*
update incasari_furnizare set validat = 'N' where id = 6396545;
commit;
delete incasari_furnizare where id = 6396545;
commit;
*/