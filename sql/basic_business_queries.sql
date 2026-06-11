-- =========================================================
-- E-Commerce Sales and Customer Support Analytics
-- Step 10: Basic SQL Business Queries
-- Suggested table names:
-- customers_cleaned
-- products_cleaned
-- orders_cleaned
-- order_items_cleaned
-- deliveries_cleaned
-- support_tickets_cleaned
-- ========================================================


-- =========================================================
-- 1. Check all table row counts
-- =========================================================

SELECT COUNT(*) AS total_customers
FROM customers_cleaned;

SELECT COUNT(*) AS total_products
FROM products_cleaned;

SELECT COUNT(*) AS total_orders
FROM orders_cleaned;

SELECT COUNT(*) AS total_order_items
FROM order_items_cleaned;

SELECT COUNT(*) AS total_deliveries
FROM deliveries_cleaned;

SELECT COUNT(*) AS total_support_tickets
FROM support_tickets_cleaned;


-- =========================================================
-- 2. Total sales, total profit, and total quantity sold
-- =========================================================

SELECT
    ROUND(SUM(revenue), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity_sold
FROM order_items_cleaned;


-- =========================================================
-- 3. Total orders and average order value
-- =========================================================

SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.revenue) / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM orders_cleaned o
JOIN order_items_cleaned oi
    ON o.order_id = oi.order_id;


-- =========================================================
-- 4. Orders by order status
-- =========================================================

SELECT
    order_status,
    COUNT(order_id) AS total_orders
FROM orders_cleaned
GROUP BY order_status
ORDER BY total_orders DESC;


-- =========================================================
-- 5. Sales by month
-- =========================================================

SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
    ROUND(SUM(oi.revenue), 2) AS monthly_sales
FROM orders_cleaned o
JOIN order_items_cleaned oi
    ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY order_month;


-- =========================================================
-- 6. Sales by region
-- =========================================================

SELECT
    o.region,
    ROUND(SUM(oi.revenue), 2) AS total_sales,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders_cleaned o
JOIN order_items_cleaned oi
    ON o.order_id = oi.order_id
GROUP BY o.region
ORDER BY total_sales DESC;


-- =========================================================
-- 7. Sales by city
-- =========================================================

SELECT
    o.city,
    o.state,
    ROUND(SUM(oi.revenue), 2) AS total_sales,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders_cleaned o
JOIN order_items_cleaned oi
    ON o.order_id = oi.order_id
GROUP BY o.city, o.state
ORDER BY total_sales DESC
LIMIT 10;


-- =========================================================
-- 8. Sales by product category
-- =========================================================

SELECT
    p.category,
    ROUND(SUM(oi.revenue), 2) AS total_sales,
    ROUND(SUM(oi.profit), 2) AS total_profit,
    SUM(oi.quantity) AS quantity_sold
FROM order_items_cleaned oi
JOIN products_cleaned p
    ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;


-- =========================================================
-- 9. Top 10 products by sales
-- =========================================================

SELECT
    p.product_name,
    p.brand,
    p.category,
    ROUND(SUM(oi.revenue), 2) AS total_sales,
    SUM(oi.quantity) AS quantity_sold
FROM order_items_cleaned oi
JOIN products_cleaned p
    ON oi.product_id = p.product_id
GROUP BY p.product_name, p.brand, p.category
ORDER BY total_sales DESC
LIMIT 10;


-- =========================================================
-- 10. Top 10 products by profit
-- =========================================================

SELECT
    p.product_name,
    p.brand,
    p.category,
    ROUND(SUM(oi.profit), 2) AS total_profit,
    ROUND(SUM(oi.revenue), 2) AS total_sales
FROM order_items_cleaned oi
JOIN products_cleaned p
    ON oi.product_id = p.product_id
GROUP BY p.product_name, p.brand, p.category
ORDER BY total_profit DESC
LIMIT 10;


-- =========================================================
-- 11. Return status count
-- =========================================================

SELECT
    return_status,
    COUNT(order_item_id) AS item_count
FROM order_items_cleaned
GROUP BY return_status
ORDER BY item_count DESC;


-- =========================================================
-- 12. Return reasons
-- =========================================================

SELECT
    return_reason,
    COUNT(order_item_id) AS return_count
