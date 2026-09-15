CLEAR COMPUTES
CLEAR COLUMN
TTITLE OFF
SET LINESIZE 100
SET PAGESIZE 300

TTITLE CENTER 'Stock Less Than Threshold' SKIP 1 CENTER '-----------------------------------------' SKIP 2

cl scr

ACCEPT min_stock NUMBER PROMPT 'Enter minimum stock threshold: '

cl scr

COLUMN product_name FORMAT A45
COLUMN stock_quantity FORMAT 999
COLUMN last_restock_date FORMAT A20

cl scr

SELECT 
    i.inventory_id,
    p.product_name,
    i.stock_quantity,
    i.last_restock_date
FROM inventory i
JOIN product p ON i.product_id = p.product_id
WHERE i.stock_quantity < &min_stock
ORDER BY i.stock_quantity ASC;
