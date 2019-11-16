-- 1. Preview the inventory and film tables
SELECT * FROM inventory;
SELECT * FROM film;	


-- 2. Drop View if it already exists
DROP VIEW IF EXISTS title_count;


-- 3. Use sub-query to determine the number of copies for each film title in the inventory table
CREATE VIEW title_count AS
	SELECT
		film.title
		,subq1.copy_count AS "number of copies"
	FROM 
		film
		,(
			SELECT 
				film_id
				,COUNT(*) AS copy_count
			FROM
				inventory
			WHERE 
				film_id
			IN
				(
					SELECT
						film_id
					FROM
						film
				)
			GROUP BY 
				film_id
		) AS subq1
	WHERE
		film.film_id = subq1.film_id
	ORDER BY
		film.title;


-- 4. Display View
SELECT * FROM title_count;


-- 5. Query to display titles with 7 copies
SELECT
	*
FROM
	title_count
WHERE
	"number of copies" = 7;
