USE Netflix;

-- view 1 --

DROP VIEW IF EXISTS vw_movies_vs_tv;

CREATE OR REPLACE VIEW vw_movies_vs_tv AS
SELECT
    show_id,
    type
FROM netflix_schema
WHERE type IS NOT NULL;

SELECT * FROM vw_movies_vs_tv LIMIT 10;
-- View 2: Content Added by Year
USE Netflix;

DROP VIEW IF EXISTS vw_content_by_year;

CREATE OR REPLACE VIEW vw_content_by_year AS
SELECT
    show_id,
    YEAR(STR_TO_DATE(date_added, '%M %d, %Y')) AS year_added
FROM netflix_schema
WHERE
    date_added IS NOT NULL
    AND TRIM(date_added) <> '';


-- View 3: Top 10 Countries
USE Netflix;

DROP VIEW IF EXISTS vw_top_countries;

CREATE OR REPLACE VIEW vw_top_countries AS
SELECT
    n.show_id,
    TRIM(j.country) AS country
FROM netflix_schema n,
JSON_TABLE(
    CONCAT('["', REPLACE(n.country, ',', '","'), '"]'),
    '$[*]'
    COLUMNS (
        country VARCHAR(255) PATH '$'
    )
) AS j
WHERE TRIM(j.country) <> '';


-- View 4: Rating Distribution
USE Netflix;

DROP VIEW IF EXISTS vw_rating_distribution;

CREATE OR REPLACE VIEW vw_rating_distribution AS
SELECT
    show_id,
    rating
FROM netflix_schema
WHERE
    rating IS NOT NULL
    AND TRIM(rating) <> ''
    AND rating NOT REGEXP '^[0-9]+ min$';


-- View 5: Top Genres
USE Netflix;

DROP VIEW IF EXISTS vw_top_genres;

CREATE OR REPLACE VIEW vw_top_genres AS
SELECT
    n.show_id,
    TRIM(j.genre) AS genre
FROM netflix_schema n,
JSON_TABLE(
    CONCAT('["', REPLACE(n.listed_in, ',', '","'), '"]'),
    '$[*]'
    COLUMNS (
        genre VARCHAR(255) PATH '$'
    )
) AS j
WHERE TRIM(j.genre) <> '';

-- View 6: Top 10 Indian Actors
USE Netflix;

DROP VIEW IF EXISTS vw_top_indian_actors;

CREATE OR REPLACE VIEW vw_top_indian_actors AS
SELECT
    n.show_id,
    TRIM(j.actor) AS actor
FROM netflix_schema n,
JSON_TABLE(
    CONCAT('["', REPLACE(n.casts, ',', '","'), '"]'),
    '$[*]'
    COLUMNS (
        actor VARCHAR(255) PATH '$'
    )
) AS j
WHERE
    n.country LIKE '%India%'
    AND TRIM(j.actor) <> '';

SELECT * FROM vw_top_indian_actors;

SHOW WARNINGS;

-- View 7: Content Category
USE Netflix;

DROP VIEW IF EXISTS vw_content_category;

CREATE OR REPLACE VIEW vw_content_category AS
SELECT
    show_id,
    CASE
        WHEN LOWER(description) LIKE '%kill%'
          OR LOWER(description) LIKE '%violence%'
        THEN 'Bad'
        ELSE 'Good'
    END AS category
FROM netflix_schema;

-- View 8: Longest Movie
USE Netflix;

DROP VIEW IF EXISTS vw_longest_movie;

CREATE OR REPLACE VIEW vw_longest_movie AS
SELECT
    title AS 'Title',
    COALESCE(NULLIF(director,''), 'Not Available') AS 'Director',
    COALESCE(NULLIF(country,''), 'Not Available') AS 'Country',
    duration AS 'Duration',
    release_year AS 'Release Year',
    rating AS 'Rating'
FROM netflix_schema
WHERE type = 'Movie'
AND CAST(SUBSTRING_INDEX(duration,' ',1) AS UNSIGNED) =
(
    SELECT MAX(CAST(SUBSTRING_INDEX(duration,' ',1) AS UNSIGNED))
    FROM netflix_schema
    WHERE type='Movie'
);