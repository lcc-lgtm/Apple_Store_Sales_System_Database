create table orders_list (
   orders_id	number(10) 	not null,
   product_id	varchar(10) 	not null,
   quantity	number(2),
   unit_price	number(6,2),
   sub_total	number(8,2),
primary key(orders_id,product_id),
foreign key(orders_id) references orders(orders_id),
foreign key(product_id) references product(product_id)
);

cl scr
PROMPT ' _______________________________________________ '
PROMPT '|-------Data entry for ORDERS_LIST table--------|'
PROMPT ' \TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT/'
PROMPT

ACCEPT v_orders_id       number	FORMAT	'9999999999' 	PROMPT 'Enter Order ID:            '
ACCEPT v_product_id     char	FORMAT	'A10'	 	PROMPT 'Enter Product ID:          '
ACCEPT v_quantity       number	FORMAT	'99'	 	PROMPT 'Enter Quantity:            '
ACCEPT v_unit_price     number 	FORMAT	'9999.99'	PROMPT 'Enter Unit Price(RM):      '
ACCEPT v_sub_total      number	FORMAT	'999999.99' 	PROMPT 'Enter Sub Total(RM):  	   '

INSERT INTO orders_list VALUES
(&v_orders_id, '&v_product_id', &v_quantity, &v_unit_price, &v_sub_total);

