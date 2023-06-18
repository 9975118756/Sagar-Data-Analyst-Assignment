use assignment;


-- Employees with salary > 3000.
SELECT 
    empid, fname, lname, deptno, salary
FROM
    employee
WHERE
    (salary > 3000);
    
-- Students graduated with first class.
SELECT 
    COUNT(*) AS CNT_first_class
FROM
    students
WHERE
    marks BETWEEN 50 AND 80;
    
-- students with distinction.
SELECT 
    COUNT(*) AS CNT_distinction_class
FROM
    students
WHERE
    marks > 80;
    
    
-- list of city names from station with even ID numbers only.
SELECT DISTINCT
    id, city, state
FROM
    station
WHERE
    id % 2 = 0;
    

-- difference between the total number of city entries in 
-- the table and the number of distinct city entries in the table

SELECT 
    COUNT(city) - COUNT(DISTINCT city) AS difference
FROM
    station;

-- list of CITY names starting with vowels (i.e., a, e, i, o, or u)

SELECT DISTINCT
    city
FROM
    station
WHERE
    city LIKE 'a%' OR city LIKE 'e%'
        OR city LIKE 'i%'
        OR city LIKE 'o%'
        OR city LIKE 'u%';


-- list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) 
-- as both their first and last characters
SELECT DISTINCT
    city
FROM
    station
WHERE
    city LIKE '[a,e,i,o,u] % [a,e,i,o,u]'; 
    

-- list of CITY names from STATION that do not start with vowels
SELECT 
    DISTINCT city
FROM
    station
WHERE
    city NOT LIKE '[a,e,i,o,u]%';
    
-- the list of CITY names from STATION that either do not start with vowels or do not end with vowels.

SELECT DISTINCT
    city
FROM
    station
WHERE
    city NOT LIKE '[A,E,I,O,U]%[A,E,I,O,U]';
    
-- list of employee names having a salary greater than $2000 per month 
-- who have been employed for less than 36 months. 
-- Sort your result by descending order of salary

SELECT 
    *
FROM
    emp
WHERE
    salary > 2000
        AND DATE_SUB(NOW(), INTERVAL 36 MONTH) < hire_date
ORDER BY salary DESC; 

-- money that the company spend every month on salaries for each department
SELECT 
    deptno, SUM(salary)
FROM
    employee
GROUP BY deptno;

-- cities in the CITY table have a Population larger than 100000. 
SELECT 
    COUNT(*) AS no_of_cities_with_population_greater_100000
FROM
    city
WHERE
    population > 100000;
    
    
    
-- the total population of California.
SELECT 
    SUM(population)
FROM
    city
WHERE
    district = 'california';
    

-- the average population of the districts in each country.
SELECT 
    district, AVG(population) AS avg_population
FROM
    city
GROUP BY district;

-- the ordernumber, status, customernumber, customername and comments for all orders that are ‘Disputed.
# first we will have to perform a join.



SELECT 
    o.ordernumber,
    o.status,
    o.customernumber,
    c.customername,
    o.comments
FROM
    orders AS o
        INNER JOIN
    customers AS c ON o.customernumber = c.customernumber
WHERE
    status = 'Disputed'; 


-- -----------------------------------------------------------------------
    
    