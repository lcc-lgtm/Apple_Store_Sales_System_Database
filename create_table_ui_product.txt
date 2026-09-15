create table product (
   product_id		varchar(10) not null,
   product_name		varchar(50) not null,
   category_id		varchar(10),
   price		number(8,2),
   launch_date		date,
primary key(product_id),
foreign key(category_id) references category(category_id)
);

cl scr
PROMPT ' _____________________________________________ '
PROMPT '|--Data entry for  APPLE STORE PRODUCT table--|'
PROMPT ' \TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT/'
PROMPT

ACCEPT v_product_id     char   	FORMAT 	'A10'     	PROMPT 'Enter Product ID:          '
ACCEPT v_product_name   char  	FORMAT 	'A50'     	PROMPT 'Enter Product Name:        '
ACCEPT v_category_id    char	FORMAT 	'A10'     	PROMPT 'Enter Category ID:         '
ACCEPT v_price          number	FORMAT 	'99999.99' 	PROMPT 'Enter Price(RM): 	   '
ACCEPT v_launch_date	date	FORMAT	'dd/mm/yyyy' 	PROMPT 'Enter Launch Date (dd/mm/yyyy):  	   '

INSERT INTO product VALUES
('&v_product_id','&v_product_name','&v_category_id',&v_price,'&v_launch_date');

