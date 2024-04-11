#Module End Project

#Topic : Library Management System
#You are going to build a project based on Library Management System.
 #It keeps track of all information about books in the library, their cost, status and total number of books available in the library.

#Create a database named library and following TABLES in the database: 

#Attributes for the tables: 

#Create the library database
CREATE DATABASE IF NOT EXISTS library;
#USE library database
USE library;

#1. Branch
 #Branch_no - Set as PRIMARY KEY  
 #Manager_Id  
 #Branch_address  
 #Contact_no 
 
CREATE TABLE IF NOT EXISTS Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT not null,
    Branch_address VARCHAR(300),
    Contact_no INT
);
desc Branch;
INSERT INTO BRANCH VALUES('1','101','Main Library Ernakulam','876790623');
INSERT INTO BRANCH VALUES('2','102','Main Library Thrissur','866789063');
INSERT INTO BRANCH VALUES('3','103','Main Library Kollam','876589023');
INSERT INTO BRANCH VALUES('4','104','Main Library Kottayam','896790623');
INSERT INTO BRANCH VALUES('5','105','Main Library Alappuzha','776890623');
INSERT INTO BRANCH VALUES('6','106','Main Library Palakkad','836890623');
INSERT INTO BRANCH VALUES('7','107','Main Library Wayanad','872890623');
INSERT INTO BRANCH VALUES('8','108','Main Library Kasargod','816790623');
INSERT INTO BRANCH VALUES('9','109','Main Library Kozhikod','806890623');
INSERT INTO BRANCH VALUES('10','110','Main Library Kochi','876089062');
select * from branch;


#2. Employee  
 #Emp_Id – Set as PRIMARY KEY  
 #Emp_name  
 #Position  
 #Salary
 #Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table  
 
CREATE TABLE IF NOT EXISTS Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary INT,
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
    (1001, 'John D', 'Manager', 50000, 2),
    (1002, 'Jane Smith', 'Assistant Manager', 40000, 2),
    (1003, 'Alice John', 'Clerk', 30000, 1),
    (1004, 'Boby B', 'Clerk', 30000, 2),
    (1005, 'Susy M', 'Accountant', 30000, 2),
    (1006, 'Reemi Joe', 'Data Analyst', 65000, 2),
    (1007, 'Sarah Elizabeth', 'Assistant Manager', 40000, 4),
    (1008, 'James Siby', 'It operator', 30000, 4),
    (1009, 'Jerin Mon', ' System Asssociate', 70000, 5),
    (1010, 'Thomas Philip', 'Manager', 60000, 2);
select * from employee;

#3. Books  
 #ISBN - Set as PRIMARY KEY  
 #Book_title  
 #Category  
 #Rental_Price  
 #Status [Give yes if book available and no if book not available]  
 #Author  
 #Publisher
