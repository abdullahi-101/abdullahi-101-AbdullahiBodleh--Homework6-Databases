-- 1
SELECT s.Name AS Waiter_Name
FROM Staff s
JOIN Customers c ON s.Staff_No = c.Waiter_No
WHERE c.Customer_Name = 'Tanya Singh';
-- 2
SELECT r.Date
FROM Rooms r
JOIN Staff s ON r.Headwaiter = s.Staff_No
WHERE s.Name = 'Charles' AND r.Room_Name = 'Green' AND r.Date BETWEEN 160201 AND 160229;
-- 3
SELECT s.Name, s.Surname
FROM Staff s
WHERE s.Headwaiter = (
    SELECT Headwaiter
    FROM Staff
    WHERE Name = 'Zoe' AND Surname = 'Ball'
);
-- 4
SELECT c.Customer_Name, c.Amount_Spent, s.Name AS Waiter_Name
FROM Customers c
JOIN Staff s ON c.Waiter_No = s.Staff_No
ORDER BY c.Amount_Spent DESC;
-- 5
SELECT DISTINCT s.Name, s.Surname
FROM Staff s
JOIN Customers c1 ON s.Staff_No = c1.Waiter_No
JOIN Customers c2 ON s.Headwaiter = c2.Headwaiter
WHERE c1.Bill_No IN ('00014', '00017') AND c2.Bill_No IN ('00014', '00017');
-- 6
SELECT s.Name, s.Surname
FROM Staff s
WHERE s.Headwaiter = (
    SELECT Headwaiter
    FROM Rooms
    WHERE Room_Name = 'Blue' AND Date = 160312
)
OR s.Staff_No = (
    SELECT Headwaiter
    FROM Rooms
    WHERE Room_Name = 'Blue' AND Date = 160312
);
