use DB_Foundations; -- hOOFDLETTERGEVOELIG,

USE Sakila;

-- <<  --  = comentaar

-- we selecteren alle kolommen en alle rijen (de volledige inhoud) uit een tabel
-- de rijen hebben geen volgorde

select * 
from employees ;
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

/*
andere tabellen die ons intresseren:

departments
locations
countries
regions
jobs
job_history
job_grades

*/

-- we selecteren bepaalde kolommen in bepaalde volgorde
--

select * 
from employees ;

select FIRST_NAME, LAST_NAME 
from employees ;

select  PHONE_NUMBER, LAST_NAME, FIRST_NAME 
from employees ;

select * 
from employees
where job_id = 'IT_prog';

select * 
from employees
where job_id = 'it_prog'; -- mag kleine letters zijn " niet hoofdletter gevoelig "

select * 
from employees
where job_id = 'it_prog'; -- aanhalingstekens vereist

select *
from employees
where MANAGER_ID = '103' ;

select *
from employees
where MANAGER_ID = 103 ; -- niet vereist voor aanhalingstekens

select *
from employees
where HIRE_DATE = '1999-11-16' ;

select *
from employees
where HIRE_DATE = 1999-11-16 ; -- aanhalingstekens vereist

select *
from employees
where HIRE_DATE >= '1999-11-16' ;

select *
from employees
where HIRE_DATE > '1999-11-16' ;

select *
from employees
where FIRST_NAME > 'kevin' ;
select *
from employees
where FIRST_NAME > 'k' ;
-- Wij selecteren bepaalde RIJEN
select *
from employees
where MANAGER_ID > 103 ;

-- We selecteren bepaalde RIJEN en bepaalde Kolommen

select *
from employees
where MANAGER_ID < 149 ;

select *
from employees
where MANAGER_ID > 103          -- geef de output  tussen de waarde's
  and MANAGER_ID < 149 ;
  
select *
from employees
where MANAGER_ID > 103 < MANAGER_ID ; -- neen dit mag niet

select *
from employees
where  103 < MANAGER_ID > 149 ; -- neen dit mag niet


select *
from employees
where JOB_ID = 'IT_prog' 
  and JOB_ID = 'ST_CLERK' ;	-- geen een output

select *
from employees
where JOB_ID = 'IT_prog' 
  or  JOB_ID = 'ST_CLERK' ; -- wel een output
  
  select *
  from employees
  where JOB_ID = 'IT_PROG'
     or JOB_ID = 'ST_CLERK'
	 or JOB_ID = 'ST_MAN' ;
  
   select *
  from employees
  where JOB_ID in ('IT_PROG', 'ST_CLERK', 'ST_MAN') ; -- gemakkelijker  dan deze boven
  
  select * 
from employees
where job_id = 'IT_prog'
   and HIRE_DATE < '1992-01-01';  -- moet een datum zijn 
   
   

select *
from employees
where MANAGER_ID BETWEEN  103 AND 149 ; -- werkt met de grenzen inclusief...

