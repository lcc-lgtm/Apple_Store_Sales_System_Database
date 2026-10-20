CLEAR COLUMNS
TTITLE OFF

SET LINESIZE 120
SET PAGESIZE 300

cl scr

CREATE OR REPLACE VIEW staff_commission
AS SELECT s.staff_id, s.manager_id, s.staff_salary, d.department_id, d.department_name, SUM(ol.sub_total) AS total_sales, (SUM(ol.sub_total)*0.01) AS total_commission
FROM staff s
JOIN department d 
ON s.department_id = d.department_id
LEFT OUTER JOIN orders o 
ON s.staff_id = o.staff_id
LEFT OUTER JOIN orders_list ol 
ON o.orders_id = ol.orders_id
GROUP BY s.manager_id, s.staff_id, s.staff_salary, d.department_id, d.department_name;

ACCEPT min_sales NUMBER PROMPT 'Enter a minimum sales amount under RM500 (RM): '

cl scr

COLUMN staff_id      	FORMAT 'A20'         	HEADING 'STAFF ID'
COLUMN department_id    FORMAT 'A20' 		HEADING 'DEPARTMENT ID'
COLUMN department_name 	FORMAT 'A20' 		HEADING 'DEPARTMENT NAME' TRUNC
COLUMN staff_salary  	FORMAT '9999999.99'  	HEADING 'SALARY (RM)'
COLUMN total_sales	FORMAT '99999999999.99'	HEADING 'TOTAL SALES (RM)'
COLUMN total_commission	FORMAT '9999999.99'	HEADING 'COMMISSION (RM)'

cl scr

TTITLE CENTER 'The Staff Details Within Commission Based on Sales' SKIP 1 CENTER #==================================================================# SKIP 2

SELECT staff_id, department_id, department_name, staff_salary, total_sales, ROUND(total_commission, 2) as total_commission
FROM staff_commission
WHERE total_commission > &min_sales
ORDER BY staff_id;

