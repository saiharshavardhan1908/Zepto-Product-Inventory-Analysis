# 🛒 Zepto Product & Inventory Analysis

A SQL-based data analytics project that analyzes Zepto product and inventory data to identify pricing patterns, discount trends, product availability, inventory levels, and category-wise performance using MySQL.

## 📌 Project Overview

This project analyzes Zepto product and inventory data to understand product pricing, discounts, stock availability, product value, and inventory distribution across different categories.

The project uses SQL for data exploration, data cleaning, and business analysis to generate insights that can support **pricing, inventory management, product selection, and promotional strategies**.

## 🚀 Features

- Product and inventory data exploration
- Data quality and NULL-value checks
- Identification of duplicate product names and multiple SKUs
- Data cleaning and removal of invalid prices
- Conversion of product prices from paise to rupees
- Discount and pricing analysis
- Out-of-stock product analysis
- Category-level inventory analysis
- Price-per-gram analysis
- Product weight categorization
- Estimated inventory value analysis
- Business-oriented SQL queries

---

## 📊 Dataset Information

The dataset contains Zepto product and inventory information with the following key attributes:

- SKU ID
- Category
- Product Name
- MRP
- Discount Percentage
- Available Quantity
- Discounted Selling Price
- Weight in Grams
- Out-of-Stock Status
- Quantity

### Data Preparation

Data cleaning included:

- Checking for missing values
- Identifying products with zero prices
- Removing products with invalid MRP values
- Converting prices from paise to rupees
- Checking products with multiple SKUs
- Exploring product categories and stock availability

---

## 🗄️ SQL Analysis

The project uses MySQL to perform data exploration, cleaning, and business analysis.

### Business Questions Analyzed

1. **Top 10 Best-Value Products**
   - Identified products offering the highest discount percentages.

2. **High-MRP Out-of-Stock Products**
   - Identified products with MRP above ₹300 that are currently out of stock.

3. **Estimated Inventory Value by Category**
   - Calculated the estimated value of available inventory for each category.

4. **High-MRP Low-Discount Products**
   - Identified products with MRP above ₹500 and discounts below 10%.

5. **Top Discount Categories**
   - Identified the top 5 categories with the highest average discount percentage.

6. **Price per Gram Analysis**
   - Calculated price per gram for products weighing at least 100 grams to identify better-value products.

7. **Product Weight Categorization**
   - Classified products into:
     - Low
     - Medium
     - Bulk

8. **Inventory Weight by Category**
   - Calculated the total inventory weight available within each category.

---

## 💡 Business Insights & Recommendations

### Optimize Discount Strategies
Identify categories and products with high discounts and evaluate their impact on sales and profitability.

### Improve Inventory Availability
Monitor high-MRP products that are out of stock to reduce potential lost sales opportunities.

### Identify Better-Value Products
Use price-per-gram analysis to identify products offering better value to customers.

### Improve Inventory Planning
Analyze category-level inventory value and weight to support better stock allocation and inventory management.

### Optimize Product Pricing
Identify high-priced products with low discounts and evaluate whether pricing or promotional strategies need adjustment.

---

## 🛠️ Technologies Used

- MySQL
- SQL
- MySQL Workbench
- Data Analysis
- GitHub

---

## 📂 Project Structure

```text
Zepto-SQL-Data-Analysis/
│
└── zepto.csv
│
└── zepto_sql_analysis.sql
│
└── README.md

## ⚙️ Workflow

### Step 1: Table Creation

- Created the `zepto` table using MySQL
- Defined appropriate data types for product and inventory attributes
- Used `AUTO_INCREMENT` for SKU identification

### Step 2: Data Exploration

- Counted total records
- Examined sample records
- Checked for NULL values
- Identified unique product categories
- Compared in-stock and out-of-stock products
- Identified products with multiple SKUs

### Step 3: Data Cleaning

- Identified products with zero prices
- Removed invalid MRP records
- Converted MRP and selling prices from paise to rupees
- Verified the cleaned pricing data

### Step 4: Business Analysis

- Analyzed product discounts
- Evaluated product pricing
- Identified high-MRP out-of-stock products
- Calculated estimated inventory value
- Compared category-level discounts
- Calculated price per gram
- Categorized products by weight
- Analyzed total inventory weight

### Step 5: Business Recommendations

- Identified opportunities for pricing optimization
- Highlighted inventory availability issues
- Evaluated discount strategies
- Suggested improvements for inventory planning

---

## 🎯 Key Skills Demonstrated

- SQL
- MySQL
- Data Exploration
- Data Cleaning
- Data Validation
- Aggregate Functions
- `GROUP BY`
- `HAVING`
- `CASE WHEN`
- `ORDER BY`
- `DISTINCT`
- Filtering
- Inventory Analysis
- Product Analysis
- Pricing Analysis
- Discount Analysis
- Business Analytics

---

## 🔮 Future Enhancements

- Add sales transaction data for actual revenue analysis
- Build product-level sales and demand analysis
- Add inventory turnover analysis
- Perform customer purchase analysis
- Develop an interactive Power BI dashboard
- Add sales forecasting
- Build automated inventory monitoring
- Analyze product profitability and margins

---

## 👨‍💻 Author

**Pulicherla Sai Harsha Vardhan Reddy**

Dual Degree (B.Tech + M.Tech)

Civil Engineering

Indian Institute of Technology Bhubaneswar

---

## 📜 License

This project is developed for educational and portfolio purposes.
