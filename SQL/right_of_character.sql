/*
EXPLANATION

I was having a hell of a time getting some dirty
CVSs into SQL Server. When uploading some email addresses,
random ints were being tagged onto the start, separated by
a comma.
*/

SELECT TOP 3 * FROM #TEMP
/*
EMAIL_ADDRESS_
----------------------
674328,email@email.com
23427856,email@email.com
1111124,email@email.com
*/

-- SOLUTION
SELECT 
    SUBSTRING(
        EMAIL_ADDRESS_,
        CHARINDEX(',', EMAIL_ADDRESS_) + 1,
        LEN(EMAIL_ADDRESS_)
    )
    AS EMAIL_ADDRESS_
FROM #TEMP