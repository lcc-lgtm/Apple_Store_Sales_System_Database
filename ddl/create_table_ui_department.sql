create table department (
   department_id	varchar(3)	not null,
   department_name	varchar(50),
primary key(department_id));

ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

cl scr
PROMPT ' ______________________________________________ '
PROMPT '|-------Data entry for DEPARTMENT DETAILS------|'
PROMPT ' \TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT/'
PROMPT  

ACCEPT	v_department_id		varchar	FORMAT	'A3'	PROMPT 'Enter department ID:	'
ACCEPT	v_department_name	varchar	FORMAT	'A50'	PROMPT 'Enter department name:	'

INSERT INTO department VALUES
('&v_department_id','&v_department_name');

