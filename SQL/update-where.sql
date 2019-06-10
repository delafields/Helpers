-- Update a table where some condition is met
-- i.e., only update a subset of said table

UPDATE a
SET a.state_cd = b.state_cd
FROM #TableToUpdate a
JOIN
(
	SELECT state_cd , category_cd, id
	FROM OtherTable.dbo.OtherTable
	WHERE country_cd = 'US'
) b
ON a.id = b.id AND a.category_cd = b.category_cd
WHERE a.fizzbuzz = 42