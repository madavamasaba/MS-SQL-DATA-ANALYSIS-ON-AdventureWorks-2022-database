/*MS SQL PRACTICE PROJECT USING THE ADVENTUREWORKS 2022 DATABASE*/
USE AdventureWorks2022;
/* 1.Write a query to retrieve all rows and columns from the employee table in the adventureworks database.Sort the results in ascending order on jobtitle*/
SELECT*FROM HumanResources.Employee order by JobTitle asc;
/* 2.Write a query to retrieve all rows and columns from the PERSON table in the adventureworks database.Sort the results in ascending order on Last name*/
SELECT*FROM Person.Person ORDER BY LastName ASC;
/*3.SQL Query to return all rows and subset of columns (FirstName,LastName,BusinessentityID) fromPerson table.The third column renmed to Employee_id.Orderby lastname in ASCENDING*/
SELECT firstname,lastname,BusinessEntityID from Person.Person ORDER BY LastName ASC;
SELECT*FROM Person.Person;
/*4.Write a query to return only rows for products that have sell startdate not null and a productline of "T"Return productid, productnumber and name orderby name in ascending order*/
SELECT productid,productnumber,name from Production.Product where SellStartDate IS not null and Product.ProductLine = 'T' ORDER BY NAME ASC;
/*5.Write an SQL query to return all rows from the salesorderheader table and calculate the percantage of tax on the subtotal have decided. Return salesorderid,customerid,orderdate,subtotal,percantage of tax column order by subtotal in ascending order*/
SELECT SALESORDERID,CUSTOMERID,ORDERDATE,SubTotal,(SUBTOTAL/100) AS TAX FROM Sales.SalesOrderHeader ORDER BY SubTotal ASC;
/*6.Write an SQL query to create a list of unique jobtitles in the employeetable in the adventureworks database.Return jobtitle column arranged in ascending order*/
SELECT DISTINCT(JobTitle) FROM HumanResources.Employee ORDER BY JobTitle ASC;
/*7.Write an SQL query to calculate the total freight paid by each customer. Return customerid and total freight. sort output in ascending order on customerid*/
SELECT CUSTOMERID , SUM (FREIGHT) FROM Sales.SalesOrderHeader GROUP BY CUSTOMERID ORDER BY CustomerID ASC;
/*8.Write an SQL query  FROM THE SALESORDERHEADER TABLE to find the average and the sum of the subtotal for every customer.Return customerid, average and sum of the subtotal.Grouped the result on customerid and salespersonid.sort the result on the customerid column in ascending order*/
SELECT CUSTOMERID,SALESPERSONID,AVG (SUBTOTAL) AS AVERAGE_SUBTOTAL, SUM(SUBTOTAL) AS SUM_SUBTOTAL FROM Sales.SalesOrderHeader GROUP BY CUSTOMERID,SALESPERSONID ORDER BY CUSTOMERID ASC;
/*9.Write an SQL query to retrieve total quantity of each productid which are in shelf of 'A' or 'C'or 'H'.Filter the results for sum quantity is more than 500. Return productid and the sum of the quantity.Sort the results according to the productid in ascending order*/
SELECT PRODUCTID ,SUM(QUANTITY) AS TOTAL_QUANTITY FROM Production.ProductInventory WHERE QUANTITY >500  GROUP BY PRODUCTID ORDER BY PRODUCTID ASC;
/*10.Write an SQL query to find the total quantity for a group of locationid multiplied by 10*/
SELECT QUANTITY*10 AS TOTAL_QUANTITY FROM Production.ProductInventory;