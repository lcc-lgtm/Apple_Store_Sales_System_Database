create table staff (
   staff_id		varchar(3)   not null,
   staff_name		varchar(25) not null,
   staff_role		varchar(25),
   manager_id		varchar(3),
   department_id	varchar(3),
   staff_salary		number(7,2),
   hire_date    	date,
primary key(staff_id);
foreign key(department_id) references department(department_id)
);

ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

cl scr
PROMPT ' _____________________________________________ '
PROMPT '|---------Data entry for STAFF table----------|'
PROMPT ' \TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT/'
PROMPT

ACCEPT v_staff_id   	char 	FORMAT 'A3'        	PROMPT 'Enter Staff ID:      		'
ACCEPT v_staff_name 	char   	FORMAT 'A25'         	PROMPT 'Enter Staff Name:    		'
ACCEPT v_staff_role 	char   	FORMAT 'A25'  		PROMPT 'Enter Staff Role: 		'
ACCEPT v_manager_id 	char   	FORMAT 'A3'  		PROMPT 'Enter Manager ID: 		'
ACCEPT v_department_id 	char   	FORMAT 'A2'  		PROMPT 'Enter Departmenty ID: 		'
ACCEPT v_staff_salary 	number 	FORMAT '99999.99'    	PROMPT 'Enter Salary:    		'
ACCEPT v_hire_date  	date   	FORMAT 'dd/mm/yyyy'  	PROMPT 'Enter Hire Date (dd/mm/yyyy):  	'

INSERT INTO staff VALUES
('&v_staff_id','&v_staff_name','&v_staff_role','&v_manager_id','&v_department_id',&v_staff_salary,'&v_hire_date');

