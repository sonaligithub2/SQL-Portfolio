#Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
#Write a query that returns the person who has spent the most money.*/

SELECT * FROM `music store`.customer;

SELECT customer.customer_id, first_name, last_name, SUM(total) AS total_spending
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total_spending DESC
LIMIT 1;

Select customer.customer_id, first_name, sum(total) as SUM
from customer 
join invoice on customer.customer_id = invoice.customer_id 
group by customer.customer_id order by SUM desc limit 1;
