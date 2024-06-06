--1. List all customers who live in Texas (use JOINs)
select first_name , last_name 
from customer 
inner join address 
on customer.address_id =address.address_id 
where district ='Texas';

--2. Get all payments above $6.99 with the Customer's Full Name
SELECT customer.first_name, customer.last_name,payment.amount
FROM customer
INNER join payment
ON customer.customer_id = payment.customer_id
where amount > 6.99;

--3. Show all customers names who have made payments over $175(use subqueries)
SELECT customer.customer_id ,customer.first_name, customer.last_name, payment.amount
FROM customer
INNER JOIN payment
ON customer.customer_id =payment.customer_id
group by customer.customer_id, payment.amount 
having SUM(amount) >175.00
order by SUM(amount) desc;

--4. List all customers that live in Nepal (use the city table)
SELECT c.first_name, c.last_name, c.customer_id 
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE co.country = 'Nepal';

--5. Which staff member had the most transactions?
Select staff_id, Count(*) as transaction_count
from payment
group by staff_id
order by transaction_count Desc
Limit 1;

--6. How many movies of each rating are there?
SELECT movie_rating, COUNT(*) AS number_of_movies
FROM movies 
GROUP BY movie_rating;

--7.Show all customers who have made a single payment above $6.99 
select customer.customer_id, customer.first_name ,customer.last_name, payment.amount 
from customer
inner join payment
on customer.customer_id=payment.customer_id
where payment.amount > 6.99;

--8. How many free rentals did our stores give away?
select count(*) as free_rentals
from payment
where amount=0


