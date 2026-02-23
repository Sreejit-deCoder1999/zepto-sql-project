# 🛒 Zepto Inventory Data Analysis using PostgreSQL

## 📌 Project Overview

This project analyzes Zepto’s inventory dataset using PostgreSQL to generate actionable business insights related to product pricing, discount strategy, and inventory management.

The entire workflow including data cleaning, exploratory data analysis, and business insight generation was performed using SQL in a single integrated SQL file.

This project demonstrates practical SQL skills required for Data Analyst and Business Analyst roles.

---

## 🎯 Business Objectives

* Understand product distribution across categories
* Analyze pricing and discount patterns
* Identify top revenue-generating products
* Evaluate inventory availability and stock shortages
* Compare product prices within categories

---

## 🗂 Dataset Information

**Dataset Name:** Zepto Inventory Dataset

**Key Columns:**

* name – Product Name
* category – Product Category
* mrp – Maximum Retail Price
* discountedSellingPrice – Selling Price
* discountPercent – Discount %
* availableQuantity – Available Stock
* weightInGms – Product Weight
* outOfStock – Stock Status

---

## 🧹 Data Cleaning

The following data cleaning steps were performed:

* Removed duplicate records
* Checked and handled null values
* Corrected pricing inconsistencies
* Standardized category values
* Created derived metrics for analysis

---

## 📊 Analysis Performed

### Exploratory Data Analysis

* Product count by category
* Price distribution analysis
* Discount analysis
* Inventory distribution

### Business Insight Analysis

* Top revenue generating products
* Revenue contribution by category
* High demand products using stock status
* Profit margin analysis

---

## 🚀 SQL Techniques Used

### Aggregate Functions

* SUM()
* AVG()
* COUNT()

### Window Functions

* RANK()
* Running Total using SUM() OVER()

### Conditional Logic

* CASE statements

### Derived Columns

* Revenue calculation
* Profit calculation
* Price per gram

---

## 📈 Key Business Insights

* A small number of products contribute significantly to total revenue
* Premium products generate higher revenue per unit
* Some categories show frequent stock shortages indicating high demand
* Discount strategy varies significantly across categories

---

## 🛠 Tools Used

* PostgreSQL
* SQL
* pgAdmin
* GitHub

---

## 📁 Project Structure

```id="fdr3wr"
zepto-sql-project/

│── zepto_v2.csv
│── Zepto_inventory_data_analysis.sql
│── README.md
```

---

## 💼 Skills Demonstrated

* SQL for Data Analysis
* Data Cleaning using SQL
* Business Insight Generation
* Window Functions (RANK, Running Total)
* Analytical Thinking

---

## 💼 Business Value

This project shows how SQL can be used to:

* Support business decision-making
* Identify revenue opportunities
* Analyze pricing strategies
* Improve inventory management

---

## 👨‍💻 Author

**Sreejit Kumar Paul**

MBA Business Analytics

Software Engineer | Aspiring Data Analyst

📍 Kolkata, India

---

## ⭐ If you found this project useful, please give it a star!
