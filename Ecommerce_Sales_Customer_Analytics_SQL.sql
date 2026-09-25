USE ecommerce_analytics;

SELECT * FROM ecommerce_data;

SELECT COUNT(*) AS total_rows
FROM ecommerce_data;
------------------------------------------------------- SQL Business Analysis -----------------------------------------------------------------------------
## Q1. What are the total orders, total sales, total profit, average order value, and overall profit margin?
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(net_sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(net_sales) / COUNT(DISTINCT order_id), 2) AS average_order_value,
    ROUND((SUM(profit) / SUM(net_sales)) * 100, 2) AS profit_margin_percentage
FROM ecommerce_data;

## Q2. Which customer segment generates the highest sales and profit?
SELECT
    customer_segment,
    ROUND(SUM(net_sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_data
GROUP BY customer_segment
ORDER BY total_sales DESC;

## Q3. Which region generates the highest sales and profit?
SELECT
    region,
    ROUND(SUM(net_sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_data
GROUP BY region
ORDER BY total_sales DESC;

## Q4. Which sales channel generates the highest sales and profit?
SELECT
    sales_channel,
    ROUND(SUM(net_sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_data
GROUP BY sales_channel
ORDER BY total_sales DESC;

## Q5. How do repeat customers compare with non-repeat customers in terms of sales, profit, and order volume?
SELECT
    is_repeat_customer,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(net_sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_data
GROUP BY is_repeat_customer
ORDER BY total_sales DESC;

## Q6. What is the impact of discounts on sales, profit, and profit margin?
SELECT
    discount_status,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(net_sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(net_sales)) * 100, 2) AS profit_margin_percentage
FROM ecommerce_data
GROUP BY discount_status
ORDER BY total_sales DESC;

## Q7. Which marketing channels generate the highest sales and profit?
SELECT
    marketing_channel,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(net_sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(net_sales)) * 100, 2) AS profit_margin_percentage
FROM ecommerce_data
GROUP BY marketing_channel
ORDER BY total_sales DESC;

## Q8. Which customers have the highest customer lifetime value, and how much revenue have they generated?
WITH customer_value AS (
    SELECT
        customer_id,
        customer_name,
        customer_order_count,
        ROUND(MAX(customer_lifetime_value), 2) AS lifetime_value,
        ROUND(SUM(net_sales), 2) AS total_sales,
        COUNT(DISTINCT order_id) AS total_orders
    FROM ecommerce_data
    GROUP BY
        customer_id,
        customer_name,
        customer_order_count
)

SELECT
    customer_id,
    customer_name,
    total_orders,
    total_sales,
    lifetime_value,
    RANK() OVER (
        ORDER BY lifetime_value DESC
    ) AS customer_rank
FROM customer_value
ORDER BY customer_rank
LIMIT 10;

## Q9. Which customer segments have the highest average customer lifetime value?
WITH segment_value AS (
    SELECT
        customer_segment,
        customer_id,
        MAX(customer_lifetime_value) AS lifetime_value
    FROM ecommerce_data
    GROUP BY
        customer_segment,
        customer_id
)

SELECT
    customer_segment,
    COUNT(customer_id) AS total_customers,
    ROUND(AVG(lifetime_value), 2) AS avg_lifetime_value,
    ROUND(MAX(lifetime_value), 2) AS highest_lifetime_value
FROM segment_value
GROUP BY customer_segment
ORDER BY avg_lifetime_value DESC;

## Q10. Month-over-Month Sales Growth
WITH monthly_sales AS (
    SELECT
        order_month,
        ROUND(SUM(net_sales), 2) AS total_sales
    FROM ecommerce_data
    GROUP BY order_month
),

monthly_growth AS (
    SELECT
        order_month,
        total_sales,
        LAG(total_sales) OVER (
            ORDER BY order_month
        ) AS previous_month_sales
    FROM monthly_sales
)

SELECT
    order_month,
    total_sales,
    ROUND(previous_month_sales, 2) AS previous_month_sales,
    ROUND(
        ((total_sales - previous_month_sales) / previous_month_sales) * 100,
        2
    ) AS growth_percentage
FROM monthly_growth
WHERE previous_month_sales IS NOT NULL
ORDER BY growth_percentage DESC;

## Q11. Which region has the highest profit margin?
SELECT
    region,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(net_sales), 2) AS total_sales,
    ROUND((SUM(profit) / SUM(net_sales)) * 100, 2) AS profit_margin
FROM ecommerce_data
GROUP BY region
ORDER BY profit_margin DESC;

## Q12. Which payment methods generate the highest sales and profit?
SELECT
    payment_method,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(net_sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM ecommerce_data
GROUP BY payment_method
ORDER BY total_sales DESC;

## Q13. Which shipping methods have the highest average delivery time and delay?
SELECT
    shipping_method,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days,
    ROUND(AVG(delivery_delay), 2) AS avg_delivery_delay
FROM ecommerce_data
WHERE delivery_days IS NOT NULL
GROUP BY shipping_method
ORDER BY avg_delivery_delay DESC;

## Q14. Which customer segments have the highest return rate?
SELECT
    customer_segment,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT CASE
        WHEN return_status = 'Returned' THEN order_id
    END) AS returned_orders,
    ROUND(
        COUNT(DISTINCT CASE
            WHEN return_status = 'Returned' THEN order_id
        END) * 100.0
        / COUNT(DISTINCT order_id),
        2
    ) AS return_rate
FROM ecommerce_data
GROUP BY customer_segment
ORDER BY return_rate DESC;

## Q15. What are the main reasons for product returns?
SELECT
    return_reason,
    COUNT(DISTINCT order_id) AS returned_orders
FROM ecommerce_data
WHERE return_status = 'Returned'
GROUP BY return_reason
ORDER BY returned_orders DESC;



