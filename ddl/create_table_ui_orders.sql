create table orders (
   orders_id		number(10) 	not null,
   cust_id		number(4)   	not null,
   staff_id		varchar(3)   	not null,
   orders_date		date,
primary key(orders_id),
foreign key(cust_id)  references customer(cust_id),
foreign key(staff_id) references staff(staff_id)
);

ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

cl scr
PROMPT ' ____________________________________________ '
PROMPT '|-------  Data entry for ORDER table  -------|'
PROMPT ' \TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT/'
PROMPT

ACCEPT v_orders_id      number 	FORMAT '9999999999'  	PROMPT 'Enter Order ID:    	    '
ACCEPT v_cust_id        number 	FORMAT '9999'    	PROMPT 'Enter Customer ID:'
ACCEPT v_staff_id       char	FORMAT 'A3'     	PROMPT 'Enter Staff ID:         '
ACCEPT v_orders_date    date   	FORMAT 'dd/mm/yyyy'  	PROMPT 'Enter Order Date:       '

INSERT INTO orders VALUES
(&v_orders_id,&v_cust_id,&v_staff_id,'&v_orders_date');

