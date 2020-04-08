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



-- Practice nested queries
-- 1. 


-- 2.


-- 3.


-- 4. 
SELECT * FROM track
WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Comedy');

-- 5.
SELECT * FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE title = 'Fireball');

-- 6.
SELECT * FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE artist_id IN (SELECT artist_id FROM artist WHERE name = 'Queen'));


