-- Coffee Consumers Count
-- How many people in each city are estimated to consume coffee, given that 25% of the population does?
select city_name,round(sum((population * 25)/100),0) as consumers from city
group by city_name;

-- Total Revenue from Coffee Sales
-- What is the total revenue generated from coffee sales across all cities in the last quarter of 2023?
SELECT SUM(total) AS revenue
FROM sales
WHERE sale_date BETWEEN '2023-10-01' AND '2023-12-31';

-- Sales Count for Each Product
-- How many units of each coffee product have been sold?

select p.product_name,count(s.product_id)as units  from sales s
join products p on p.product_id = s.product_id
group by p.product_name
order by p.product_name;

-- Average Sales Amount per City
-- What is the average sales amount per customer in each city?
SELECT city_name,
       AVG(total) AS avg_sales_per_customer
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
join city ci on ci.city_id = c.city_id
GROUP BY city_name;



-- City Population and Coffee Consumers
-- Provide a list of cities along with their populations and estimated coffee consumers.
select ci.city_name,ci.population,count(s.customer_id)as consumers from sales s
join customers c on c.customer_id = s.customer_id
join city ci on ci.city_id = c. city_id
group by ci.city_name,ci.population
order by consumers desc;

-- Top Selling Products by City
-- What are the top 3 selling products in each city based on sales volume?
select p.product_name,sum(s.total)as total_volume from sales s
join products p on p.product_id = s.product_id
group by p.product_name
order by sum(s.total) desc
limit 3;

-- Customer Segmentation by City
-- How many unique customers are there in each city who have purchased coffee products?
select c.city_id ,count(distinct s.customer_id)from sales s
join customers c on c.customer_id = s.customer_id
group by c.city_id;

-- Average Sale vs Rent
-- Find each city and their average sale per customer and avg rent per customer
SELECT 
    ci.city_name,
    AVG(s.total) AS avg_sale_per_customer
FROM 
    sales s
JOIN 
    customers c ON c.customer_id = s.customer_id
JOIN 
    city ci ON ci.city_id = c.city_id
GROUP BY 
    ci.city_name;

-- Sales growth rate: 
-- Calculate the percentage growth (or decline) in sales over different time periods (monthly).
WITH cte AS (
    SELECT 
        MONTH(sale_date) AS month_name,
        SUM(total) AS monthly_sales
    FROM sales
    GROUP BY MONTH(sale_date)
)
SELECT 
    month_name,
    monthly_sales,
    LAG(monthly_sales) OVER (ORDER BY month_name) AS pre_sale,
    CASE 
        WHEN LAG(monthly_sales) OVER (ORDER BY month_name) IS NOT NULL 
        THEN (monthly_sales - LAG(monthly_sales) OVER (ORDER BY month_name)) * 100.0 / LAG(monthly_sales) OVER (ORDER BY month_name)
        ELSE NULL
    END AS percentage_growth
FROM cte
ORDER BY month_name;

-- Market Potential Analysis
-- Identify top 3 city based on highest sales, return city name, total sale, total rent, total customers, estimated coffee consumer

select sum(total) as higest_sales,ci.city_name,sum(ci.estimated_rent)as total_rent,count(distinct c.customer_id)as total_customers,count(c.customer_id)as total_coffee_consumer from sales s
join customers c on c.customer_id = s.customer_id
join city ci on ci.city_id = c.city_id
group by ci.city_name
order by sum(total) desc
limit 3;

select * from customers;
/*Recommendations

After analyzing the data, the recommended top three cities for new store openings are:

City 1: Pune

Average rent per customer is very low.
Highest total revenue.
Average sales per customer is also high.
City 2: Delhi

Highest estimated coffee consumers at 7.7 million.
Highest total number of customers, which is 68.
Average rent per customer is 330 (still under 500).
City 3: Jaipur

Highest number of customers, which is 69.
Average rent per customer is very low at 156.
Average sales per customer is better at 11.6k.*/