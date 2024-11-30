-- 1
SELECT s.Name, s.Surname, c.Date, COUNT(c.Bill_No) AS Num_Bills
FROM Staff s
JOIN Customers c ON s.Staff_No = c.Waiter_No
GROUP BY s.Name, s.Surname, c.Date
HAVING COUNT(c.Bill_No) >= 2;
-- 2
SELECT r.Room_Name, COUNT(t.Table_No) AS Num_Tables
FROM Rooms r
JOIN Tables t ON r.Room_No = t.Room_No
WHERE t.Covers > 6
GROUP BY r.Room_Name;
-- 3
SELECT r.Room_Name, SUM(c.Amount_Spent) AS Total_Bills
FROM Rooms r
JOIN Customers c ON r.Room_No = c.Room_No
GROUP BY r.Room_Name;
-- 4
SELECT s.Name AS Headwaiter_Name, s.Surname AS Headwaiter_Surname, SUM(c.Amount_Spent) AS Total_Bill_Amount
FROM Staff s
JOIN Staff w ON s.Staff_No = w.Headwaiter
JOIN Customers c ON w.Staff_No = c.Waiter_No
WHERE s.Headwaiter IS NULL
GROUP BY s.Name, s.Surname
ORDER BY Total_Bill_Amount DESC;
-- 5
SELECT c.Customer_Name, AVG(c.Amount_Spent) AS Avg_Amount
FROM Customers c
GROUP BY c.Customer_Name
HAVING AVG(c.Amount_Spent) > 400;
-- 6
SELECT s.Name, s.Surname, c.Date, COUNT(c.Bill_No) AS Num_Bills
FROM Staff s
JOIN Customers c ON s.Staff_No = c.Waiter_No
GROUP BY s.Name, s.Surname, c.Date
HAVING COUNT(c.Bill_No) >= 3;
