SELECT cl.language,
cl.percentage
FROM countrylanguage as cl
JOIN country as cn ON cn.code = cl.CountryCode
JOIN city as ct ON ct.countrycode = cn.code
WHERE ct.name = 'Santa Monica';

SELECT region, COUNT(name) FROM country GROUP BY region;
SELECT region, SUM(population) FROM country GROUP BY region;
SELECT continent, SUM(population) FROM country GROUP BY continent;
SELECT continent, avg(lifeexpectancy) FROM country GROUP BY continent;
SELECT region, avg(lifeexpectancy) FROM country GROUP BY region;
SELECT lower(CONCAT(first_name, " ", last_name)) as full_name FROM actor;
SELECT actor_id, first_name, last_name FROM actor WHERE first_name LIKE 'Joe';
SELECT actor_id, first_name, last_name FROM actor WHERE last_name LIKE '%gen%';
SELECT country_id, country FROM country WHERE country in ('Afghanistan', 'Bangladesh', 'China');
SELECT last_name, COUNT(last_name) FROM actor GROUP BY last_name;
SELECT last_name, COUNT(last_name) as last_count FROM actor GROUP BY last_name HAVING COUNT(last_name) >= 2;
