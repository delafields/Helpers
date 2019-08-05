-- Quick overview of window functions

-- Create dummy data
CREATE TABLE #Temp_For_Window
(
	order_id INT,
	order_date DATE,
	customer_name VARCHAR(250),
	city VARCHAR(100),	
	order_amount MONEY
)
 
INSERT INTO #Temp_For_Window
SELECT '1001','04/01/2017','David Smith','GuildFord',10000
UNION ALL	  
SELECT '1002','04/02/2017','David Jones','Arlington',20000
UNION ALL	  
SELECT '1003','04/03/2017','John Smith','Shalford',5000
UNION ALL	  
SELECT '1004','04/04/2017','Michael Smith','GuildFord',15000
UNION ALL	  
SELECT '1005','04/05/2017','David Williams','Shalford',7000
UNION ALL	  
SELECT '1006','04/06/2017','Paum Smith','GuildFord',25000
UNION ALL	 
SELECT '1007','04/10/2017','Andrew Smith','Arlington',15000
UNION ALL	  
SELECT '1008','04/11/2017','David Brown','Arlington',2000
UNION ALL	  
SELECT '1009','04/20/2017','Robert Smith','Shalford',1000
UNION ALL	  
SELECT '1010','04/25/2017','Peter Smith','GuildFord',500

/*
AGGREGATED WINDOW FUNCTIONS
	Rows retain their identity and shows an aggregated value for each row
	Query Below shows order total for each person's respective city
*/
SELECT order_id, order_date, customer_name, city, order_amount
	,SUM(order_amount) OVER(PARTITION BY city) AS grand_total
FROM #Temp_For_Window

/*
Also
	AVG(): average for each group
	MIN(): min value for each group
	MAX(): max value for each group
	COUNT(): count records for each group
		Cannot use DISTINCT here
*/


-- RANKING WINDOW FUNCTIONS
/*
RANK()
	Gives a unique rank to each record based on a specific value(s)
	If two records have the same value, then RANK() will assign the same rank to both records
*/
SELECT order_id,order_date,customer_name,city, 
	RANK() OVER(ORDER BY order_amount DESC) AS RANK
FROM #Temp_For_Window

/*
DENSE_RANK()
	Identical to RANK() but does not skip any rank
*/
SELECT order_id,order_date,customer_name,city, 
	DENSE_RANK() OVER(ORDER BY order_amount DESC) AS DENSE_RANK
FROM #Temp_For_Window

/*
ROW_NUMBER()
	Assign a unique row number for every record within a group
*/
SELECT order_id,order_date,customer_name,city, 
	ROW_NUMBER() OVER(PARTITION BY city ORDER BY order_amount) AS [row In city]
FROM #Temp_For_Window

/*
NTILE(INT)
	Identifies what percentile (or quartile) a row falls into
		i.e. if you have 100 rows and 4 quartiles you can see how many rows fall into each quartile
*/
SELECT order_id, order_date, customer_name, city, order_amount,
	NTILE(4) OVER(ORDER BY order_amount) AS quartile
FROM #Temp_For_Window


/*
VALUE WINDOW FUNCTIONS
	Used to find first, last, previous, and next values
*/

/*
LAG()
	Allows access to the previous row in the same result set
	Below finds previous order date
*/
SELECT order_id,customer_name, city, order_amount, order_date,
	--in below line, 1 indicates check for previous row of the current row
	LAG(order_date,1) OVER(ORDER BY order_date) prev_order_date
FROM #Temp_For_Window

/*
LEAD()
	Allows access to the next row in the same result set
	Below finds previous order date
*/
SELECT order_id,customer_name, city, order_amount, order_date,
	--in below line, 1 indicates check for previous row of the current row
	LEAD(order_date,1) OVER(ORDER BY order_date) next_order_date
FROM #Temp_For_Window

/*
FIRST_VALUE() and LAST_VALUE()
	Identifies first and last record within a partition
	Below finds the first and last order of each city
*/
SELECT order_id, customer_name, city, order_amount,
	FIRST_VALUE(order_date) OVER(PARTITION BY city ORDER BY city) first_order_date,
	LAST_VALUE(order_date) OVER(PARTITION BY city ORDER BY city) last_order_date
FROM #Temp_For_Window