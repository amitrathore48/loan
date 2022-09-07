This is the Laravel Framework 8.25.0 so need Server Requirements-
The Laravel framework has a few system requirements. You should ensure that your web server has the following minimum PHP version and extensions:

PHP >= 7.3
BCMath PHP Extension
Ctype PHP Extension
Fileinfo PHP Extension
JSON PHP Extension
Mbstring PHP Extension
OpenSSL PHP Extension
PDO PHP Extension
Tokenizer PHP Extension
XML PHP Extension

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Setup this project you need to put the project with folder name loan in \xampp\htdocs if using wamp then put it in \wamp\www\
import the database which is in root directory with the name loan.sql 

Change the .env configuration based on the database connection. 
Also get the POSTMAN Collection with the name of loan.json from root directory.
Now project is ready to run.

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


1- SignUp
 a) First register yourself by the register API with providing all required details.
 b) login yourself by the given email and password by the login API.

2- Loans
 Note* Copy auth_token key data from the login API and put it in the Authorization by selecting type Bearer Token for below APIs
 a) Make loan ammount request by the Loan Request API.
 b) You can view your loan only by the My Loan List API.

3- Admin
 a) Login admin by the login API using username: admin@loan.com , Password: Admin@123 and is_admin:1 
 Copy the auth_token for use the next APIs and put it in the Authorization by the selecting type Bearer Token.
 b) Check the Unapproved loans requested by the users from the Unapproved loan list API. In the response you will be getting the loan id as a id key
 c) change the pending loans to state APPROVED by providing the loan id
 
After that user can make the scheduled repayment EMI by the EMI Repayment API which is under the Loans folder.

Here user will pay the all of the scheduled terms with the equal or greater ammount of repayment. After PAID all of EMIs loan will be fully Paid.
