SELECT * FROM ecommerce_dataset_updated
LIMIT 10;

SELECT * FROM ecommerce_dataset_updated
WHERE Category = 'Electronics'
ORDER BY "Final_Price(Rs.)" DESC
LIMIT 10;

SELECT Category, SUM("Final_Price(Rs.)") AS Total_Revenue
FROM ecommerce_dataset_updated
GROUP BY Category
ORDER BY Total_Revenue DESC;

SELECT * FROM ecommerce_dataset_updated
WHERE "Final_Price(Rs.)" > (
    SELECT AVG("Final_Price(Rs.)") FROM ecommerce_dataset_updated
)
ORDER BY "Final_Price(Rs.)" DESC;


CREATE VIEW HighValuePurchases AS
SELECT "User_ID", "Category", "Final_Price(Rs.)", "Payment_Method"
FROM ecommerce_dataset_updated
WHERE "Final_Price(Rs.)" > 10000;
SELECT * FROM HighValuePurchases;


CREATE INDEX idx_final_price ON ecommerce_dataset_updated("Final_Price(Rs.)");
PRAGMA index_list('ecommerce_dataset_updated');





