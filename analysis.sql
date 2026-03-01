/*
====================================================
Retail Sales & Profitability Analysis
Author: Borys Borysov
Tool: SQLite
====================================================
*/


-- ============================================
-- 1. Executive-Level Profitability Overview
-- ============================================

SELECT 
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_percent
FROM sales;



-- ============================================
-- 2. Category-Level Performance
-- ============================================

SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS revenue,
    ROUND(SUM(Profit), 2) AS profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margin_percent
FROM sales
GROUP BY Category
ORDER BY profit DESC;



-- ============================================
-- 3. Discount Impact Analysis
-- ============================================

SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount > 0 AND Discount <= 0.2 THEN 'Low (0-20%)'
        WHEN Discount > 0.2 AND Discount <= 0.4 THEN 'Medium (20-40%)'
        ELSE 'High (40%+)'
    END AS discount_level,
    ROUND(AVG(Profit),2) AS avg_profit,
    ROUND(AVG(Profit / Sales) * 100,2) AS avg_margin_percent,
    COUNT(*) AS number_of_orders
FROM sales
GROUP BY discount_level
ORDER BY avg_margin_percent ASC;



-- ============================================
-- 4. Regional Performance Analysis
-- ============================================

SELECT 
    Region,
    ROUND(SUM(Sales),2) AS revenue,
    ROUND(SUM(Profit),2) AS profit,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS margin_percent
FROM sales
GROUP BY Region
ORDER BY margin_percent ASC;



-- ============================================
-- 5. Central Region Deep Dive
-- ============================================

-- Average discount by region

SELECT 
    Region,
    ROUND(AVG(Discount) * 100, 2) AS avg_discount_percent
FROM sales
GROUP BY Region
ORDER BY avg_discount_percent DESC;


-- Share of high-discount (40%+) orders by region

SELECT 
    Region,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN Discount >= 0.4 THEN 1 ELSE 0 END) AS high_discount_orders,
    ROUND(
        SUM(CASE WHEN Discount >= 0.4 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS high_discount_share_percent
FROM sales
GROUP BY Region
ORDER BY high_discount_share_percent DESC;



-- ============================================
-- 6. Product-Level Ranking (Window Functions)
-- ============================================

WITH ranked_products AS (
    SELECT
        Category,
        "Product Name",
        ROUND(SUM(Profit),2) AS total_profit,
        RANK() OVER (
            PARTITION BY Category
            ORDER BY SUM(Profit) DESC
        ) AS top_rank,
        RANK() OVER (
            PARTITION BY Category
            ORDER BY SUM(Profit) ASC
        ) AS bottom_rank
    FROM sales
    GROUP BY Category, "Product Name"
)

SELECT *
FROM ranked_products
WHERE top_rank <= 3 OR bottom_rank <= 3
ORDER BY Category, top_rank ASC, bottom_rank ASC;