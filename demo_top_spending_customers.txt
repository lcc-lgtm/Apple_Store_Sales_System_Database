CLEAR COLUMNS
CLEAR BREAKS
CLEAR COMPUTE
TTITLE OFF

SET LINESIZE 100
SET PAGESIZE 50

cl scr

ACCEPT v_top_n CHAR PROMPT 'Enter number of top customers to rank (e.g., 5): '

cl scr

COLUMN rank 	    HEADING 'Rank' 	     FORMAT 999999
COLUMN cust_name    HEADING 'Customer Name'  FORMAT A25
COLUMN cust_type    HEADING 'Membership'     FORMAT A15
COLUMN orders_count HEADING 'Orders Placed'  FORMAT 999
COLUMN total_items  HEADING 'Total Items'    FORMAT 99,999
COLUMN total_spent  HEADING 'Total Spending' FORMAT $9,999,999.99

TTITLE CENTER 'TOP &v_top_n HIGHEST SPENDING CUSTOMERS' SKIP 2

BREAK ON REPORT
COMPUTE SUM LABEL 'Total:' OF total_spent ON REPORT

cl scr

SELECT
    ROWNUM AS rank,
    cust_name,
    cust_type,
    orders_count,
    total_items,
    total_spent
FROM (
    SELECT
        C.first_name || ' ' || C.last_name AS cust_name,
        C.cust_type,
        COUNT(DISTINCT O.orders_id) AS orders_count,
	SUM(OL.quantity) AS total_items,
        SUM(OL.sub_total) AS total_spent
    FROM CUSTOMER C
    JOIN ORDERS O
	ON C.cust_id = O.cust_id
    JOIN ORDERS_LIST OL
	ON O.orders_id = OL.orders_id
    GROUP BY C.cust_id, C.first_name, C.last_name, C.cust_type
    ORDER BY SUM(OL.sub_total) DESC
)
WHERE ROWNUM <= &v_top_n;

