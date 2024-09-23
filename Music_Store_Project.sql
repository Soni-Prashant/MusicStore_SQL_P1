-- Q1. Who is the senior most employee based on job title?
Select *
From
 Employee 
Order By
 levels DESC
Limit 1 

-- Q2. Which countries have the most Invoices?
Select Count(billing_country) AS MostInvoices, billing_country 
From
 invoice
Group By
 billing_country
Order By
 billing_country DESC

-- Q3. What are top 3 values of total invoice?
Select total 
From
 invoice
Order By
 total DESC 
Limit 3 

-- Q4. Which city has the best customers? 
--We would like to throw a promotional Music Festival in the city we made the most money. 
--Write a query that returns one city that has the highest sum of invoice totals. 
--Return both the city name & sum of all invoice totals
SELECT SUM(total) AS total_invoice, billing_city
FROM
 invoice
Group BY 
 billing_city
Order by total_invoice DESC

--Q5. Who is the best customer? The customer who has spent the most money will be declared the best customer. 
--Write a query that returns the person who has spent the most money
Select 
 customer.customer_id,
 customer.first_name,
 customer.last_name,
SUM(invoice.total) AS Total
FROM 
 customer 
JOIN invoice
ON customer.customer_id = invoice.customer_id
GROUP BY
customer.customer_id
Order By total DESC
Limit 1 

--Q6. Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
--Return your list ordered alphabetically by email starting with A Let's invite the artists who 
--have written the most rock music in our dataset. Write a query that returns the Artist name 
--and total track count of the top 10 rock bands 
SELECT 
 email,
 first_name,
 last_name
From
 customer
Join invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE 
 track_id IN
(Select 
 track_id
FROM track
JOIN genre ON genre.genre_id = track.genre_id 
Where genre.name = 'Rock'
)
Order By email;

--Let's invite the artists who have written the most rock music in our dataset. 
--Write a query that returns the Artist name and total track count of the top 10 rock bands

SELECT
 artist.name,
 artist.artist_id,
 COUNT(artist.artist_id) AS number_of_songs
FROM
 track
JOIN album ON track.album_id = album.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Rock'
Group By
 artist.artist_id
Order By
 number_of_songs DESC
Limit 10

-- Q.8 Return all the track names that have a song length longer than the average song length. 
--Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first

SELECT
 name,
 milliseconds
FROM
 track
WHERE 
 milliseconds >
(SELECT AVG(milliseconds)
FROM track
)
Order By
milliseconds DESC






























 