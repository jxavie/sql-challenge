-- SQL HW Part 3 Activity 4


-- 1. Drop table if table already exist
DROP TABLE IF EXISTS animals;


-- 2. Create table per image in README.md
CREATE TABLE animals
	(
		id SERIAL
		,animal_name VARCHAR
		,species VARCHAR
		,PRIMARY KEY (id)
	);


-- 3. Add values to table
INSERT INTO
	animals
		(
			animal_name
			,species
		)
VALUES
	('Mickey Mouse', 'duck')
	,('Minnie Mouse', 'duck')
	,('Donald Duck', 'mouse');
	

-- 4. Preview table
SELECT * FROM animals;


-- 5. Modify entry in species column to reflect the correct species for each animal
UPDATE animals
SET species = 'mouse'
WHERE id = 1 OR id = 2

UPDATE animals
SET species = 'duck'
WHERE id = 3;


-- 4. Preview table
SELECT * FROM animals;