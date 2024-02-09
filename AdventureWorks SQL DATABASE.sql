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
/*11.Write an SQL query to find the persons whose last name starts with letter 'L'.Return BusinessEntityID.FirstName,LastName and PhoneNumber.Sort the result on lastname and firstname.Use Person.Personphone table.*/
SELECT Person.BusinessEntityID, Firstname,LastName,PhoneNumber from Person.Person join Person.PersonPhone on Person.PersonPhone.BusinessEntityID=Person.Person.BusinessEntityID WHERE LastName LIKE 'L%';
/*12.Write an SQL query to find the sum of subtotal column.Group the sum on distinct salespersonid and customerid.Roll up the results into subtotal and running total.Return salespersonid,customerid and sum of subtotal column i.e. sum_subtotal*/
SELECT distinct SalesOrderid,customerid,sum(subtotal) as Sub_Total from SALES.SalesOrderHeader group by ROLLUP (salesorderid ,customerid);
/*13.Write an SQL query to find the sum of the quantity of all combination of group of distinct locationid and shelf column.Return Locationid,shelf and sum of quantity as TotalQuantity.Use production.productinventory table*/
SELECT DISTINCT LOCATIONID,SHELF,SUM(QUANTITY) AS TOtal_Quantity FROM Production.ProductInventory GROUP BY LocationID,Shelf;
/*14.Write an SQL query to find the sum of the quantity with subtotal for each locationid.Group the results for all combination of distinct locationid and shelf column.Rolls up the results into subtotal and running total.Return locationid,shelf and sum of quantity as Totalquantity.Use production.productinventory*/
SELECT Locationid,shelf, SUM(quantity) AS Total_Quantity from Production.ProductInventory GROUP BY ROLLUP (LocationID,Shelf);
/*15.Write an SQL querybto find the total quantity for each locationid and calculate the grandtotal for all locations.Return locationid and total quantity.Group the results on locationid.Use production.productinventory table*/
SELECT Locationid,sum(quantity) as total_quantity from Production.ProductInventory group by LocationID ;
/*16.Write an SQL query to retrieve the number of employees for each city.Return City and the number of employees.Sort the results in ascending order on city.Use person.BusinesEntityAdress table.*/
SELECT City, Count(AddressTypeID) as no_of_employees from Person.Address join Person.BusinessEntityAddress on Address.AddressID=BusinessEntityAddress.AddressID Group by city order by city Asc;
/*17.Write an SQL query to retrieve the total sales for each year.Return the year part of order date and total due amount.Sort the results in ascending order on year part of order date.Use Sales.salesorderheader*/
SELECT*FROM Sales.SalesOrderHeader;
SELECT YEAR(OrderDate) AS YEARR,TotalDue from Sales.SalesOrderHeader order by YEARR ASC;
/*18.Write an SQL query to retrieve the total sales for each year.Filter the result set for those orders where the order year is on or before 2016.Return the year partof order date and the total due amount.Sort the result in ascending order on the year part of order date.Use Sales.Salesorderheader table*/
SELECT *FROM Sales.SalesOrderHeader;
SELECT YEAR(OrderDate) AS YEARR,TotalDue from Sales.SalesOrderHeader where OrderDate <= '2016' order by  OrderDate ASC;
/*19.Write an SQL query to find the contacts who are designated as a manager in various departments. Return ContactTypeID,name.Sort the result set in descending order.Use Person.ContactType table.*/
SELECT*FROM Person.ContactType;
SELECT ContactTypeID,name from Person.ContactType where name like '%Manager%' order by ContactTypeID DESC;
/*20.Write an SQL Query to make a list of contacts who are designated as 'Purchasing Manager'.Return BusinessEntityID,LastName, and FirstName columns.Sort the results in ascending order of LastName, and FirstName.Use Person.BusinessEntityContact*/
SELECT*FROM Person.BusinessEntityContact;
SELECT*FROM Person.ContactType;
SELECT*FROM Person.Person;
SELECT DISTINCT Person.BusinessEntityID,Lastname,FirstName from Person.BusinessEntityContact join Person.ContactType on Person.BusinessEntityContact.ContactTypeID=Person.ContactType.ContactTypeID Join Person.Person on Person.BusinessEntityID=Person.BusinessEntityID WHERE Name='Purchasing Manager' Group by Person.BusinessEntityID,LastName,FirstName order by LastName,FirstName ASC;
