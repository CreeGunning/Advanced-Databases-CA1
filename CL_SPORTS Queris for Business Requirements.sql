USE CL_SPORTS;

SELECT Customers_Dimension.Fname, Customers_Dimension.Lname, CL_SPORTS_Fact_Table.OrderID, Timeline_Dimension.MonthText, DATEDIFF(Purchase_Orders_Dimension.ShippingDate, Timeline_Dimension.Date_o) AS "Processing Length (Days)"
FROM CL_SPORTS_Fact_Table
INNER JOIN Customers_Dimension ON CL_SPORTS_Fact_Table.CustomerID=Customers_Dimension.CustomerID
INNER JOIN Purchase_Orders_Dimension ON CL_SPORTS_Fact_Table.OrderID=Purchase_Orders_Dimension.OrderID
INNER JOIN Timeline_Dimension ON CL_SPORTS_Fact_Table.TimeID=Timeline_Dimension.TimeID
ORDER BY Timeline_Dimension.Year_o;

SELECT Customers_Dimension.Fname, Customers_Dimension.Lname, CL_SPORTS_Fact_Table.OrderID, Timeline_Dimension.MonthText, DATEDIFF(Purchase_Orders_Dimension.DeliveredDate, Purchase_Orders_Dimension.ShippingDate) AS "Delivery Length (Days)"
FROM CL_SPORTS_Fact_Table
INNER JOIN Customers_Dimension ON CL_SPORTS_Fact_Table.CustomerID=Customers_Dimension.CustomerID
INNER JOIN Purchase_Orders_Dimension ON CL_SPORTS_Fact_Table.OrderID=Purchase_Orders_Dimension.OrderID
INNER JOIN Timeline_Dimension ON CL_SPORTS_Fact_Table.TimeID=Timeline_Dimension.TimeID
ORDER BY Timeline_Dimension.Year_o;

SELECT CL_SPORTS_Fact_Table.OrderID, Purchase_Orders_Dimension.ExpressDeliveryCharge AS "Express Delivery Charge", Timeline_Dimension.MonthID, Purchase_Orders_Dimension.ExpressDeliveryCharge + Item_Dimension.Price AS "Total Cost of Order"
FROM CL_SPORTS_Fact_Table
INNER JOIN Purchase_Orders_Dimension ON CL_SPORTS_Fact_Table.OrderID=Purchase_Orders_Dimension.OrderID
INNER JOIN Item_Dimension ON CL_SPORTS_Fact_Table.ItemID=Item_Dimension.ItemID
INNER JOIN Timeline_Dimension ON CL_SPORTS_Fact_Table.TimeID=Timeline_Dimension.TimeID
ORDER BY Timeline_Dimension.Year_o;

SELECT CL_SPORTS_Fact_Table.OrderID, Item_Dimension.BranchID, Supplier_Dimension.PriceBoughtFor AS "Bought For", Item_Dimension.Price AS "Sold For",  Item_Dimension.Price - Supplier_Dimension.PriceBoughtFor AS "Total Profit of Order (excl. Delivery Charge)"
FROM CL_SPORTS_Fact_Table
INNER JOIN Item_Dimension ON CL_SPORTS_Fact_Table.ItemID=Item_Dimension.ItemID
INNER JOIN Supplier_Dimension ON Item_Dimension.Supplier_StockID=Supplier_Dimension.Supplier_StockID
ORDER BY BranchID;