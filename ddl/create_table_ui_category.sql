create table category (
   category_id		varchar(5) not null,
   category_name	varchar(30),
   category_desc	varchar(60),
primary key(category_id)
);

cl scr
PROMPT ' _____________________________________________ '
PROMPT '|--Data entry for APPLE STORE CATEGORY table--|'
PROMPT ' \TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT/'
PROMPT

ACCEPT v_category_id     char   FORMAT 'A5'     PROMPT 'Enter Category ID:           '
ACCEPT v_category_name   char	FORMAT 'A30'    PROMPT 'Enter Category Name:         '
ACCEPT v_category_desc   char	FORMAT 'A60'    PROMPT 'Enter Category Description:  '

INSERT INTO category VALUES
('&v_category_id','&v_category_name','&v_category_desc');