CREATE TABLE IF NOT EXISTS Books (
    ISBN VARCHAR(50) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
    ('90000', 'To Kill a Mockingbird', 'Fiction', 100, 'yes', 'Harper Lee', 'Penguin Books'),
    ('22222','1984', 'Dystopian Fiction', 120, 'yes', 'George Orwell', 'Vintage Books'),
    ('48487', 'The Great Gatsby', 'Classic Literature', 150, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
    ('92000', 'Pride and Prejudice', 'Romance', '200', 'no', 'Jane Austen', 'Vintage Classics'),
    ('86000', 'The Catcher in the Rye', 'Coming-of-age Fiction', 150, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
    ('50003', 'The Hobbit', 'Fantasy', 250, 'no', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt'),
    ('48000', 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', 250, 'yes', 'J.K. Rowling', 'Bloomsbury Publishing'),
    ('75000', 'The Lord of the Rings', 'Fantasy', '100', 'no', 'J.R.R. Tolkien', 'Mariner Books'),
    ('65888', 'Moby-Dick', 'Adventure', 200, 'yes', 'Herman Melville', 'Penguin Classics'),
    ('78600', 'Frankenstein', 'Gothic Fiction', '230', 'no', 'Mary Shelley', 'Oxford University Press');
select * from Books;



#4. Customer  
 #Customer_Id - Set as PRIMARY KEY  
 #Customer_name  
 #Customer_address  
 #Reg_date
 
CREATE TABLE IF NOT EXISTS Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
    (1, 'Alice Benny', '789 main Street', '2023-01-15'),
    (2, 'Robert Brown', '456 3rd Avenue', '2021-02-20'),
    (3, 'Reemi Joseph', '987 St peters road', '2022-01-25'),
    (4, 'Jerin John', '123 Nathaji Street', '2023-04-30'),
    (5, 'Aromal A S', '567 9th Avenue', '2023-05-05'),
    (6, 'Sruthi M', '890 Gandhi Street', '2021-06-10'),
    (7, 'Thomas Mathew', '345 NH Road', '2023-07-15'),
    (8, 'Harry Potter', '678 american Avenue', '2023-08-20'),
    (9, 'John H', '901 Heart Street', '2023-09-25'),
    (10, 'Jithu Jose', '234 Marine Drive', '2021-10-30');
  
    select * from customer;
    
    
 #5. IssueStatus  
 #Issue_Id - Set as PRIMARY KEY  
 #Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER table  Issued_book_name 
 #Issue_date 
 #Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table 

CREATE TABLE IF NOT EXISTS IssueStatus (
    Issue_Id INT NOT NULL PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(50),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

 INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
    (111, 1, 'To Kill a Mockingbird', '2023-01-20', '90000'),
    (112, 2, '1984', '2023-02-25', '22222'),
    (113, 3, 'The Great Gatsby', '2023-06-30', '48487'),
    (114, 4, 'Pride and Prejudice', '2024-04-05', '92000'),
    (115, 5, 'The Catcher in the Rye', '2024-10-10', '86000'),
    (116, 6, 'The Hobbit', '2024-12-15', '50003'),
    (117, 7, 'Harry Potter and the Sorcerer''s Stone', '2023-06-2','48000'),
    (118, 8, 'The Lord of the Rings', '2023-06-25', '75000'),
    (119, 9, 'Moby-Dick', '2023-09-30', '65888');

SELECT * FROM ISSUESTATUS;



#6. ReturnStatus  
 #Return_Id - Set as PRIMARY KEY  
 #Return_cust  
 #Return_book_name  
 #Return_date  
 #Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table 
 
CREATE TABLE IF NOT EXISTS ReturnStatus (
    Return_Id INT NOT NULL PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(50),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
    (1, 1, 'To Kill a Mockingbird', '2024-03-05', '90000'),
    (2, 2, '1984', '2024-03-10', '22222'),
    (3, 3, 'The Great Gatsby', '2024-03-15', '48487'),
    (4, 4, 'Pride and Prejudice', '2024-03-20', '92000'),
    (5, 5, 'The Catcher in the Rye', '2024-03-25', '86000');

SELECT * FROM RETURNSTATUS;




#Display all the tables and Write the queries for the following :

#1. Retrieve the book title, category, and rental price of all available books. 

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';


#2. List the employee names and their respective salaries in descending order of salary. 
SELECT emp_name,salary
FROM Employee
ORDER BY salary DESC;


#3. Retrieve the book titles and the corresponding customers who have issued those books. 
SELECT b.Book_title, c.Customer_name
FROM Books b
JOIN IssueStatus i ON b.ISBN = i.Isbn_book
JOIN Customer c ON i.Issued_cust = c.Customer_Id;


#4. Display the total count of books in each category;
;SELECT Category, count(*)  Total_Count
from Books
Group by Category;

#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 

SELECT emp_name, position
FROM employee
WHERE salary > 50000;

#6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 

SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust from issuestatus);

#7. Display the branch numbers and the total count of employees in each branch. 

SELECT branch_no, COUNT(*) total_employees
FROM employee
GROUP BY branch_no;

#8. Display the names of customers who have issued books in the month of June 2023.
use library; 
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE YEAR(Issue_date) = 2023 AND MONTH(Issue_date) = 6;

#9. Retrieve book_title from book table containing fantasy. 

SELECT book_title
FROM books
WHERE category LIKE '%fantasy%';


#10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT branch_no, COUNT(*) total_employees
FROM employee
GROUP BY branch_no
HAVING COUNT(*) > 5;
