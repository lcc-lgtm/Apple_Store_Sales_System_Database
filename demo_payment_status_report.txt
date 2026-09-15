SET PAGESIZE 100
SET LINESIZE 100
SET FEEDBACK OFF
SET VERIFY OFF
SET ECHO OFF

cl scr
ACCEPT start_date PROMPT 'Start Date (DD/MM/YYYY): '
ACCEPT end_date PROMPT 'End Date (DD/MM/YYYY): '

PROMPT
PROMPT        ========================================
PROMPT               PAYMENT STATUS REPORT
PROMPT        ========================================
PROMPT Date Range: &start_date to &end_date
PROMPT

COLUMN order_id        FORMAT 999999999   HEADING 'Order ID'
COLUMN customer        FORMAT A18         HEADING 'Customer Name' TRUNC
COLUMN order_date      FORMAT A9          HEADING 'Order|Date'
COLUMN amount          FORMAT $999,999.99 HEADING 'Amount'
COLUMN status          FORMAT A12         HEADING 'Payment|Status'
COLUMN paid_date       FORMAT A9          HEADING 'Paid|Date'

BREAK ON status SKIP 1
COMPUTE SUM LABEL 'Status Total:' OF amount ON status
COMPUTE COUNT LABEL 'Orders:' OF order_id ON status

SELECT 
    p.status AS status,
    o.orders_id AS order_id,
    c.first_name || ' ' || c.last_name AS customer,
    TO_CHAR(o.orders_date, 'DD/MM/YY') AS order_date,
    NVL(
        (SELECT SUM(sub_total) 
         FROM orders_list 
         WHERE orders_id = o.orders_id),
        0
    ) AS amount,
    CASE 
        WHEN p.status = 'FailPayment' THEN '-'
        ELSE TO_CHAR(p.payment_time, 'DD/MM/YY')
    END AS paid_date
FROM 
    orders o
    INNER JOIN customer c ON o.cust_id = c.cust_id
    LEFT JOIN payment p ON o.orders_id = p.order_id
WHERE 
    o.orders_date BETWEEN TO_DATE('&start_date', 'DD/MM/YYYY')
                      AND TO_DATE('&end_date', 'DD/MM/YYYY')
ORDER BY 
    p.status,
    o.orders_date DESC;

CLEAR BREAKS
CLEAR COMPUTES

PROMPT
PROMPT        ========================================
PROMPT              SUMMARY BY STATUS
PROMPT        ========================================

COLUMN status         FORMAT A12         HEADING 'Status'
COLUMN orders         FORMAT 999         HEADING 'Number|of Orders'
COLUMN total_amount   FORMAT $999,999.99 HEADING 'Total|Amount'

SELECT 
    NVL(p.status, 'NO PAYMENT') AS status,
    COUNT(DISTINCT o.orders_id) AS orders,
    SUM(
        NVL(
            (SELECT SUM(sub_total) 
             FROM orders_list 
             WHERE orders_id = o.orders_id),
            0
        )
    ) AS total_amount
FROM 
    orders o
    LEFT JOIN payment p ON o.orders_id = p.order_id
WHERE 
    o.orders_date BETWEEN TO_DATE('&start_date', 'DD/MM/YYYY')
                      AND TO_DATE('&end_date', 'DD/MM/YYYY')
GROUP BY 
    NVL(p.status, 'NO PAYMENT')
ORDER BY 
    orders DESC;

PROMPT
PROMPT        ========================================
PROMPT        Report generated successfully.
PROMPT        ========================================

CLEAR COLUMNS
SET FEEDBACK ON
SET VERIFY ON
SET ECHO ON
