/*

1-film tablosundan 'K' karakteri ile başlayan en uzun ve replacement_cost u en düşük 4 filmi sıralayınız.
2-film tablosunda içerisinden en fazla sayıda film bulunduran rating kategorisi hangisidir?
3-customer tablosunda en çok alışveriş yapan müşterinin adı nedir?
4-category tablosundan kategori isimlerini ve kategori başına düşen film sayılarını sıralayınız.
5-film tablosunda isminde en az 4 adet 'e' veya 'E' karakteri bulunan kç tane film vardır?

*/

--1-

SELECT * 
FROM film
WHERE title LIKE 'K%' AND replacement_cost >
(
SELECT MIN(replacement_cost) 
FROM film
)
ORDER BY replacement_cost ASC
LIMIT 4;


--2-

SELECT DISTINCT rating,COUNT(*) 
FROM film
GROUP BY rating
ORDER BY COUNT DESC
LIMIT 1;

--3-

SELECT payment.customer_id,customer.first_name,customer.last_name,SUM(amount) 
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY payment.customer_id,customer.first_name,customer.last_name
ORDER BY SUM DESC
LIMIT 1;


--4-

SELECT category.name, COUNT(*) 
FROM category
INNER JOIN film_category ON film_category.category_id = category.category_id
GROUP BY film_category.category_id, category.name
ORDER BY COUNT

--5-

SELECT COUNT(*) FROM film
WHERE title ILIKE '%e%e%e%e%'
