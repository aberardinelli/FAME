USE FAME;
-- 0. Show the whole manager table.
SELECT * FROM MANAGER;

-- 1. Show first and last name of all managers.
USE FAME;
SELECT FirstName, LastName FROM MANAGER;

-- 2. Show all artists from PA
USE FAME;
SELECT * FROM ARTIST
WHERE State = 'PA';

-- 3. Show all artists from PA or NY
USE FAME;
SELECT * FROM ARTIST
WHERE State = 'PA' OR State = 'NY';

-- 4. Show all female artists from PA or NY
USE FAME;
SELECT * FROM ARTIST
WHERE (State = 'PA' OR State = 'NY')
AND Gender = 'FEMALE';


-- 5. Show all expenses under $50
USE FAME;
SELECT *
FROM EXPENSE
WHERE Amount < 50;

-- 6. Show all expenses for artist 4, sorted by date
USE FAME;
SELECT * FROM EXPENSE
WHERE ArtistID = 4
ORDER BY ExpenseDate;

-- 7. Show all expenses for artist 4, sorted by amount
USE FAME;
SELECT * FROM EXPENSE
WHERE ArtistID = 4
ORDER BY Amount DESC;

-- 8. Show all contract info for Artist # 23.
SELECT *
FROM CONTRACT
WHERE ArtistID = 23;

-- 9. Show all contracts with more than 50% royalty.
SELECT *
FROM CONTRACT
WHERE Royalty > 0.5;

-- 10. Show all active contracts.
SELECT *
FROM CONTRACT
WHERE Active = 1;

-- 11. Show all contracts that ended before today.
SELECT *
FROM CONTRACT
WHERE EndDate < '2018-11-08';

SELECT *
FROM CONTRACT
WHERE EndDate < CURRENT_DATE
;
-- 12a. How many contracts are there?
SELECT COUNT(*) FROM CONTRACT;

-- 12b. How many artists are there?
SELECT COUNT(*) FROM ARTIST;

-- 12c. How many performances are there?
SELECT COUNT(*) FROM PERFORMANCE;

-- 13. What are the maximum and minimum royalty amounts, out of all contracts?
SELECT MAX(Royalty), MIN(Royalty)
FROM CONTRACT;

-- 14. How many active vs inactive contracts are there?
SELECT Active, COUNT(*)
FROM CONTRACT
GROUP BY Active;

-- 15. Subtotal all artist expenses by artist ID
SELECT ArtistID, SUM(Amount)
FROM EXPENSE
WHERE ArtistID IS NOT NULL
GROUP BY ArtistID;

-- 16. Subtotal all artist expenses by expense type.
SELECT ExpenseType, SUM(Amount)
FROM EXPENSE
WHERE ArtistID IS NOT NULL
GROUP BY ExpenseType;

-- 17. Subtotal all artist expenses by artist ID and expense type.
SELECT ExpenseType, ArtistID, SUM(Amount)
FROM EXPENSE
WHERE ArtistID IS NOT NULL
GROUP BY ExpenseType, ArtistID;

-- 18. Count how many performances are in each performance status.
SELECT 
FROM 

