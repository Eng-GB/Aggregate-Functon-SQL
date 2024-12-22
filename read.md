Aggregate Functions in SQL

Introduction

This project demonstrates the use of aggregate functions in SQL to process and analyze data. The code provided contains various examples of SQL queries that utilize aggregate functions such as COUNT, MAX, MIN, SUM, and AVG. Additionally, it includes examples of subqueries and joins to retrieve and manipulate data effectively. This README serves as a guide to understanding the purpose and implementation of the provided SQL queries.

Code Description

1. Count Function

This section demonstrates how to count rows in a table.

USE almadar;
SELECT * FROM students;
SELECT COUNT(*) FROM students;
SELECT * FROM receipts;
SELECT COUNT(*) FROM receipts;


2. Max and Min Functions

This section shows how to retrieve the maximum and minimum values from a column.

SELECT MAX(amount) FROM receipts;
SELECT MIN(amount) FROM receipts;


3. Sum and Average Functions

This section demonstrates summing up and averaging numeric values in a table.
SELECT SUM(amount) FROM receipts;
SELECT * FROM receipts;
SELECT AVG(amount) FROM receipts;

-- Calculating average manually
SELECT SUM(amount)/4 FROM receipts;


4. Grouped Aggregations

This section uses grouping to calculate aggregated values for each group.

SELECT SUM(amount) AS tiro, GROUP_CONCAT(name) AS arday
FROM students s
JOIN receipts r ON s.id = r.id;

SELECT
    name,
    tell,
    sex,
    cl_name,
    SUM(amount) AS total
FROM
    students s
    JOIN student_class sc ON s.id = sc.id
    JOIN class cl ON cl.cl_no = sc.cl_no
    JOIN charge c ON sc.sc_no = c.sc_no
GROUP BY
    name, tell, sex, cl_name;

SELECT name, tell, sex, cl_name, SUM(amount) AS total
FROM students s, charge c, class cl, student_class sc
WHERE s.id = sc.id AND cl.cl_no = sc.cl_no AND sc.sc_no = c.sc_no
GROUP BY name, tell, sex, cl_name;


5. Subqueries

This section highlights subqueries used for retrieving specific values.

-- Retrieve students with the maximum amount paid
SELECT name, tell, sex, amount
FROM students s
JOIN receipts r ON s.id = r.id
AND amount = (SELECT MAX(amount) FROM receipts);

-- Uppercase names with maximum amount paid
SELECT UPPER(name), sex, amount
FROM students s
JOIN receipts r ON s.id = r.id
AND amount = (SELECT MAX(amount) FROM receipts);

-- Students with minimum amount paid
SELECT name, sex, amount
FROM students s
JOIN receipts r ON s.id = r.id
AND amount = (SELECT MIN(amount) FROM receipts);

6. Additional Queries

This section provides extra queries showcasing various SQL operations.

-- Drop foreign key
ALTER TABLE student_class DROP FOREIGN KEY cons_fk4_st;

-- Summarizing amounts and grouping
SELECT GROUP_CONCAT(name), SUM(amount) AS dalacay
FROM students s, student_class sc, charge c
WHERE s.id = sc.id AND sc.sc_no = c.sc_no;

SELECT GROUP_CONCAT(name) AS name, SUM(amount) AS paid
FROM students s, receipts r
WHERE s.id = r.id;

-- Union example
SELECT name, sex FROM students
UNION
SELECT * FROM receipts;



Conclusion

This project highlights the power of SQL aggregate functions in data analysis. By using functions like COUNT, SUM, AVG, MAX, and MIN, you can perform meaningful data summarization and aggregation. Additionally, the examples provided demonstrate how to use joins and subqueries to enhance the functionality of SQL queries.




