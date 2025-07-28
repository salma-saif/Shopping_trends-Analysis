SELECT TOP (1000) [Customer_ID]
      ,[Age]
      ,[Gender]
      ,[Item_Purchased]
      ,[Category]
      ,[Purchase_Amount_USD]
      ,[Location]
      ,[Size]
      ,[Color]
      ,[Season]
      ,[Review_Rating]
      ,[Subscription_Status]
      ,[Payment_Method]
      ,[Shipping_Type]
      ,[Discount_Applied]
      ,[Promo_Code_Used]
      ,[Previous_Purchases]
      ,[Preferred_Payment_Method]
      ,[Frequency_of_Purchases]
  FROM [shooping_trends#1].[dbo].[shopping_trends]


  -- view column info
  SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE
  FROM [shooping_trends#1].INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME='shopping_trends';


  -- Total records
SELECT COUNT(*) AS total_rows
FROM [shooping_trends#1].[dbo].[shopping_trends];

-- Unique customers
SELECT COUNT(DISTINCT [Customer_ID]) AS unique_customers
FROM [shooping_trends#1].[dbo].[shopping_trends];

--nulls check 
SELECT
  SUM(CASE WHEN [Age] IS NULL THEN 1 ELSE 0 END) AS null_age,
  SUM(CASE WHEN [Gender] IS NULL THEN 1 ELSE 0 END) AS null_gender,
  SUM(CASE WHEN [Review_Rating] IS NULL THEN 1 ELSE 0 END) AS null_review_rating,
  SUM(CASE WHEN [Payment_Method] IS NULL THEN 1 ELSE 0 END) AS null_payment_method
FROM [shooping_trends#1].[dbo].[shopping_trends];

--numeric summary
-- Age
SELECT 
  MIN([Age]) AS min_age,
  MAX([Age]) AS max_age,
  AVG([Age]) AS avg_age,
  STDEV([Age]) AS std_age
FROM [shooping_trends#1].[dbo].[shopping_trends];

-- Purchase Amount
SELECT 
  MIN([Purchase_Amount_USD]) AS min_purchase,
  MAX([Purchase_Amount_USD]) AS max_purchase,
  AVG([Purchase_Amount_USD]) AS avg_purchase,
  STDEV([Purchase_Amount_USD]) AS std_purchase
FROM [shooping_trends#1].[dbo].[shopping_trends];

--Categorical Distributions
-- Gender
SELECT [Gender], COUNT(*) AS count
FROM [shooping_trends#1].[dbo].[shopping_trends]
GROUP BY [Gender];

-- Category
SELECT [Category], COUNT(*) AS count
FROM [shooping_trends#1].[dbo].[shopping_trends]
GROUP BY [Category];

-- Subscription Status
SELECT [Subscription_Status], COUNT(*) AS count
FROM [shooping_trends#1].[dbo].[shopping_trends]
GROUP BY [Subscription_Status];

-- Payment Method
SELECT [Payment_Method], COUNT(*) AS count
FROM [shooping_trends#1].[dbo].[shopping_trends]
GROUP BY [Payment_Method];

--Ratings & Behavior
-- Average Review Rating per Category
SELECT [Category], AVG([Review_Rating]) AS avg_rating
FROM [shooping_trends#1].[dbo].[shopping_trends]
GROUP BY [Category];

-- Frequency of Purchases
SELECT [Frequency_of_Purchases], COUNT(*) AS customer_count
FROM [shooping_trends#1].[dbo].[shopping_trends]
GROUP BY [Frequency_of_Purchases]
ORDER BY customer_count DESC;

--Promo Code & Discount Insight
SELECT 
  [Promo_Code_Used],
  [Discount_Applied],
  COUNT(*) AS count
FROM [shooping_trends#1].[dbo].[shopping_trends]
GROUP BY [Promo_Code_Used], [Discount_Applied];
-- Check current data type
EXEC sp_help 'shopping_trends';

ALTER TABLE shopping_trends
ALTER COLUMN Purchase_Amount_USD DECIMAL(10, 2);
SELECT * FROM [shooping_trends#1].[dbo].[shopping_trends];

SELECT 
    [Customer_ID],
    [Age],
    
    CASE 
        WHEN [Age] < 18 THEN 'Teenagers'
        WHEN [Age] BETWEEN 18 AND 25 THEN 'Young Adults'
        WHEN [Age] BETWEEN 26 AND 35 THEN 'Adults'
        WHEN [Age] BETWEEN 36 AND 45 THEN 'Middle-Aged Adults'
        WHEN [Age] BETWEEN 46 AND 60 THEN 'Older Adults'
        ELSE 'Seniors'
    END AS [Age Group Name],

    [Purchase_Amount_USD],
    [Gender],
    [Location],
    [Frequency_of_Purchases] 
FROM 
    [shooping_trends#1].[dbo].[shopping_trends];

    select * from [shooping_trends#1].[dbo].[shopping_trends];
