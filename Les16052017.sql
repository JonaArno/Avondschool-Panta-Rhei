select * from employees;

select * from DEPARTMENTS;
select * from LOCATIONS;

select * from DEPARTMENTS, LOCATIONS;   -- Zinloos want geen koppeling. Verschijnen alle twee naast elkaar, maar geen koppeling. 
										-- Je krijgt het carthesis product (= alle mogelijke resultaten). Zie department ID 10.

-- !!!! IMPORTANT --

select * from DEPARTMENTS, LOCATIONS
where DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID;


select * 	
	FROM DEPARTMENTS
	JOIN LOCATIONS
	ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID;
    
    
    
-- Opdracht: maak een lijst van combinaties van departementen (id and name)
-- met hun medewerkers (id, first_name, last_name and department_id)    
    
select departments.department_ID, DEPARTMENT_NAME, employee_ID, First_name, Last_name
	FROM DEPARTMENTS, employees
    where departments.department_id = employees.department_ID;
    
-- alternatief - voor Oracle beiden te kennen
    
select departments.department_ID, DEPARTMENT_NAME, employee_ID, First_name, Last_name
	FROM DEPARTMENTS
    JOIN EMPLOYEES
    where departments.department_id = employees.department_ID;




SELECT first_name, last_name, department_name, city
FROM EMPLOYEES e	-- introductie ALIAS
JOIN DEPARTMENTS d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN LOCATIONS l
ON d.location_id = l.location_id;



SELECT first_name, last_name, department_name, city
FROM EMPLOYEES e, DEPARTMENTS d, LOCATIONS l
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND city = "Toronto";


-- SQL engine joint hieronder zelf op basis van kolomnaam de correcte kolommen

SELECT department_id, department_name, location_id, city
FROM DEPARTMENTS
NATURAL JOIN locations;


SELECT department_id, department_name, location_id, city
FROM DEPARTMENTS
NATURAL JOIN LOCATIONS
WHERE department_id IN (20,50);			-- in is een datatype, dus moet overeenkomen



-- dit is beknopter dan departments.location_id = locations.location_id
SELECT department_id, department_name, location_id, city
FROM DEPARTMENTS
JOIN LOCATIONS
USING (location_id);


-- OPGELET!! Natural join zal alle matchende kolommen samenvoegen, terwijl deze een andere functie heeft in EMPLOYEES en in DEPARTMENTS
SELECT employee_id, last_name, location_id, department_id
FROM EMPLOYEES
NATURAL JOIN DEPARTMENTS;


SELECT employee_id, last_name, location_id, department_id
FROM EMPLOYEES
JOIN DEPARTMENTS
USING (location_id);

select worker.last_name emp, manager.last_name mgr
FROM employees worker
	JOIN employees manager
	ON (worker.manager_id = manager.employee_id);
    
    
select e.last_name, e.salary, j.grade_level
FROM employees e
		JOIN job_grades j
        ON e.salary between j.lowest_sal and j.highest_sal;
        
        
    