FROM order_items_cleaned
WHERE return_status = 'Returned'
GROUP BY return_reason
ORDER BY return_count DESC;


-- =========================================================
-- 13. Return count by product category
-- =========================================================

SELECT
    p.category,
    COUNT(oi.order_item_id) AS returned_items
FROM order_items_cleaned oi
JOIN products_cleaned p
    ON oi.product_id = p.product_id
WHERE oi.return_status = 'Returned'
GROUP BY p.category
ORDER BY returned_items DESC;


-- =========================================================
-- 14. Delivery status count
-- =========================================================

SELECT
    delivery_status,
    COUNT(order_id) AS total_orders
FROM deliveries_cleaned
GROUP BY delivery_status
ORDER BY total_orders DESC;


-- =========================================================
-- 15. Delayed orders by delivery partner
-- =========================================================

SELECT
    delivery_partner,
    COUNT(order_id) AS delayed_orders
FROM deliveries_cleaned
WHERE delivery_status = 'Delayed'
GROUP BY delivery_partner
ORDER BY delayed_orders DESC;


-- =========================================================
-- 16. Average delay days by delivery partner
-- =========================================================

SELECT
    delivery_partner,
    ROUND(AVG(delay_days), 2) AS average_delay_days
FROM deliveries_cleaned
WHERE delay_days IS NOT NULL
GROUP BY delivery_partner
ORDER BY average_delay_days DESC;


-- =========================================================
-- 17. Orders by payment method
-- =========================================================

SELECT
    payment_method,
    COUNT(order_id) AS total_orders
FROM orders_cleaned
GROUP BY payment_method
ORDER BY total_orders DESC;


-- =========================================================
-- 18. Support tickets by issue category
-- =========================================================

SELECT
    issue_category,
    COUNT(ticket_id) AS total_tickets
FROM support_tickets_cleaned
GROUP BY issue_category
ORDER BY total_tickets DESC;


-- =========================================================
-- 19. Support tickets by priority
-- =========================================================

SELECT
    priority,
    COUNT(ticket_id) AS total_tickets
FROM support_tickets_cleaned
GROUP BY priority
ORDER BY total_tickets DESC;


-- =========================================================
-- 20. Support ticket status count
-- =========================================================

SELECT
    ticket_status,
    COUNT(ticket_id) AS total_tickets
FROM support_tickets_cleaned
GROUP BY ticket_status
ORDER BY total_tickets DESC;


-- =========================================================
-- 21. Average resolution days by issue category
-- =========================================================

SELECT
    issue_category,
    ROUND(AVG(resolution_days), 2) AS average_resolution_days
FROM support_tickets_cleaned
WHERE resolution_days IS NOT NULL
GROUP BY issue_category
ORDER BY average_resolution_days DESC;


-- =========================================================
-- 22. Average customer satisfaction by issue category
-- =========================================================

SELECT
    issue_category,
    ROUND(AVG(customer_satisfaction_score), 2) AS average_satisfaction_score
FROM support_tickets_cleaned
WHERE customer_satisfaction_score IS NOT NULL
GROUP BY issue_category
ORDER BY average_satisfaction_score ASC;


-- =========================================================
-- 23. Customer count by region
-- =========================================================

SELECT
    region,
    COUNT(customer_id) AS total_customers
FROM customers_cleaned
GROUP BY region
ORDER BY total_customers DESC;


-- =========================================================
-- 24. Orders and sales by membership type
-- =========================================================

SELECT
    c.membership_type,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.revenue), 2) AS total_sales
FROM customers_cleaned c
JOIN orders_cleaned o
    ON c.customer_id = o.customer_id
JOIN order_items_cleaned oi
    ON o.order_id = oi.order_id
GROUP BY c.membership_type
ORDER BY total_sales DESC;


-- =========================================================
-- 25. Simple business summary query
-- =========================================================

SELECT
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT o.customer_id) AS total_customers,
    ROUND(SUM(oi.revenue), 2) AS total_sales,
    ROUND(SUM(oi.profit), 2) AS total_profit,
    ROUND(SUM(oi.revenue) / COUNT(DISTINCT o.order_id), 2) AS average_order_value
FROM orders_cleaned o
JOIN order_items_cleaned oi
    ON o.order_id = oi.order_id;
