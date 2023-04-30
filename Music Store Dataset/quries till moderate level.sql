#Q1: Who is the senior most employee based on job title? 

SELECT * FROM `music store`.employee;
Select first_name from employee order by levels desc limit 1;


#Q2: What are top 3 values of total invoice?

SELECT * FROM `music store`.invoice;
select total from invoice order by total desc limit 3;


#Q3: Which countries have the most Invoices?

Select count(*) as C , billing_country from invoice group by billing_country order by C desc limit 1; 


#Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
#Write a query that returns one city that has the highest sum of invoice totals. 
#Return both the city name & sum of all invoice totals. 

Select billing_city , Sum(total) as total_invoice from invoice group by billing_city order by total_invoice desc limit 1;


#5Who is the best customer? The customer who has spent the most money will be declared the best customer. 
#Write a query that returns the person who has spent the most money.

SELECT * FROM `music store`.customer;
SELECT customer.customer_id,customer.first_name,sum(total) as s
FROM customer JOIN invoice
ON customer.customer_id = invoice.customer_id group by customer.customer_id order by s desc limit 1;

#Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
#Return your list ordered alphabetically by email starting with A. */

SELECT * FROM `music store`.customer;
SELECT customer.email,customer.first_name,customer.last_name,genre.genre_id
FROM customer 
JOIN invoice ON customer.customer_id = invoice.invoice_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id 
JOIN track ON track.track_id = invoice.invoice_id
JOIN genre ON genre.genre_id = track.genre_id
where genre.name = 'Rock' 
order by email ;

#Q2: Return all the track names that have a song length longer than the average song length. 
#Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */


SELECT * FROM `music store`.track;
SELECT track.name , track.milliseconds 
from track 
where milliseconds > ( SELECT avg(milliseconds) from track ) 
order by milliseconds desc;