# window function 

create database Satya;

use satya;
CREATE TABLE yam (
    Sale_ID INT,
    Sale_Date DATE,
    Customer_ID INT,
    Product_ID INT,
    Amount DECIMAL(10, 2)
);

INSERT INTO yam (Sale_ID, Sale_Date, Customer_ID, Product_ID, Amount) VALUES
(1, '2024-01-01', 101, 1001, 150.00),
(2, '2024-01-02', 102, 1002, 200.00),
(3, '2024-01-03', 101, 1001, 100.00),
(4, '2024-01-04', 103, 1003, 300.00),
(5, '2024-01-05', 102, 1002, 250.00),
(6, '2024-01-06', 101, 1001, 175.00),
(7, '2024-01-07', 104, 1004, 400.00),
(8, '2024-01-08', 105, 1005, 350.00),
(9, '2024-01-09', 102, 1002, 225.00),
(10, '2024-01-10', 101, 1001, 125.00);

select * from yam;

# 1 Question 1: Calculate the running total of sales amount.
select sale_date,amount,
sum(amount) over(order by sale_date) as "total" from yam;

# 2 Question 2: Calculate the average sales amount over the last 3 sales.
select sale_id,amount ,
avg(amount) over(order by sale_date rows between 2 preceding and current row)
as "total 3 sales" from yam;

# or

select Sale_id, Sale_date,amount,
avg(amount) over(order by Sale_date rows between 2 preceding and current row)
as "averagelast3sales" from yam;

# 3. rank the sales by amount for each customer 
select customer_id, amount, 
rank() over( partition by customer_id order by amount )as "ranked" from yam;  # partition by rank  


# 4 calculate the cumulative distribution of sales amount 
select Sale_id, Sale_date,amount,
cume_dist() over (order by amount) as cumulativedistribution from yam;

# 5 calculate the difference in sales amount between the current sale and the previous sale
select Sale_id, Sale_date,amount,
amount - LAG(amount,1) over(order by Sale_date ) as amountdifference from yam;

# 6 calculate the lead sale amount for the next sale 
 select Sale_id, Sale_date,amount,
 Lead(amount,1) over(order by Sale_date ) as nextsaleamount from yam;
 
 # 7 find the first sale amount for each customer '
 select sale_id, sale_date, amount,
 first_value(amount) over (partition by customer_id order by sale_date) as firstsaleamount from yam;
 