CREATE TABLE netflix_schema (
    show_id VARCHAR(10),
    type VARCHAR(10),
    title VARCHAR(255),
    director VARCHAR(255),
    casts VARCHAR(1000),
    country VARCHAR(255),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(50),
    listed_in VARCHAR(255),
    description VARCHAR(250)
);

LOAD DATA LOCAL INFILE '/Users/pavankumarbathula/Desktop/ml/netflix_titles.csv'
INTO TABLE netflix_schema
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- ============= --
SELECT 
DISTINCT type
FROM netflix_schema;

-- ============ --
SELECT * FROM netflix_schema;
-- 15 Business Problems --


-- Netflix Data Analysis using SQL
-- 15 Business Problems

-- 1. Count the number of Movies vs TV Shows. -- 

SELECT COUNT(*)
FROM netflix_schema
GROUP BY type;

-- 2. Find the most common rating for Movies and TV Shows. -- 

SELECT
	type,
    rating
FROM (
	SELECT 
		type,
		rating, 
		COUNT(*) as Count,
	RANK() Over(PARTITION BY type ORDER BY COUNT(*) DESC) as ranking
	FROM netflix_schema
	GROUP BY 1,2
    )as t1
WHERE ranking = 1; 

-- 3. List all Movies released in a specific year (e.g., 2020).

SELECT *
FROM netflix_schema
WHERE 
	type='Movie'
    AND
    release_year=2020;

-- 4. Find the top 5 countries with the most content on Netflix.

SELECT
    TRIM(j.country) AS country,
    COUNT(*) AS total_content
FROM netflix_schema,
JSON_TABLE(
    CONCAT('["', REPLACE(country, ',', '","'), '"]'),
    '$[*]'
    COLUMNS (
        country VARCHAR(255) PATH '$'
    )
) AS j
WHERE TRIM(j.country) <> ''
GROUP BY country
ORDER BY total_content DESC
LIMIT 5;
    

-- 5. Identify the longest Movie.
SELECT * from netflix_schema
WHERE 
	type='Movie'
    AND
    duration = (SELECT MAX(duration) FROM netflix_schema);

-- 6. Find content added to Netflix in the last 5 years.

SELECT *
FROM netflix_schema
WHERE STR_TO_DATE(date_added, '%M %d,%Y') >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);



-- 7. Find all Movies and TV Shows directed by 'Rajiv Chilaka'.
SELECT title,director
FROM netflix_schema
WHERE director LIKE BINARY '%Rajiv Chilaka%';

-- 8. List all TV Shows with more than 5 seasons.

SELECT *, 
		SUBSTRING_INDEX(duration, ' ',1)AS seasons
FROM netflix_schema
	WHERE 
		type = 'TV Show' AND
		CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 5;

-- 9. Count the number of content items in each genre.

SELECT
    TRIM(j.genre) AS genre,
    COUNT(*) AS total_content
FROM netflix_schema,
JSON_TABLE(
    CONCAT('["', REPLACE(listed_in, ',', '","'), '"]'),
    '$[*]'
    COLUMNS (
        genre VARCHAR(255) PATH '$'
    )
) AS j
GROUP BY genre
ORDER BY total_content DESC;
    
    

-- 10. Find each year and the average percentage of content released by India on Netflix.
-- Return the top 5 years with the highest average content release.

SELECT 
	EXTRACT(YEAR FROM STR_TO_DATE(date_added, '%M %d,%Y')) AS year,
    COUNT(*),
    COUNT(*)/(SELECT COUNT(*) FROM netflix_schema WHERE country like "India")*100 as AVG_CONTENT_PER_YEAR
FROM netflix_schema
WHERE country LIKE "India"
GROUP BY year 
ORDER BY AVG_CONTENT_PER_YEAR DESC;

-- 11. List all Movies that are Documentaries.

SELECT * FROM netflix_schema
WHERE listed_in LIKE BINARY "%Documentaries%";

-- 12. Find all content without a director.

SELECT *
FROM netflix_schema
WHERE TRIM(director) = '';

-- 13. Find how many Movies actor 'Salman Khan' appeared in during the last 10 years.

SELECT * FROM netflix_schema
WHERE casts LIKE BINARY "%Salman Khan%" 
AND release_year > extract(YEAR FROM CURRENT_DATE)-10;

-- 14. Find the top 10 actors who have appeared in the highest number of Movies produced in India.

SELECT
    TRIM(j.casts) AS actors,
    COUNT(*) AS NO_OF_MOVIES
FROM netflix_schema,
JSON_TABLE(
    CONCAT('["', REPLACE(casts, ',', '","'), '"]'),
    '$[*]'
    COLUMNS (
        casts VARCHAR(255) PATH '$'
    )
) AS j
WHERE country LIKE '%India%' 
AND TRIM(j.casts) <> ''
GROUP BY actors
ORDER BY NO_OF_MOVIES DESC 
LIMIT 10;
    

-- 15. Categorize content based on the presence of the keywords 'kill' and 'violence' in the description field. 
-- Label content containing these keywords as 'Bad' and all other content as 'Good'. Count how many items fall into each category.
WITH CATEGORY_TABLE AS(
SELECT *,
	CASE 
    WHEN 
		description LIKE BINARY "%kill%" 
		OR description LIKE BINARY "%violence%"
		THEN "BAD"
		ELSE "GOOD"
	END category
FROM netflix_schema)
SELECT category,COUNT(*) as TOTAL_CONTENT
FROM CATEGORY_TABLE
GROUP BY 1;
    
