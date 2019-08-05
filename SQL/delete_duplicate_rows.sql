-- This is a CTE to delete duplicate rows

-- Create dummy table
CREATE TABLE #Duplicates(Col1 INT, Col2 CHAR(1));
INSERT INTO #Duplicates(Col1, Col2) 
VALUES
	(1,'A'),(2,'B'),(2,'B'),(2,'B'),
	(3,'C'),(4,'D'),(4,'D'),(5,'E'),
	(5,'E'),(5,'E');

-- CTE to delete duplicate rows
WITH Dupes AS (
	SELECT Col1, Col2,
		ROW_NUMBER() OVER(PARTITION BY Col1, Col2 ORDER BY Col1) AS RowNum
	FROM #Duplicates)
DELETE Dupes
WHERE RowNum <> 1

SELECT * FROM #Duplicates