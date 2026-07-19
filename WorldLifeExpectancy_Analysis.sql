SHOW TABLES;



SELECT * FROM worldlifexpectancy;

SELECT Country, Year, COUNT(*)
FROM worldlifexpectancy
GROUP BY Country, Year
HAVING COUNT(*) > 1;
	
	SELECT *
    FROM (
		SELECT ROW_ID,
			COUNTRY,
			YEAR,
			CONCAT(Country, Year) AS combined_key,
			ROW_NUMBER() OVER(
				PARTITION BY CONCAT(Country, Year) 
                ORDER BY Row_ID
			) AS Row_Num
	FROM worldlifexpectancy
    ) AS t
    WHERE Row_Num > 1;


    SELECT ROW_ID,
			COUNTRY,
			YEAR,
			CONCAT(Country, Year) AS combined_key,
			ROW_NUMBER() OVER(
				PARTITION BY CONCAT(Country, Year) 
                ORDER BY Row_ID
			) AS Row_Num
	FROM worldlifexpectancy;
    
    SELECT DISTINCT(status)
    FROM world_life_expectancy;
    
    SELECT*
    FROM worldlifexpectancy
    WHERE Status IS NULL OR Status = '';
    
    SELECT Country, Status
    FROM worldlifexpectancy
    WHERE Status != ''
    GROUP BY Country, Status;
    
    SELECT DISTINCT Country
    FROM worldlifexpectancy
    WHERE Status IS NULL OR Status = '';
    
    SELECT Country, Status
    FROM worldlifexpectancy
	WHERE Country IN (
		SELECT DISTINCT Country
        FROM worldlifexpectancy
        WHERE Status IS NULL OR Status = ''
	)
    ORDER BY Country;

SELECT *
FROM worldlifexpectancy
WHERE Country IN (
	SELECT DISTINCT(Country)
    FROM worldlifexpectancy
    WHERE Status = 'Developing'
)
AND (Status IS NULL OR Status = '');

SELECT *
FROM worldlifexpectancy
WHERE Status IS NULL OR Status = '';
    
UPDATE worldlifexpectancy
SET Status = 'Developing'
WHERE Country IN (
	SELECT DISTINCT(Country)
    FROM worldlifexpectancy
    WHERE Status = 'Developing'
)
AND (Status IS NULL OR Status = '');

SELECT*
FROM worldlifexpectancy
WHERE Status IS NULL OR STATUS = '';
    
SELECT Country, Year, 'Life expectancy'
FROM worldlifexpectancy
#WHERE 'Life expectancy' = ''

SELECT 1.COUNTRY, t1.YEAR, t1.'Life expectancy',
t2.COUNTRY, t2.YEAR, t2.'Life expectancy',
t3.COUNTRY, t3.YEAR, t3.'Life expectancy',
FROM worldlifexpectancy t1
JOIN worldlifexpectancy t2
	ON t1.Country = t2.Country
    AND t1.YEAR = t3.YEAR + 1
WHERE t1. 'Life expectancy' = ''
;

UPDATE worldlifeexpectancy t1
JOIN worldlifeexpectancy t2
    ON t1.Country = t2.Country
   AND t1.Year = t2.Year - 1
JOIN worldlifeexpectancy t3
    ON t1.Country = t3.Country
   AND t1.Year = t3.Year + 1
SET t1.`Life expectancy` = ROUND((t2.`Life expectancy` + t3.`Life expectancy`) / 2, 1)
WHERE t1.`Life expectancy` IS NULL;
    
    
    order was done by 
    -- Remove duplicates
-- (your row_number delete query)

-- Fix status column
-- (your update for Developing/Developed)

-- Fill missing life expectancy
-- (the final self-join + ROUND update)
