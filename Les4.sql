use DB_Foundations;

select sum(salary)
from employees
where department_id = 60;

-- GROUP BY CLAUSULE

select sum(salary)
from employees
group by department_id;

-- dit groepeert de resultaten van de query volgens de 'group by' zoekterm

select department_id, sum(salary)
from employees
group by department_id;

-- !!!!!!!!!!!!!!!!!!!!!!



-- Hoeveel medewerkers werken in elk departement?

select department_id, count(employee_id) -- kan ook count(*) gebruiken
from employees
group by department_id;


-- wat is het gemiddeld loon binnen elke job id?

select job_id, avg(salary)
from employees
group by job_id;


-- wat is het laagste loon binnen elke job_id?

select job_id, min(salary)
from employees
group by job_id;

-- of


select job_id, min(salary) as "Laagste Loon"
from employees
group by job_id;



-- wat is het hoogste loon binnen elke job_id?

select job_id, max(salary) as "Hoogste Loon"
from employees
group by job_id;



select job_id, min(salary) as "Laaste Loon", max(salary) as "Hoogste Loon"
from employees
group by job_id;



-- wat is in departement 50 het gemiddeld loon binnen elke job_id (afzonderlijk)

select job_id, avg(salary)
from employees
where department_id = 50
group by job_id;



select job_id, avg(salary)
from employees
where department_id = 50
group by job_id
order by job_id desc;



select job_id, avg(salary)        -- DIT WERKT NIET
from employees					  -- GEAGGREGEERDE FUNCTIES MOGEN NIET BINNEN EEN WHERE GEBRUIKT WORDEN
where avg(salary) >= 8000
group by job_id;


-- DIT ZAL WEL WEKREN:

select job_id, avg(salary)       	-- 'HAVING'-function
from employees					  
group by job_id
	having avg(salary) >= 8000 ;




select job_id, avg(salary)
from employees
where department_id = 50
group by job_id
	having avg(salary) >= 5000
order by job_id desc;





select * from employees;
