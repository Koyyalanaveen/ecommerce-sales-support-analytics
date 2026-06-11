# KPI Plan

Project: E-Commerce Sales and Customer Support Analytics

This file contains the main KPIs planned for the Power BI dashboard.

The dashboard will have three main pages:

1. Sales Overview
2. Product and Delivery Analysis
3. Customer Support Analysis


## Page 1: Sales Overview KPIs

### 1. Total Sales
Meaning:
Total revenue generated from all order items.

Formula:
Sum of revenue from order_items_cleaned.

Business use:
Shows the total business value generated from sales.


### 2. Total Profit
Meaning:
Total profit generated from all order items.

Formula:
Sum of profit from order_items_cleaned.

Business use:
Shows whether the business is making profit from sales.


### 3. Total Orders
Meaning:
Total number of unique orders.

Formula:
Distinct count of order_id from orders_cleaned.

Business use:
Shows order volume.


### 4. Total Customers
Meaning:
Total number of unique customers.

Formula:
Distinct count of customer_id from customers_cleaned.

Business use:
Shows customer base size.


### 5. Average Order Value
Meaning:
Average sales amount per order.

Formula:
Total Sales / Total Orders

Business use:
Shows how much customers spend per order on average.


## Page 2: Product and Delivery Analysis KPIs

### 6. Total Quantity Sold
Meaning:
Total number of product units sold.

Formula:
Sum of quantity from order_items_cleaned.

Business use:
Shows product movement.


### 7. Return Count
Meaning:
Number of returned order items.

Formula:
Count of order items where return_status is Returned.

Business use:
Shows product return volume.


### 8. Return Rate
Meaning:
Percentage of order items returned.

Formula:
Returned Items / Total Order Items

Business use:
Helps identify product quality or delivery-related issues.


### 9. Delayed Orders
Meaning:
Number of orders delivered late.

Formula:
Count of deliveries where delivery_status is Delayed.

Business use:
Shows delivery performance problems.


### 10. Delay Rate
Meaning:
Percentage of deliveries delayed.

Formula:
Delayed Orders / Total Deliveries

Business use:
Helps compare delivery performance.


### 11. Average Delay Days
Meaning:
Average delay days for deliveries.

Formula:
Average of delay_days.

Business use:
Shows how serious the delivery delay issue is.


## Page 3: Customer Support Analysis KPIs

### 12. Total Support Tickets
Meaning:
Total number of customer support tickets.

Formula:
Count of ticket_id from support_tickets_cleaned.

Business use:
Shows customer complaint volume.


### 13. Open Tickets
Meaning:
Number of support tickets still open.

Formula:
Count of tickets where ticket_status is Open.

Business use:
Shows pending support workload.


### 14. Escalated Tickets
Meaning:
Number of tickets escalated.

Formula:
Count of tickets where ticket_status is Escalated.

Business use:
Shows serious customer issues.


### 15. Average Resolution Days
Meaning:
Average number of days taken to resolve support tickets.

Formula:
Average of resolution_days.

Business use:
Shows customer support speed.


### 16. Average Satisfaction Score
Meaning:
Average customer satisfaction score.

Formula:
Average of customer_satisfaction_score.

Business use:
Shows customer support quality.


## Charts Planned

### Sales Overview Page
- KPI cards: Total Sales, Total Profit, Total Orders, Total Customers, Average Order Value
- Line chart: Monthly sales trend
- Bar chart: Sales by region
- Bar chart: Sales by category
- Donut chart: Orders by status

### Product and Delivery Page
- KPI cards: Quantity Sold, Return Count, Return Rate, Delayed Orders, Delay Rate
- Bar chart: Top 10 products by sales
- Bar chart: Return reasons
- Bar chart: Delayed orders by delivery partner
- Bar chart: Sales by category

### Customer Support Page
- KPI cards: Total Tickets, Open Tickets, Escalated Tickets, Average Resolution Days, Average Satisfaction Score
- Bar chart: Tickets by issue category
- Bar chart: Tickets by priority
- Bar chart: Ticket status
- Bar chart: Average resolution days by issue category
