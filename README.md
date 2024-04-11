# Library Management System Database 

## Overview
This MySQL database is designed to manage a library's operations efficiently. It includes tables for branches, employees, books, customers, issue_status, and return_status, each with specific columns and constraints.

## Queries
Retrieve Book Information
- Retrieve the book title, category, and rental price of all books.

List Employees and Salaries
- Lists the names of employees along with their salaries, sorted in descending order of salary.

Retrieve Issued Books and Customers
- Retrieves the titles of books issued along with the names of customers who have issued them.

Count Books in Each Category
- Displays the total count of books in each category.

Filter Employees by Salary
- Retrieves the names and positions of employees whose salaries are above Rs.50,000.

Filter Customers by Registration Date and Book Issuance
- Lists the names of customers who registered before January 1, 2022, and have not issued any books.

Count Employees per Branch
- Displays the branch numbers along with the total count of employees in each branch.

Retrieve Customers Who Issued Books in June 2023
- Retrieves the names of customers who have issued books in June 2023.

Retrieve Fantasy Books
- Retrieves the titles of books categorized under "Fantasy"

Count Employees in Branches with More Than 2 Employees
- Displays the branch numbers along with the count of employees for branches having more than 5 employees.

## Usage
1. Create a MySQL database using the provided schema.
2. Insert data into the tables accordingly.
3. Execute the desired queries to retrieve the necessary information.
