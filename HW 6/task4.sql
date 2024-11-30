-- 1
SELECT c.Customer_Name
FROM Customers c
WHERE c.Amount_Spent > 450.00
AND c.Headwaiter = (
    SELECT Staff_No
    FROM Staff
    WHERE Name = 'Charles'
);
-- 2
SELECT s.Name, s.Surname
FROM Staff s
WHERE s.Staff_No = (
    SELECT Headwaiter
    FROM Customers
    WHERE Customer_Name = 'Nerida' AND Date = 160111
);
-- 3
SELECT Customer_Name
FROM Customers
WHERE Amount_Spent = (
    SELECT MIN(Amount_Spent)
    FROM Customers
);
-- 4
SELECT s.Name
FROM Staff s
WHERE s.Staff_No NOT IN (
    SELECT DISTINCT Waiter_No
    FROM Customers
);
-- 5
SELECT c.Customer_Name, s.Name AS Headwaiter_Name, s.Surname AS Headwaiter_Surname, r.Room_Name
FROM Customers c
JOIN Rooms r ON c.Room_No = r.Room_No
JOIN Staff s ON c.Headwaiter = s.Staff_No
WHERE c.Amount_Spent = (
    SELECT MAX(Amount_Spent)
    FROM Customers
);
