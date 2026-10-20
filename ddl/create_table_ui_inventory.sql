create table inventory (
   inventory_id		number(6)	not null,
   product_id		varchar(10) 	not null,
   stock_quantity	number(4),
   last_restock_date	date,
primary key(inventory_id),
foreign key(product_id) references product(product_id)
);

ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

cl scr
PROMPT ' _____________________________________________ '
PROMPT '|-------Data entry for inventory DETAILS------|'
PROMPT ' \TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT/'
PROMPT  

ACCEPT	v_inventory_id		number	FORMAT	'999999'	PROMPT 'Enter inventory ID:	'
ACCEPT	v_product_id		number	FORMAT	'A10'		PROMPT 'Enter product ID:	'
ACCEPT	v_stock_quantity	number	FORMAT	'9999'		PROMPT 'Enter quantity of stock:		'
ACCEPT	v_last_restock_date	date	FORMAT	'dd/mm/yyyy'	PROMPT 'Enter last restock date (dd/mm/yyyy):	'

INSERT INTO inventory VALUES
(&v_inventory_id,&v_product_id,&v_stock_quantity,'&v_last_restock_date');

