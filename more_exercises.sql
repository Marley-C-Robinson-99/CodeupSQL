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

SELECT 
CONCAT(cus.first_name, " ", cus.last_name) as full_name,
cus.email
FROM customer as cus
JOIN address as a USING(address_id)
JOIN city as cit USING(city_id)
JOIN country as con USING(country_id)
WHERE con.country_id = 20;

SELECT 
cat.name as Category,
SUM(p.amount)
FROM category as cat
JOIN film_category as fcat
  ON fcat.category_id = cat.category_id
JOIN inventory as i
  ON i.film_id = fcat.film_id
JOIN rental as r USING(inventory_id)
JOIN payment as p USING(rental_id)
GROUP BY Category;
