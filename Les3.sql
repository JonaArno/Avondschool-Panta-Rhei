use DB_Foundations;

select *
from employees
where HIRE_DATE = '1999-11-16';

select *
from employees
where first_name > 'k';
-- hier krijgen we voornamen met K ook mee omdat deze zoekterm gelijkaardig aan een 
-- woordenboek werkt

select *
from employees
where job_id = 'it_prog'
or job_id = 'st_clerk'
or job_id = 'st_man';

-- doet zelfde als:

select *
from employees
where job_id IN ('it_prog','st_clerk','st_man');


-- Extra operatoren:

-- IN
-- NOT IN

-- BETWEEN... AND...
-- NOT BETWEEN... AND ...

-- IS NULL
-- IS NOT NULL

-- LIKE
-- NOT LIKE


select first_name,last_name
from employees
where manager_id is null;

select first_name,last_name
from employees
where manager_id is not null;

select *
from employees
where job_id not IN ( 'it_prog', 'ad_vp');

-- het onderstaande doet hetzelfde:

select *
from employees
where NOT (job_id IN ( 'it_prog', 'ad_vp'));

-- zelfde als hetgeen hierboven

select *
from employees
where department_id not between 20 and 60;

-- 'appel'
-- 'a____' 	= specifiek aantal karakters wildcard
-- 'a%'		= willekeurig aantal of willekeurig aantal karakters

select *
from employees
where first_name like 'k%';

select *
from employees
where first_name not like 'k%';


-- OPDRACHT: maak een resultatenlijst met alle gegevens van alle medewerkers 
-- die IT_PROG of AD_VP zijn
-- en die in departement 60 zitten

select *
from employees 
where job_id in ('it_prog','ad_vp')
and department_id = 60;

-- OF ANDERE OPLOSSING:

select *
from employees
where (job_id = 'AD_VP' 
   or job_id = 'IT_PROG')
   and department_id = 60;

-- OPGELET: Het volgende zou in OracleDB niet werken. Er zijn haakjes nodig in dit geval
-- OOK MIS: where job_id = 'AD_VP' or 'IT_PROG'

select *
from employees 
where job_id = 'IT_PROG'
   or job_id = 'AD_VP'
   and department_id = 60;

-- AND krijgt voorrang op OR


select *
from employees
where first_name like '%r';
-- zoekt alle voornamen die eindigen op r 

select *
from employees
where first_name like '%r%';
-- zoekt alle voornamen die een r bevatten

select *
from EMPLOYEES
where first_name like '%e_';
-- e moet op de voorlaatste positie staan


-- OPDRACHT: maak een resultatenlijst met
-- alle gegevens van alle medewerkers 
-- die aangeworven zijn in 1997
select *
from employees
where hire_date like '1997%';


-- OPDRACHT: maak een resultatenlijst met
-- alle gegevens van alle medewerkers 
-- waarvan job_id een _ bevat

select*
from employees
where job_id like '%\_%';
-- met een backslash kan het volgende teken als niet-syntax gebruikt worden


select last_name, job_id, department_id, hire_date
from employees
order by hire_date;
-- QUERY RESULT SORTEREN

select *
from employees
where salary > 10000
order by hire_date;


select last_name, job_id, department_id, hire_date, manager_id
from employees
order by manager_id;
-- in MYSQL: nulls first (in OracleDB: nulls last)


select last_name, department_id, salary
from employees
order by department_id, salary DESC;

select employee_id, first_name
from employees
order by employee_id
limit 5;

select sum(salary)
from employees;

select sum(salary) as "Totaal uitbetaalde lonen"
from employees;
-- gebruik van een alias voor de kolomnaam van het resultaat


select sum(salary), avg(salary),min(salary),max(salary)
from employees;

select count(manager_id)
from employees;
-- GEEFT een rij minder aan dan verwacht => SQL geeft enkel de niet-lege rijen aan bij een count!
-- WEL MOGELIJK MET COUNT(*), dan wordt ALLES geteld, ook lege rijen

select count(*)
from employees;

select count(distinct manager_id)
from employees;
-- GEEFT weer hoeveel UNIEKE manager_id's gevonden worden

select *
from employees
where salary > 	avg(salary);
-- NIET TOEGELATEN (spijtig genoeg)






