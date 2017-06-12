use DB_Foundations;

select first_name, last_name 
from employees;

select phone_number, last_name, first_name
from employees;

select *
from employees
where job_id = 'IT_PROG';

select *
from employees
where job_id = 'iT_PROG';
-- hoewel de data-invoer case sensitive is, kan er wél gezocht worden met where zonder 
-- dat de case sensitivity ertoe doet
 

select *
from employees
where manager_id = 103;
-- aanhalingstekens mogen weggelaten worden bij getallen

select *
from employees
where manager_id > 103
  and manager_id < 149;


select *
from employees
where job_id = 'IT_PROG'
   or job_id = 'ST_CLERK';


select *
from employees
where JOB_ID = 'iT_PROG'
   or JOB_ID = 'ST_CLERK'
   or JOB_ID = 'ST_MAN';

-- DIT DOET HETZELFDE ALS DEZE HIERONDER!!
   
select * 
from employees
where JOB_ID IN ('IT_PROG','ST_CLERK', 'ST_MAN');  

select * 
from employees
where JOB_ID = 'IT_PROG'
and HIRE_DATE < '1992-01-01';

select *
from employees
where hire_date = '1999-11-16';
-- bij data zijn aanhalingstekens wél vereist

select *
from employees
where hire_date >= '1999-11-16';

select *
from employees
where MANAGER_ID between 103 and 149;
-- OPM: Deze AND is niet hetzelfde als een andere AND. Maakt deel uit van een andere operator between
-- bij between worden de zoekwaarden zelf ook meegeteld (ENGELS =/= SQL)

select *
from employees
where first_name > 'Kevin';
-- hier wordt Kevin uiteraard niet meegenomen

select *
from employees
where first_name > 'K*';
-- hier wordt Kevin wél meegenomen (cf woordenboek)





select * 
from employees;

select * 
from departments;

select * 
from locations;

select * 
from countries;

select * 
from regions;

select * 
from jobs;

select * 
from job_history;

select * 
from job_grades;

