-- =====================================================
-- ZEPTO PRODUCT & INVENTORY ANALYSIS
-- MySQL
-- =====================================================

-- Drop existing table
DROP TABLE IF EXISTS zepto;


-- =====================================================
-- 1. CREATE TABLE
-- =====================================================

CREATE TABLE zepto (
    sku_id INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp DECIMAL(8,2),
    discountPercent DECIMAL(5,2),
    availableQuantity INT,
    discountedSellingPrice DECIMAL(8,2),
    weightInGms INT,
    outOfStock BOOLEAN,
    quantity INT
);


-- =====================================================
-- 2. DATA EXPLORATION
-- =====================================================

-- Count of rows
SELECT COUNT(*) AS total_rows
FROM zepto;


-- Sample data
SELECT *
FROM zepto
LIMIT 10;


-- Check for NULL values
SELECT *
FROM zepto
WHERE name IS NULL
   OR category IS NULL
   OR mrp IS NULL
   OR discountPercent IS NULL
   OR discountedSellingPrice IS NULL
   OR weightInGms IS NULL
   OR availableQuantity IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;


-- Different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;


-- Products in stock vs out of stock
SELECT 
    outOfStock,
    COUNT(sku_id) AS product_count
FROM zepto
GROUP BY outOfStock;


-- Product names present multiple times
SELECT 
    name,
    COUNT(sku_id) AS Number_of_SKUs
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY Number_of_SKUs DESC;


-- =====================================================
-- 3. DATA CLEANING
-- =====================================================

-- Products with zero price
SELECT *
FROM zepto
WHERE mrp = 0
   OR discountedSellingPrice = 0;


-- Remove products with zero MRP
DELETE FROM zepto
WHERE mrp = 0;


-- Convert price from paise to rupees
UPDATE zepto
SET mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;


-- Verify converted prices
SELECT 
    mrp,
    discountedSellingPrice
FROM zepto;


-- =====================================================
-- 4. BUSINESS ANALYSIS
-- =====================================================


-- Q1. Top 10 best-value products based on discount percentage

SELECT DISTINCT
    name,
    mrp,
    discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;


-- =====================================================
-- Q2. Products with high MRP but out of stock
-- =====================================================

SELECT DISTINCT
    name,
    mrp
FROM zepto
WHERE outOfStock = TRUE
  AND mrp > 300
ORDER BY mrp DESC;


-- =====================================================
-- Q3. Estimated inventory value for each category
-- =====================================================

SELECT 
    category,
    ROUND(
        SUM(discountedSellingPrice * availableQuantity),
        2
    ) AS estimated_inventory_value
FROM zepto
GROUP BY category
ORDER BY estimated_inventory_value DESC;


-- =====================================================
-- Q4. Products with MRP > ₹500 and discount < 10%
-- =====================================================

SELECT DISTINCT
    name,
    mrp,
    discountPercent
FROM zepto
WHERE mrp > 500
  AND discountPercent < 10
ORDER BY mrp DESC,
         discountPercent DESC;


-- =====================================================
-- Q5. Top 5 categories with highest average discount
-- =====================================================

SELECT 
    category,
    ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;


-- =====================================================
-- Q6. Price per gram for products weighing 100g or more
-- =====================================================

SELECT DISTINCT
    name,
    weightInGms,
    discountedSellingPrice,
    ROUND(
        discountedSellingPrice / weightInGms,
        2
    ) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram ASC;


-- =====================================================
-- Q7. Categorize products based on weight
-- =====================================================

SELECT DISTINCT
    name,
    weightInGms,
    CASE
        WHEN weightInGms < 1000 THEN 'Low'
        WHEN weightInGms < 5000 THEN 'Medium'
        ELSE 'Bulk'
    END AS weight_category
FROM zepto;


-- =====================================================
-- Q8. Total inventory weight per category
-- =====================================================

SELECT 
    category,
    SUM(weightInGms * availableQuantity) AS total_inventory_weight
FROM zepto
GROUP BY category
ORDER BY total_inventory_weight DESC;