/*
waarbij AND tussen values moet staan
--bij BETWEEN wordt een >= en <= gehanteerd!!
in de formulering mag je zowel hoofd of kleine letters gebruiken
*/
  
  /* operatoren
  in 
  not in
  --------------
  BETWEEN.... AND.....
  Not BETWEEN ... AND.... 
  ---------------------
  IS NULL
  IS NOT NULL
  ------------------
  LIKE
  NOT LIKE
  ----------
  */
  
   -- personeelsleden die geen manager hebben 
   
  select * 
  from employees 
  where MANAGER_ID IS null ;
  
 -- voornaam en achternaam van alle medewerkers die wel een manager hebben 
 
   select   FIRST_NAME ,LAST_NAME 
  from employees 
  where MANAGER_ID is not null ;
 
  -- alle gegevens van alle medewerkers die geen IT_PROG of AD_vp zijn.
  
 select *
 from employees
 where JOB_ID  not like 'IT_PROG' or 'AD_VP' ;  -- lukt niet in deze context
 
 select *
 from employees
 where JOB_ID  not in ('IT_PROG', 'AD_VP') ;
 select *
 from employees
 where NOT (JOB_ID   in ('IT_PROG', 'AD_VP')) ;

  -- alle gegevens van alle medewerkers met een department_id groter dan 60 of kleiner dan 20
  
  select *
  from employees
  where DEPARTMENT_ID  not BETWEEN 20 AND 60 ;
    
  select *
  from employees
  where FIRST_NAME like 'k%';
  
   /* WILDCARDS
  'appel'
  'a_ _ _ _ '
  'a%'
  */
  
  -- alle gegevens van alle medewerkers met
  -- die AD_VP of IT_PROG zijn
  -- en die bovendien DEPARTMENT_ID 
  
 
  
  select *
 from employees
 where (JOB_ID   in ('IT_PROG', 'AD_VP')) 
 AND DEPARTMENT_ID = 60 ;
  
 select *
 from employees
 where JOB_ID = 'AD_VP'
	or JOB_ID = 'IT_PROG' 
	AND DEPARTMENT_ID = 60  ;
  
 select *
 from employees
 where JOB_ID = 'AD_VP'
	or (JOB_ID = 'IT_PROG'
	AND DEPARTMENT_ID = 60 ) ;
 select *
 from employees
 where (JOB_ID = 'AD_VP'
	or JOB_ID = 'IT_PROG' )
	AND DEPARTMENT_ID = 60 ; 
     
  -- alle medewerkers van alle medewerkers waarvan voornaam eindigt op "r"
  
  select *
  from employees
  where FIRST_NAME like '%r' ;
  
  -- alle medewerkers van alle medewerkers waarvan voornaam een "r" bevat

  select *
  from employees
  where FIRST_NAME like '%r%' ;
  
  
-- alle medewerkers van alle medewerkers waarvan voornaam een "e" heeft op de voorlaaste positie

select *
from employees
where FIRST_NAME like '%e_' ;

-- alle medewerkers  die aangeworven zijn in "1997"

  select * 
from employees
where HIRE_DATE between '1997-01-01' and '1997-12-31';
select *
from employees
where HIRE_DATE like '1997%' ;

-- alle gegevens van alle medewerkers 
-- waarvan job_id een underscore bevat

select EMPLOYEE_ID, LAST_NAME, JOB_ID
from employees
where JOB_ID like '%\_%' ; -- in mysql , " \" is always the escape characters

-- **************************************************
-- **************************************************
-- **************************************************
-- **************************************************
-- **************************************************
select *
from employees ;

-- order BY clause

SELECT *
FROM employees
where SALARY > 10000
ORDER BY HIRE_DATE ;

SELECT *
FROM employees
ORDER BY JOB_ID ; -- rangschikking binnen groep "it_prog"

SELECT LAST_NAME, JOB_ID, DEPARTMENT_ID, HIRE_DATE, MANAGER_ID
from employees
order by MANAGER_ID ;   -- in Mysql: NULLS FIRST ( in Oracle DB: NULLS LAST)

-- eerste rangorde, tweed rangorde, ...

select LAST_NAME, DEPARTMENT_ID, SALARY
from employees
order by DEPARTMENT_ID, SALARY ;

-- oplopend orderen , aflopend orderen

select LAST_NAME, DEPARTMENT_ID, SALARY
from employees
order by DEPARTMENT_ID, SALARY DESC;

select EMPLOYEE_ID, FIRST_NAME
from employees
order by EMPLOYEE_ID
LIMIT 5 ;

select EMPLOYEE_ID, FIRST_NAME
from employees
order by EMPLOYEE_ID
LIMIT 5,3 ;  -- de volgende drie: de 6de, 7de en 8ste.


select *
from employees;

select sum(SALARY)
from employees ; -- meerdere rijen samen voegen tot 1 rij

select sum(SALARY), FIRST_NAME
from employees ; -- niet zin vol

select sum(SALARY) as "huppeldepup"
from employees ; -- kolmomalias

