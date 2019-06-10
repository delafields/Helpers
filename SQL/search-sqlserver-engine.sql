-- use a wildcard to search a database engine
SELECT sc.name AS columnname, so.name AS tablename
FROM sysobjects so
JOIN syscolumns sc ON so.id = sc.id
WHERE sc.name LIKE '%search-term%'
ORDER BY sc.name, so.name