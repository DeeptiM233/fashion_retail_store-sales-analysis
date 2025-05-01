CREATE DATABASE fashion_store;
USE fashion_store;
CREATE TABLE fashion_store_sales(
customer_reference_ID INT PRIMARY KEY,
item_purchased VARCHAR(20),
purchase_amount INT,
date_purchased DATE,
review_rating FLOAT,
payment_method VARCHAR(20)
);
select* from fashion_store_sales;
SELECT
    EXTRACT(YEAR FROM date_purchased) AS year,
    EXTRACT(MONTH FROM date_purchased) AS month,
    SUM(purchase_amount) AS total_purchase,
    COUNT(DISTINCT customer_reference_ID) AS order_volume
FROM
    fashion_store_sales
GROUP BY
    EXTRACT(YEAR FROM date_purchased),
    EXTRACT(MONTH FROM date_purchased)
ORDER BY
    year, month;

#FINDINGS FOR SPECIFIC YEAR BY LIMITING THE MONTHS AND YEAR VALUE#
SELECT * 
FROM (
    SELECT
        EXTRACT(YEAR FROM date_purchased) AS year,
        EXTRACT(MONTH FROM date_purchased) AS month,
        SUM(purchase_amount) AS total_purchase,
        COUNT(DISTINCT customer_reference_ID) AS order_volume
    FROM
        fashion_store_sales
    GROUP BY
        EXTRACT(YEAR FROM date_purchased),
        EXTRACT(MONTH FROM date_purchased)
) AS aggregated_data
WHERE
    year = 2022 AND month BETWEEN 1 AND 3
ORDER BY
    year, month;