select sum(SALARY)  "huppeldepup"
from employees ; -- kolmomalias as hoeft niet maar is beter leesbaar

select sum(SALARY) 
from employees 
where DEPARTMENT_ID = 60 ; -- 


/*
sum()
avg()
min()
max()
count()
*/

select sum(SALARY), 
		avg(SALARY), 
		min(SALARY),
		max(SALARY), 
		count(SALARY), 
		count(MANAGER_ID), 
		count(distinct MANAGER_ID), 
		count(*) 
from employees ;

select count(*) 
from employees 
where DEPARTMENT_ID = 90;

-- aggrerende functie NIET TOEGELATEN in WHERE-clausule
-- foutmelding

select * 
from employees 
where SALARY > avg(SALARY); -- niet toegelaten

/* 07-03-2017 */
-- hoeveel medewerkers werke er in elk departement (afzonderlijk)?

select DEPARTMENT_ID, count(SALARY)  /* kolom naam moet gelijk zijn in group by */
from employees
group by DEPARTMENT_ID;

-- wat is het gemiddeld loon binnen elke job_id (afzonderlijk)?

select JOB_ID , avg(salary) as "laagste loon"    /* normaal moet  'laagste loon' gebruiken , maar in oracle is het "laagste loon" */   
from employees
group by JOB_ID;

-- wat is het gemiddeld laagste binnen elke job_id (afzonderlijk)?

select JOB_ID , min(salary)
from employees
group by JOB_ID;

-- wat is het gemiddeld hoogste binnen elke job_id (afzonderlijk)?

select JOB_ID ,min(SALARY), max(salary)
from employees
group by JOB_ID;			

-- wat is in departement 50
-- het gemiddeld loon binnen elke job_id (afzonderlijk)?

select *
from employees
where DEPARTMENT_ID = 50;


select JOB_ID, avg(salary)
from employees
where DEPARTMENT_ID = 50
group by JOB_ID
order by JOB_ID desc;


/* select
	from
    where
    group by -- dit moet in deze volgorde gebruikt worden..
    having 
    order by
*/
    
select job_id, avg(salary)
from employees
group by JOB_ID;
    
select job_id, avg(salary)
from employees
where avg(salary) >= 8000 -- gaat niet  je moet het onderstaande gebruiken
group by JOB_ID;
 
select job_id , avg(salary)
from employees
group by JOB_ID
having avg(salary) >= 8000; -- test op groupen
    
select JOB_ID, avg(salary)
from employees
where DEPARTMENT_ID = 50
group by JOB_ID;     		-- test op rijen 

select job_id , avg(salary)
from employees
where DEPARTMENT_ID = 50
group by JOB_ID
having avg(salary) >= 5000    
order by JOB_ID desc;
    
/* 16/05/17 */

/* inner join */

select *
from Departments;

select *
from locations;

select *
from Departments, locations; /* catesisch product, niet zinvolle join, wilde join*/

select *
from departments, locations /* catesisch product,  zinvolle join, */
where departments.location_id = locations.LOCATION_id; 

select *
from departments
	join locations
    on departments.location_id = locations.LOCATION_ID;
 
select employees.department_id, department_name , employee_id , FIRST_NAME, last_name, departments.department_id
from departments , employees 
where departments.DEPARTMENT_ID = employees.DEPARTMENT_id;

select employees.department_id, department_name , employee_id , FIRST_NAME, last_name, departments.department_id
from departments
	join employees
    on departments.DEPARTMENT_ID = employees.DEPARTMENT_ID;

/* test*/
select *
from employees;
/* ----*/

select first_name, LAST_NAME,DEPARTMENT_NAME,CITY
from employees e
	join departments d
	on e.department_id = d.department_id
	join locations l
	on d.location_id = l.location_id
;

select first_name, LAST_NAME,DEPARTMENT_NAME,CITY
from employees e, departments d, locations l
where e.department_id = d.department_id
	and d.location_id = l.location_id
;

/* alternative syntaxen */

select DEPARTMENT_ID, DEPARTMENT_NAME,LOCATION_ID,CITY
from departments
	natural join locations;
    
