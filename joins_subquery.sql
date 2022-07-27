-- Week 5 - Wednesday Questions
-- 1. List all customers who live in Texas (use JOINs)
SELECT *
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- Returns a list of 5 customers who live in Texas

-- 2. Get all payments above $6.99 with the Customer's Full Name

SELECT CONCAT(first_name, ' ', last_name) AS full_name, amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;

--Returns a list of all customers that had amounts greater than 6.99

-- 3. Show all customers names who have made payments over $175(use
-- subqueries)

SELECT *
FROM customer
WHERE customer_id IN (
  SELECT customer_id
  FROM payment
  GROUP BY customer_id
  HAVING SUM(amount) > 175
  ORDER BY SUM(amount) DESC
);

--Returns a list of 7 customers who have made payments over $175

-- 4. List all customers that live in Nepal (use the city
-- table)

SELECT CONCAT(first_name, ' ', last_name) AS full_name, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';

--Return 1 person that lives in Nepal

-- 5. Which staff member had the most
-- transactions?

SELECT staff_id, SUM(amount)
FROM payment
GROUP BY staff_id
ORDER BY SUM(amount) DESC;
Staff member 2 had the most transactions

-- 6. How many movies of each rating are
-- there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT *
FROM customer
WHERE customer_id IN (
  SELECT customer_id
  FROM payment
  GROUP BY customer_id
  HAVING SUM(amount) > 6.99
  ORDER BY SUM(amount) DESC
);

-- 8. How many free rentals did our stores give away?

SELECT amount, staff_id, customer_id
FROM payment
ORDER BY amount ASC
LIMIT 20;

--Returns a list of 20 payments that were made by staff member that equaled 0 dollars
