--Which are the 10 longest R rated movies?

SELECT * 
FROM film
WHERE length > (
    SELECT AVG(length)
    FROM film)
GROUP BY film_id, title
HAVING rating = 'R'
ORDER BY length DESC
LIMIT 10;

-- What are the NEXT 10 longest R rated movies?
-- hint: google "how to get next 10 records in sql"

SELECT * 
FROM film
WHERE length > (
    SELECT AVG(length)
    FROM film)
GROUP BY film_id, title
HAVING rating = 'R'
ORDER BY length DESC
OFFSET 10 ROWS;

--How many films are as long as the longest film?
-- RETURN an exact number
SELECT count(film_id)
FROM film
WHERE length = (
    SELECT MAX(length)
    FROM film);

--Which are the 10 longest R rated movies, SORTED IN ALPHABETICAL ORDER?
-- hint: might need a subquery

SELECT * 
FROM film
WHERE length > (
    SELECT AVG(length)
    FROM film)
GROUP BY film_id, title
HAVING rating = 'R'
ORDER BY length DESC,
title ASC
LIMIT 10;

--Which are the 10 kids films with the longest description?
-- G, PG, PG-13
--hint: google "SQL count length of string"

SELECT film_id, title, length(description) AS length_of_descrition
FROM film
WHERE rating IN ('G', 'PG', 'PG-13')
GROUP BY film_id, title, 3
ORDER BY 3 DESC;

-- How many unique release_years are there in the dvd rental database?
-- Return an exact number

SELECT COUNT(DISTINCT release_year)
FROM film;
