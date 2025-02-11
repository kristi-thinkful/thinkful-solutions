-- SQL foundations I: Relational databases and basic querying

-- Drills
-- To close out this module, you’ll work with your new SQL knowledge and a new dataset. 
-- Using the SQL skills you’ve learned so far, you'll answer a series of questions about the data.

-- The fueleconomy database
-- The database for this challenge is located on the same server you’ve used in previous checkpoints 
-- in this module. The name of the database is fueleconomy. It contains EPA fuel economy statistics 
-- for different makes and models of vehicles from 1984 to 2015.
-- To connect, use the following credentials:
-- Host: 142.93.121.174
-- Username: dsbc_student
-- Password: 7*.8G9QH21
-- Port: 5432

-- Questions
-- To complete this challenge, you should submit a single text file that contains the SQL query required 
-- for each question. In some cases, you may also need a specific answer. Plan to spend some time going 
-- over your answers with your mentor during your next session.

-- How many records are in the vehicles table? Provide the query you’d use to determine this as well as the answer to the question.
SELECT COUNT(*)
FROM vehicles
-- There are 33442 records in the vehicles table

-- Write a query that returns all the records in the vehicles table.
SELECT *
FROM vehicles

-- Write a query that returns the id, make, and model fields for all the records for 2010 vehicles.
SELECT 
		id, 
		make, 
		model
FROM vehicles
WHERE year = 2010

-- Write a query that returns the count of vehicles from 2010. Also provide the answer.
SELECT COUNT(*)
FROM vehicles
WHERE year = 2010
-- There are 1109 vehicles from 2010

-- Write a query that returns the count of vehicles in the vehicles table between the years 2010 and 2015, inclusive. Provide 
-- the query as well as the answer.
SELECT COUNT(*)
FROM vehicles
WHERE year BETWEEN 2010 and 2015
-- There are 5995 vehicles between 2010 and 2015

-- Write a query that returns the count of vehicles from the years 1990, 2000, and 2010. Provide the query and the result.
SELECT COUNT(*)
FROM vehicles
WHERE year = 1990 
OR year = 2000
OR year = 2010

-- Write a query that returns the count of all records between 1987 and 2005, exclusive of the years 1990 and 2000.
SELECT COUNT(*)
FROM vehicles
WHERE year BETWEEN 1987 AND 2005
AND year N

-- Write a query that returns the year, make, model, and a field called average_mpg that calculates the average highway/city 
-- fuel consumption. (For example, if hwy is 24 and cty is 20, then average_mpg = (24 + 20)/ 2 = 22.)
SELECT
	year, 
	make,
	model,
	avg_mpg
FROM vehicles

-- Write a query that returns the year, make, model, and a text field displaying “X highway; Y city.” (For example, if hwy is 
-- 24 and cty is 20, then hwy_city is “24 highway; 20 city.”)
SELECT 
	year,
	make,
	model,
	CONCAT(hwy, ' highway;', cty, ' city.')
FROM vehicles

-- Write a query that returns the id, make, model, and year for all records that have NULL for either the cyl or displ fields.
SELECT
	id,
	make,
	model,
	year
FROM vehicles
WHERE cyl ISNULL
OR displ ISNULL

-- Write a query that returns all fields for records with rear-wheel drive and diesel vehicles since 2000, inclusive. Also sort 
-- by year and highway mileage, both descending. Hint: to view the distinct values in a field, you can use DISTINCT. For example, 
-- use SELECT DISTINCT(drive) FROM vehicles; to get the unique values that appear in that field, or use SELECT DISTINCT(fuel) FROM vehicles;.
SELECT *
FROM vehicles
WHERE year >= 2000
AND drive = 'Rear-Wheel Drive'
AND fuel = 'Diesel'
ORDER BY year, hwy

-- Write a query that counts the number of vehicles that are either Fords or Chevrolets and either compact cars or 2-seaters. Provide 
-- the query and the answer.
SELECT COUNT(*)
FROM vehicles
WHERE make IN ('Ford', 'Chevrolet')
AND class IN ('Compact Cars', 'Two Seaters')

-- Write a query that returns the records for 10 vehicles with the highest highway fuel mileage.
SELECT 
	make,
	model,
	year,
	hwy
FROM vehicles
ORDER BY hwy DESC
LIMIT 10;

-- Write a query that returns all the records of vehicles since the year 2000 whose model name starts with a capital X. Sort the 
-- list A through Z by make. What happens when you use a lowercase “x” instead?
SELECT * 
FROM vehicles
WHERE year > 2000
AND model LIKE 'X%'
ORDER BY make

-- Write a query that returns the count of records where the “cyl” field is NULL. Provide the query as well as the answer.
SELECT COUNT(*)
FROM vehicles
WHERE cyl IS NULL

-- Write a query that returns the count of all records before the year 2000 that got more than 20 mpg hwy and had greater than 3 
-- liters displacement (“displ” field). Provide the query as well as the answer.
SELECT count(*)
FROM vehicles
WHERE year < 2000
AND hwy > 20
AND displ > 3

-- Write a query that returns all records whose model name has a (capital) X in its 3rd position. Hint: make sure your wildcard 
-- operator accommodates for any characters after the “X”!
SELECT *
FROM vehicles
WHERE model LIKE '__X%'