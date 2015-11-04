select a.*,
       ep.norma norma_lunara,
       ( select nvl(sum(cantitate),0)
       from obiecte o2
       where --a.unitier_cod = o2.unitier_cod and
             a.articol_cod = o2.articol_cod and
             a.angajat_matricol = o2.angajat_matricol and
             ROUND(MONTHS_BETWEEN(TRUNC(sysdate) , o2.data_crearii ),0) <= ep.norma ) cantitate_consumata_norma
--             se insumeaza cantitatile create in intervalul <data curenta> - <data creare> = norma
from (
select func.unitier_cod, cros_ar.denumire_unitier(func.unitier_cod) denumire_unitier,
       func.cod_func, func.den_fun denumire_functie,
       O.ARTICOL_COD, cros_ar.denumire_articol(o.articol_cod) denumire_articol,
       O.ANGAJAT_MATRICOL, cros_hr.NUME_ANGAJAT(o.angajat_matricol) nume_angajat,
       O.DATA_CREARII,
       O.CANTITATE,
       O.STAREOB_COD
from obiecte o,
     hr_functii_rj func,
     articole ar
where o.angajat_matricol = func.matricol and
      func.pana_la is null and
      --o.data_crearii between func.de_la and nvl(func.pana_la, sysdate) and
      o.stareob_cod = 'OPER' and

      o.articol_cod = ar.cod and
      ar.clasart_cod = '4' and
      ar.subclasart_cod = '1'

      ) a,
      normative_rj np,
      echipamente_protectie_rj ep
where ( ep.normativ_id is null or ep.normativ_id = np.id ) and np.activ = 'D' and
      a.unitier_cod = ep.unitier_cod(+) and
      a.articol_cod = ep.articol_cod(+) and
      a.cod_func = ep.cod_func(+)

order by a.UNITIER_COD, a.cod_func, a.ANGAJAT_MATRICOL, a.ARTICOL_COD, a.DATA_CREARII