select DEPARTMENT_ID, DEPARTMENT_NAME,LOCATION_ID,CITY
from departments
	natural join locations
where DEPARTMENT_ID in (20,50);    

select DEPARTMENT_ID, DEPARTMENT_NAME,LOCATION_ID,CITY
from departments
	join locations
    using (location_id);
    
select employee_id, last_name, location_id , department_id
from employees
	join departments
    using (department_id); 
 
 select employee_id, last_name, location_id , department_id
from employees
	natural join departments ;
    
select employee_id, last_name, location_id , department_id
from employees
	join departments
    using (department_id, manager_id); 
  
  /* self join - moet 2 aliassen geven */

  select worker.last_name emp , manager.last_name mgr
from employees worker
	join employees manager
    on (worker.manager_id = manager.employee_id);
 
 select e.last_name, e.salary, j.grade_level
 from employees e
	join job_grades j
    on e.salary between j.lowest_sal and j.highest_sal;

select e.last_name, d.department_id , d.department_name
from employees e
right outer join departments d
   on (e.department_id = d.department_id);
   
select e.last_name, d.department_id , d.department_name
from employees e
full outer join departments d								/* werkt hier niet ,alleen in apex*/
   on (e.department_id = d.department_id);


select e.last_name, d.department_id , d.department_name
from employees e
left outer join departments d
   on (e.department_id = d.department_id)
   
union

select e.last_name, d.department_id , d.department_name
from employees e
right outer join departments d
   on (e.department_id = d.department_id);   
   
   select last_name,department_name
   from employees
   cross join departments;
   
select e.department_id , avg(e.salary) gemiddeld_loon
from employees e, departments d , locations l
where e.department_id = d.department_id
and d.location_id = l.Location_id
and l.city = 'seattle'
group by department_id
having gemiddeld_loon > 5000
order by gemiddeld_loon
;



/* 23-05-17 */


select * 
from employees;

select DEPARTMENT_ID
from departments
where DEPARTMENT_NAME = "marketing"
;

select DEPARTMENT_ID
from departments
where DEPARTMENT_NAME = "marketing"
	or DEPARTMENT_NAME = "administration"
;

select *
from employees
where DEPARTMENT_ID =  20 ;

select *
from employees
where DEPARTMENT_ID in (10, 20) ;

select *
from employees
where DEPARTMENT_ID in (select DEPARTMENT_ID
						from departments
						where DEPARTMENT_NAME = "marketing"
							or DEPARTMENT_NAME = "administration"
						) 
;

select *
from employees
where DEPARTMENT_ID = (select DEPARTMENT_ID		/* subselect of hoofd select*/
					   from departments
					   where DEPARTMENT_NAME = "marketing"
                       ) 
;

select *
from employees e, departments d
where e.department_id = d.department_id
	and DEPARTMENT_NAME = "marketing"
;
 -- maak een resultatenlijst met de department_id's van alle departementen in seattle--
 
 select location_id
 from locations
 where CITY = " Seattle"
 ;
 
 select departmen_id
 from departments
 where LOCATION_ID = 1700
 ;
 
 select department_id
 from departments
 where LOCATION_ID = (select location_id
					  from locations
						where CITY = " Seattle"
					  )
 ;
 -- maak een resultatenlijst met alle medewerkers die in seattle werken.
  select *
 from employees
 where DEPARTMENT_ID in (select department_id
						 from departments
						 where LOCATION_ID In (select location_id
											  from locations
											  where CITY = "Seattle"
											  )
						)
;
                        
 select DEPARTMENT_ID, avg(salary) as gemiddeld_loon
 from employees
 where DEPARTMENT_ID in (select department_id
						 from departments
						 where LOCATION_ID In (select location_id
											  from locations
											  where CITY = "Seattle"
											  )
						)
group by DEPARTMENT_ID
having gemiddeld_loon > 5000
order by gemiddeld_loon                        
 ;
 
 -- slects 1 veld in select ( of *)
 -- niet "distrinct"
 -- niet "order by"
 
 