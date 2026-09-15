create table customer (
   cust_id	number(4)   not null,
   first_name	varchar(50) not null,
   last_name	varchar(50) not null,
   cust_phone	varchar(15),
   cust_email	varchar(35),
   cust_address	varchar(50),
   cust_type	varchar(6),
   gender	char(1),
primary key(cust_id),
constraint chk_cust_email check (REGEXP_LIKE(cust_email,'^[a-zA-Z]\w+@(\S+)$')),
constraint chk_gender check ((UPPER(gender)) in ('M','F'))
);

cl scr
PROMPT ' _____________________________________________ '
PROMPT '|---Welcome to APPLE STORE vending machine!---|'
PROMPT ' \TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT/'
PROMPT

ACCEPT v_cust_id     	number	FORMAT	'9999'		PROMPT	'Enter ID  :		'
ACCEPT v_first_name	char	FORMAT	'A50'		PROMPT	'Enter first name:	'
ACCEPT v_last_name	char	FORMAT	'A50'		PROMPT	'Enter last name:	'
ACCEPT v_cust_phone	char	FORMAT	'A15'		PROMPT	'Enter phone:		'
ACCEPT v_cust_email	char	FORMAT	'A35'		PROMPT	'Enter email:		'
ACCEPT v_cust_address	char	FORMAT	'A50'		PROMPT	'Enter address:		'
ACCEPT v_cust_type	char	FORMAT	'A6'		PROMPT	'Enter type:		'
ACCEPT v_gender		char	FORMAT	'A1'		PROMPT	'Enter gender:		'

INSERT INTO customer VALUES
(&v_cust_id,'&v_first_name','&v_last_name','&v_cust_phone','&v_cust_email','&v_cust_address','&v_cust_type','&v_gender');

