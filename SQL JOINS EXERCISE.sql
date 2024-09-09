/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
select P.name, c.name
from products as p
inner join categories as C
ON C.CategoryID = P.CategoryID
WHERE c.Name = 'computers';

SELECT products.Name, categories.Name
from products
INNER JOIN categories on categories.CategoryID = products.CategoryID
WHERE categories.Name = 'computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name, product.price, reviews.Rating
 from products
 LEFT JOIN reviews ON reviews.ProductID = products.ProductID
 WHERE reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, Sum(s.Quantity) AS Total
FROM sales AS s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
group by e.EmployeeID
ORDER BY Toatal DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.name as 'department name', c.name as 'category name' FROM departments as d
INNER JOIN categories as c ON c.DepartmentsID = d.DepartmentID
where C.Name = 'apploances' OR c.name = 'games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.name, sum(s.Quantity) as 'Total Sold', Sum(s.Quantity * s.PricePerUnit) as 'Toatal Price'
from products as p
INNER JOIN sales as s on s.ProductID = p.ProductID
where p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.Name, r.Reviewer, r.Rating, r.Comment 
from products as p
INNER JOIN reviwes as r ON  r.ProductID = p.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) as ToatalSold
FROM sales as s
INNER JOIN employees as e on e.EmployeeID = s.EmployeeID
INNER JOIN products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID
order by e.FirstName