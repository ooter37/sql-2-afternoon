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
SELECT * FROM track
WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Comedy');

-- 5.
SELECT * FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE title = 'Fireball');

-- 6.
SELECT * FROM track