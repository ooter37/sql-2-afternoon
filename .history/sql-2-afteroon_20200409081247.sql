-- Practice joins
-- 1.
SELECT * FROM invoice
JOIN invoice_line
ON invoice.invoice_id = invoice_line.invoice_id
WHERE unit_price > .99;
-- 2.
SELECT invoice.invoice_date, customer.first_name, customer.last_name, invoice.total FROM invoice
JOIN customer
ON invoice.customer_id = customer.customer_id
-- 3.
SELECT customer.first_name, customer.last_name, employee.first_name, employee.last_name FROM customer
JOIN employee
ON customer.support_rep_id = employee.employee_id;
-- 4.
SELECT album.title, artist.name FROM album
JOIN artist
ON album.artist_id = artist.artist_id;
-- 5.
SELECT playlist_track.track_id FROM playlist_track
JOIN playlist
ON playlist_track.playlist_id = playlist.playlist_id
WHERE playlist.name = 'Music';
-- 6.
SELECT track.name FROM playlist_track
JOIN track
ON playlist_track.track_id = track.track_id
WHERE playlist_track.playlist_id = 5;
-- 7.
SELECT track.name, playlist.name FROM track
JOIN playlist_track
ON track.track_id = playlist_track.track_id
JOIN playlist
ON playlist_track.playlist_id = playlist.playlist_id;
-- 8.
SELECT track.name, album.title FROM track
JOIN genre ON track.genre_id = genre.genre_id
JOIN album ON track.album_id = album.album_id
WHERE genre.name = 'Alternative & Punk';


-- Practice nested queries
-- 1. 
SELECT * FROM invoice
WHERE invoice_id IN (SELECT invoice_id FROM invoice_line WHERE unit_price > .99);
-- 2.
SELECT * FROM playlist_track
WHERE playlist_id IN (SELECT playlist_id FROM playlist WHERE name = 'Music');
-- 3.
SELECT name FROM track
WHERE track_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5);
-- 4. 
SELECT * FROM track
WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Comedy');
-- 5.
SELECT * FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE title = 'Fireball');
-- 6.
SELECT * FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE artist_id IN (SELECT artist_id FROM artist WHERE name = 'Queen'));


-- Pratice updating rows
-- 1.
UPDATE customer 
SET fax = null
WHERE fax IS NOT null;
-- 2.
UPDATE customer
SET company = 'Self'
WHERE company IS null;
-- 3.
UPDATE customer
SET last_name = 'Thompson'
WHERE first_name = 'Julia' AND last_name = 'Barnett';
-- 4. 
UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojas@yahoo.cl';
-- 5. 
UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Metal') AND composer = null;

-- Group by
-- 1. 
SELECT genre.name, COUNT(*) FROM track
JOIN genre ON track.genre_id = genre.genre_id
GROUP BY genre.name
-- 2.
SELECT genre.name, COUNT(*) FROM track
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Pop' OR genre.name = 'Rock'
GROUP BY genre.name;
