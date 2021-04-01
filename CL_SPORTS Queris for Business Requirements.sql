USE CL_SPORTS;

SELECT Item_Dimension.BranchID, COUNT(CL_SPORTS_Fact_Table.OrderID) AS "Amount of Orders"
FROM CL_SPORTS_Fact_Table
INNER JOIN Item_Dimension ON CL_SPORTS_Fact_Table.ItemID=Item_Dimension.ItemID
GROUP BY BranchID
Order By COUNT(CL_SPORTS_Fact_Table.OrderID) DESC;

SELECT Timeline_Dimension.MonthID, sum(Item_Dimension.Price) AS "Total Sales", AVG(Item_Dimension.Price) AS "Average Sales"
FROM CL_SPORTS_Fact_Table
INNER JOIN Timeline_Dimension ON CL_SPORTS_Fact_Table.TimeID=Timeline_Dimension.TimeID 
INNER JOIN Item_Dimension ON CL_SPORTS_Fact_Table.ItemID=Item_Dimension.ItemID
WHERE Timeline_Dimension.MonthID="11" OR Timeline_Dimension.MonthID="12"
GROUP BY MonthID
ORDER BY SUM(Item_Dimension.Price) DESC;

SELECT Item_Dimension.SportsCategory, COUNT(Item_Dimension.SportsCategory) AS "Amount of Sales"
FROM CL_SPORTS_Fact_Table
INNER JOIN Item_Dimension ON CL_SPORTS_Fact_Table.ItemID=Item_Dimension.ItemID
GROUP BY SportsCategory
ORDER BY COUNT(Item_Dimension.SportsCategory) DESC;

SELECT CL_SPORTS_Fact_Table.OrderID, Timeline_Dimension.MonthText, DATEDIFF(Purchase_Orders_Dimension.DeliveredDate, Purchase_Orders_Dimension.ShippingDate) AS "Delivery Length (Days)"
FROM CL_SPORTS_Fact_Table
INNER JOIN Purchase_Orders_Dimension ON CL_SPORTS_Fact_Table.OrderID=Purchase_Orders_Dimension.OrderID
INNER JOIN Timeline_Dimension ON CL_SPORTS_Fact_Table.TimeID=Timeline_Dimension.TimeID
WHERE Timeline_Dimension.MonthText="NOV" OR Timeline_Dimension.MonthText="DEC"
ORDER BY MonthID;


# Counts the amount of Assistant managers per branch
# !!
SELECT BNo, EmpNo, Fname, Lname, Role, COUNT(EmpNo)
FROM employees
WHERE role = 'Assistant Manager'
GROUP BY BNo;

#INNER Joining the tables CUSTOMERS and ORDERS to show CustomerNum, First Name, Last Name, StockNum, BNo
# All customers who have ordered products from G02
# !!
SELECT customers.CustomerNum, customers.Fname, customers.Lname, orders.OrderNum, orders.BNo
FROM customers
INNER JOIN orders ON customers.CustomerNum=orders.CustomerNum AND orders.BNo='G02'
ORDER BY CustomerNum;
    
#INNER Joining the tables STOCK, CUSTOMERS and ORDERS to show First Name, Last Name, Category, Model
# All customers who ordered Kids products
# !!
SELECT customers.CustomerNum, customers.Fname, customers.Lname, orders.OrderNum, stock.Category, stock.Model
FROM stock
INNER JOIN orders ON stock.Model=orders.Model AND stock.Category='Kids'
INNER JOIN customers ON orders.CustomerNum=customers.CustomerNum
ORDER BY CustomerNum;