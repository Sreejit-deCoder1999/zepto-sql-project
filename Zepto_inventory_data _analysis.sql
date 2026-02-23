create Table Zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(50),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(4,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
)
--DATA EXPLORATION

SELECT COUNT(*) FROM Zepto --COUNT OF ROWS

SELECT * FROM Zepto LIMIT 20;

--NULL CHECK
SELECT * FROM ZEPTO 
WHERE name is NULL
OR
category is NULL
OR
mrp is NULL
OR
discountPercent is NULL
OR
availableQuantity is NULL
OR
discountedSellingPrice is NULL
OR
weightInGms is NULL
OR
outOfStock is NULL
OR
quantity is NULL;

--PRODUCT Categories
SELECT DISTINCT category FROM Zepto
ORDER BY category

--Products OUT OF STOCK vs IN STOCK
SELECT outOfStock, Count(sku_id) from Zepto
GROUP BY outOfStock;

--Product Names Repeated Multiple times
Select name, Count(name) from Zepto
GROUP BY name
HAVING Count(name)>1
ORDER BY Count(name) DESC;

--No of PRODUCTS per category
Select category , Count(name) as TOTAL_PRODUCTS from Zepto
Group BY category
ORDER BY COUNT(name) DESC;

--AVG PRICE per Category
SELECT category,AVG(discountedSellingPrice) AS AVG_Price
FROM zepto
GROUP BY category
ORDER BY AVG_Price DESC;

--CATEGORY WITH the HIGHEST Total Inventory
SELECT category,SUM(availableQuantity) AS total_quantity FROM zepto
GROUP BY category
ORDER BY total_quantity DESC;

--DATA CLEANING

--Products with Price =0
SELECT * FROM ZEPTO
WHERE mrp=0 or discountedSellingPrice=0

DELETE FROM ZEPTO
WHERE mrp=0 or discountedSellingPrice=0

--Converting Product Price from paise to Rupee
UPDATE Zepto
SET mrp=mrp/100.0,
discountedSellingPrice=discountedSellingPrice/100;

Select mrp ,discountedSellingPrice from Zepto

SELECT *
FROM zepto
WHERE mrp <= 0;

--CHECK If discounted price is greater than MRP
SELECT *
FROM zepto
WHERE discountedSellingPrice > mrp;

-- Check For Unrealistic weights
SELECT *
FROM zepto
WHERE weightInGms <= 0;

DELETE FROM ZEPTO 
WHERE weightInGms <= 0;

-- Business Insight Queries

-- Find top 10 best value products based on discount percentages

SELECT name,mrp,discountPercent from Zepto
ORDER BY discountPercent DESC
LIMIT 10

--Top 10 Revenue Generating Categories

Select  category , SUM(discountedSellingPrice*availablequantity) as Revenue from Zepto
GROUP BY category
ORDER BY Revenue DESC
LIMIT 10

--Top 10 Revenue Generating Products(in stock)

Select DISTINCT name  , SUM(discountedSellingPrice*availablequantity) as Revenue from Zepto
WHERE outOfStock = FALSE
GROUP BY name
ORDER BY Revenue DESC
LIMIT 10

--Products with high mrp but out of stock

SELECT DISTINCT name ,mrp from Zepto
WHERE outOfStock = TRUE and mrp>200
ORDER BY mrp DESC

--Find all products where MRP is greater than 500 and discount is less than 10%

SELECT DISTINCT name ,mrp,discountPercent from Zepto
WHERE mrp>500 and discountPercent<10
ORDER BY mrp DESC,discountPercent DESC

--TOP 5 categories with highest  AVERAGE Discounts

Select  category , AVG(discountPercent) as AVG_DISCOUNT  from Zepto
GROUP BY category
ORDER BY AVG_DISCOUNT DESC
LIMIT 5

--GROUP PRODUCTS INTO Categories Like LOW,MEDIUM,BULK

SELECT name, weightInGms ,
CASE WHEN weightInGms <1000 THEN  'LOW'
	WHEN weightInGms <5000 THEN 'MEDIUM'
	ELSE  'BULK'
	END AS WEIGHT_CATEGORY
FROM Zepto

--TOTAL INVENTORY WEIGHT PER CATEGORY

SELECT category, SUM(weightInGms*availableQuantity) as TOTAL_Inventory_Weight
from ZEPTO
GROUP BY category
ORDER BY TOTAL_Inventory_Weight DESC

--Rank Products by Price Within Each Category

SELECT name,category,discountedSellingPrice,
RANK() OVER (PARTITION BY category
ORDER BY discountedSellingPrice DESC
) AS price_rank
FROM zepto;

--Compare Product Price with Category Average

SELECT name,category,discountedSellingPrice,AVG(discountedSellingPrice)
OVER (PARTITION BY category)AS category_avg_price
FROM zepto;