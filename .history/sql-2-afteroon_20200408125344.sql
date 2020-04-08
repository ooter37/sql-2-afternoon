-- 1. 
SELECT * FROM invoice
JOIN invoice_line
ON invoice.invoice_id = invoice_line.invoice_id
WHERE unit_price > .99;

-- 2.
