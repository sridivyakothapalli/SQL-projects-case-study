use music_project;
select * from employee;
-- 1. Who is the senior most employee based on job title?
select last_name,first_name,title from employee
order by levels
limit 1;
-- 2. Which countries have the most Invoices?
select * from invoice;
select billing_country,count(invoice_id) as count_invoice_id from invoice
group by billing_Country
order by count_invoice_id desc
limit 1;
-- 3. What are top 3 values of total invoice?
select * from invoice;
select total from invoice
order by total desc
limit 3;
/*4. Which city has the best customers? We would like to throw a promotional Music 
Festival in the city we made the most money. Write a query that returns one city that 
has the highest sum of invoice totals. Return both the city name & sum of all invoice 
totals*/
select * from invoice;
select billing_city, sum(total) as sum_all_invoice from invoice
group by billing_city
order by sum_all_invoice desc
limit 1;

/*5. Who is the best customer? The customer who has spent the most money will be 
declared the best customer. Write a query that returns the person who has spent the 
most money*/
select * from customer;
select * from invoice;
select c.customer_id,c.first_name, c.last_name ,sum(total) as total_invoice from customer as c inner join invoice as i
on c.customer_id=i.customer_id
group by c.customer_id,c.first_name, c.last_name 
order by total_invoice desc
limit 1;
/*1. Write query to return the email, first name, last name, & Genre of all Rock Music 
listeners. Return your list ordered alphabetically by email starting with A*/
select * from customer;
select * from genre;
select * from track;
select * from invoice;
select * from invoice_line;

select c.first_name,c.last_name,c.email,g.name from 
customer as c 
join invoice as i on c.customer_id=i.customer_id
join invoice_line as il on i.invoice_id=il.invoice_id
join track as t on il.track_id=t.track_id
join genre as g on t.genre_id=g.genre_id
where g.name like "%rock"
order by c.email;
/*2. Let's invite the artists who have written the most rock music in our dataset. Write a 
query that returns the Artist name and total track count of the top 10 rock bands*/
select * from artist;
select * from genre;
select * from track;
select * from album2;

select ar.artist_id,ar.name,count(ar.artist_id) as track_count from
album2 as a 
join track as t on a.album_id=t.album_id
join genre as g on t.genre_id=g.genre_id
join artist as ar on ar.artist_id=a.artist_id
where g.name like "rock"
group by ar.artist_id,ar.name
order by track_Count desc
limit 10;

/*3. Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the 
longest songs listed first*/
select * from artist;
select * from track;
select * from album2;

select name as track_name,milliseconds from track
having milliseconds > (select avg(milliseconds) as avg_length from track)
order by milliseconds desc;

/*1. Find how much amount spent by each customer on artists? Write a query to return
customer name, artist name and total spent*/
select* from customer;
select * from artist;
select * from invoice;
select * from album2;
select * from track;
select * from invoice_line;


select invoice_id ,sum(unit_price*quantity) as total_amount
from invoice_line
group by invoice_id,unit_price*quantity;
