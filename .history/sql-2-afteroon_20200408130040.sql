-- 1. 
SELECT * FROM invoice
JOIN invoice_line
ON invoice.invoice_id = invoice_line.invoice_id
WHERE unit_price > .99;

-- 2.
SELECT invoice.invoice_date, customer.first_name, customer.last_name, invoice.total FROM invoice
JOIN customer
ON invoice.customer_id = customer.customer_id