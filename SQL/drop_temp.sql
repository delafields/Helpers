-- Create dummy data
CREATE TABLE #BaseTable1 ( temp_header INT )
 
INSERT INTO #BaseTable1 (temp_header)
VALUES (3), (6), (9)

-- Will drop the table if it needs to be overwritten
if object_id('tempdb..#Temp_Table_Name') is not null 
drop table #Temp_Table_Name;

SELECT a.*
INTO #Temp_Table_Name
FROM #BaseTable1 a