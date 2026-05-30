-- ========================================
-- RETAIL SALES ANALYSIS PROJECT
-- ========================================
-- Objective:
-- Analyse customer behaviour, revenue distribution, and product performance
-- to identify growth opportunities and business risks.

-- ===================
-- 1. Revenue & Growth
-- ===================
-- Part a: Which customers generate the most revenue?
SELECT 
	TOP 10 Customer_ID,
	SUM(Total_Amount) AS total_revenue
FROM sales_data
GROUP BY Customer_ID
ORDER BY total_revenue DESC;

-- Part b: Revenue concentration among top 10 customers

WITH customer_revenue AS (
    SELECT 
        Customer_ID,
        SUM(Total_Amount) AS customer_total_revenue
    FROM sales_data
    GROUP BY Customer_ID
),
top_10_customers AS (
    SELECT TOP 10
        Customer_ID,
        customer_total_revenue
    FROM customer_revenue
    ORDER BY customer_total_revenue DESC
)
SELECT
    (SELECT SUM(customer_total_revenue) FROM customer_revenue) AS total_revenue,
    (SELECT SUM(customer_total_revenue) FROM top_10_customers) AS top10_revenue,
    (SELECT SUM(customer_total_revenue) FROM top_10_customers) * 100.0 /
    (SELECT SUM(customer_total_revenue) FROM customer_revenue) AS top10_revenue_percentage;

-- Insight:
-- The top 10 customers contribute approximately 4.39% of total revenue,
-- indicating a highly distributed revenue base with low concentration.

-- Implication:
-- This reduces dependency risk on a small group of customers, but also suggests
-- limited contribution from high-value customers and a lack of strong customer concentration.

-- Recommendation:
-- Introduce targeted loyalty programs and personalised marketing strategies
-- to increase engagement and spending among high-value customers, improving
-- customer lifetime value.

-- ==============================
-- 2. Product & Category Strategy
-- ==============================
-- Question: Which product categories generate the most revenue and which underperform?
SELECT
    Product_Category,
    AVG(Price_per_Unit) AS avg_ppu,
    SUM(Total_Amount) AS revenue,
    SUM(Quantity) AS units_sold,
    COUNT(*) AS transactions
FROM sales_data
GROUP BY 
    Product_Category
ORDER BY revenue DESC;

-- Insight:
-- The Beauty category has the highest average price per unit, but lower overall
-- revenue and volume compared to Electronics and Clothing. Electronics drives
-- the highest revenue, while Clothing leads in total units sold.

-- Implication:
-- Beauty products are priced higher but lack purchase frequency, whereas
-- Clothing benefits from volume-driven sales and Electronics from high-value transactions.

-- Recommendation:
-- Increase purchase frequency in the Beauty category by introducing
-- high-demand, lower-cost products and implementing bundle promotions
-- to drive repeat purchases and improve overall revenue contribution.

-- ==========================
-- 3. Underperformance & Risk
-- ==========================
-- Question:Which customer segments (age & gender) are underperforming in terms of revenue?
SELECT 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 40 THEN '25-40'
        WHEN Age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '60+'
    END AS age_group,
    Gender,
    SUM(Total_Amount) AS revenue,
    AVG(Total_Amount) AS avg_spend,
    COUNT(*) AS num_transactions
FROM sales_data
GROUP BY 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 40 THEN '25-40'
        WHEN Age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '60+'
    END,
    Gender
ORDER BY age_group;

-- -- Insight:
-- The Under 25 and 60+ age groups generate lower total revenue compared to
-- other segments, indicating underperformance across these demographics.

-- Implication:
-- This suggests a mismatch between current product offerings and the preferences
-- of these customer groups, leading to lower engagement and spending.

-- Recommendation:
-- For the 60+ segment, focus on comfort, accessibility, and practicality in product design.
-- For the Under 25 segment, introduce trend-driven and affordable products aligned
-- with current lifestyle trends, such as fitness and fashion, to increase engagement and revenue.

-- =======================
-- 4. Time-Based Decisions
-- =======================
--- Question: What are the peak revenue periods across months?
SELECT 
    FORMAT([Date], 'MM') AS month,
    SUM(Total_Amount) AS revenue
FROM sales_data
GROUP BY FORMAT([Date], 'MM')
ORDER BY month;

-- Insight:
-- Revenue peaks in May, October, and December, while November and January
-- underperform despite being high-traffic holiday periods.

-- Implication:
-- The business may not be fully capitalising on seasonal demand during key
-- promotional periods, resulting in missed revenue opportunities.

-- Recommendation:
-- Implement staggered promotional campaigns leading up to major holidays
-- such as Black Friday and New Year, and introduce strategic product launches
-- during peak periods to maximise customer engagement and sales.

-- ===============================
-- 5. Pricing & Spending Behaviour
-- ===============================
-- Question: Is there a relationship between quantity purchased and average spend?
SELECT 
    Quantity,
    COUNT(*) AS num_transactions,
    AVG(Total_Amount) AS avg_spend
FROM sales_data
GROUP BY Quantity
ORDER BY Quantity;

-- Insight:
-- Transactions are relatively evenly distributed across different basket sizes,
-- indicating that customers are not strongly inclined to purchase multiple items
-- in a single transaction.

-- Implication:
-- There is an opportunity to increase average transaction value by encouraging
-- customers to purchase more items per visit.

-- Recommendation:
-- Introduce multi-buy promotions such as “Buy 2, Get 1 Free” or discounted bundles
-- To incentivise larger basket sizes and increase overall revenue per transaction.

-- ========================================
-- FINAL SUMMARY
-- ========================================
-- Key Findings:
-- - Revenue is well distributed across customers with low concentration
-- - Electronics drives revenue, Clothing drives volume
-- - Underperforming segments include Under 25 and 60+
-- - Seasonal demand is not fully capitalised during key holiday periods
-- - Higher basket sizes significantly increase average spend

-- Strategic Recommendations:
-- - Implement targeted promotions for underperforming segments
-- - Increase product accessibility in the Beauty category
-- - Optimise promotional timing around peak seasons
-- - Encourage multi-item purchases through bundling strategies