# PIZZA SALES
-- KPI REQUIREMENT 
-- 1.Total Revenue 
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;


-- 2.Average Order Value
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;



-- 3.Total Pizzas Sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;



-- 4.Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;



-- 5.Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;



# CHART REQUIREMENTS
-- 1.Hourly Trend for Total Pizzas Sold
SELECT HOUR (order_time) as order_hours, SUM(quantity) as total_pizzas_sold
from pizza_sales
group by HOUR(order_time)
order by HOUR(order_time);



-- 2. Weekly Trend for Orders
SELECT 
    WEEK(order_date, 1) AS WeekNumber, 
    YEAR(order_date) AS Year,
    COUNT(DISTINCT order_id) AS Total_orders
FROM 
    pizza_sales
GROUP BY 
    WEEK(order_date, 1),
    YEAR(order_date)
ORDER BY 
    Year, WeekNumber;


    
-- 3. % of Sales by Pizza Category
SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;



-- 4.% of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;



-- 5.Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;



-- 6.Top 5 Pizzas by Revenue
SELECT  pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC limit 5;



-- 7.Bottom 5 Pizzas by Revenue
SELECT  pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC limit 5;




