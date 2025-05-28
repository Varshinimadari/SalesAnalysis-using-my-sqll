CREATE DATABASE COMPANY;
SELECT * FROM sales;

# find all orders shipped via 'economy' mode with a total amount greter than ₹25,000.
SELECT * FROM sales
WHERE Ship_Mode = 'Economy'
  AND Total_Amount > 25000;
  
# Retrive all sales data for 'Technology' category in'Ireland' made after 2020-01-01.
SELECT * FROM sales
WHERE order_date > '2020-01-01'
AND category = 'Technology' AND country = 'Ireland';

# List the top most profitable sales transactions in desending order.
SELECT * FROM sales
ORDER BY unit_profit DESC
LIMIT 10,20;  #---skip 10 records,showing next 20 records 

# find all customers whose name starts with 'j' and ends with 'n'.
SELECT Order_ID,Customer_Name  FROM sales
WHERE Customer_Name LIKE 'j%n';

# retrive all product name that contain 'Acco' anywhere in the name 
SELECT * FROM sales
WHERE Product_Name LIKE '%Acco%';
  
 # get the top 5 cities with the heighest total sales amount.
SELECT city, SUM(Total_Amount) AS total_sales
FROM sales
GROUP BY city
ORDER BY total_sales DESC
LIMIT 5;

#display the second set of 10 records for customer_name and total_Amount in decresing order
SELECT * FROM sales
order by Customer_Name AND Total_Amount DESC limit 10, 10; 

# find the total revenue,average unit cost, and total number of orders.
SELECT SUM(Total_Amount) AS `total_revenue`,
AVG(Unit_Cost) AS `Average unit cost`,
COUNT(order_id) AS `total number of orders` From sales;

#9:count unique number of regions
SELECT COUNT(distinct(Region)) as uniq_reg
from sales;


#10: find the number of orders placed by each customer.
SELECT customer_name, COUNT(order_id) AS order_count
FROM sales
GROUP BY customer_name
ORDER BY order_count DESC;

#11:Rank 5 products based on total sales using RANK().
SELECT product_name,SUM(Total_amount)AS total_sales,
RANK() over (ORDER BY SUM(total_amount) DESC) AS sales_rank
From sales
GROUP BY Product_Name
limit 5;
