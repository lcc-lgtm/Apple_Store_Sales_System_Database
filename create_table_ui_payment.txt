create table payment (
   payment_id	number(5)	not null,
   order_id	number(10) 	not null,
   amount	number(10,2),
   payment_time	date,
   status	varchar(15),
primary key(payment_id)
);

ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

cl scr
PROMPT ' _____________________________________________ '
PROMPT '|--------Data entry for payment DETAILS-------|'
PROMPT ' \TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT/'
PROMPT  

ACCEPT	v_payment_id	number	FORMAT	'99999'		PROMPT 'Enter payment ID:	'
ACCEPT	v_order_id	number	FORMAT	'9999999999'	PROMPT 'Enter Order ID:		'
ACCEPT	v_amount	number	FORMAT	'99999999.99'	PROMPT 'Enter Amount:		'
ACCEPT	v_payment_time	date	FORMAT	'dd/mm/yyyy'	PROMPT 'Enter payment time (dd/mm/yyyy):	'
ACCEPT	v_status	char	FORMAT	'A15'		PROMPT 'Enter payment status:	'

INSERT INTO payment VALUES
(&v_payment_id,&v_order_id,&v_amount,'&v_payment_time','&v_status');

