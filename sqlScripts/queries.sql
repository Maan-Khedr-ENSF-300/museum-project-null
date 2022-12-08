USE ARTSMUSEUM;

-- 1
SELECT K.CONSTRAINT_NAME, K.TABLE_NAME, T.TABLE_TYPE, K.COLUMN_NAME, C.COLUMN_TYPE, K.REFERENCED_TABLE_NAME, K.REFERENCED_COLUMN_NAME, trig.TRIGGER_NAME, trig.EVENT_MANIPULATION
FROM information_schema.KEY_COLUMN_USAGE as K
JOIN (SELECT TABLE_NAME, TABLE_TYPE, TABLE_ROWS, CREATE_TIME
FROM information_schema.tables
WHERE table_schema = 'artsmuseum') as T
ON K.TABLE_NAME = T.TABLE_NAME
LEFT JOIN (SELECT * FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'artsmuseum') as C
ON (K.TABLE_NAME = C.TABLE_NAME AND K.COLUMN_NAME = C.COLUMN_NAME)
LEFT JOIN (SELECT * FROM information_schema.triggers WHERE TRIGGER_SCHEMA = 'artsmuseum') as trig
ON K.TABLE_NAME = trig.EVENT_OBJECT_TABLE
WHERE CONSTRAINT_SCHEMA = 'artsmuseum';

-- 2
SELECT *
FROM art_objects;

-- 3
SELECT *
FROM borrowed
ORDER BY DateBorrowed;

-- 4
SELECT *
FROM art_objects
WHERE (ID_no) IN
(SELECT ID_no FROM painting);

-- 5
SELECT a.Artist, a.Exhibit, e.StartDate, e.EndDate
FROM art_objects as a
LEFT JOIN Exhibitions as e
ON a.Exhibit = e.Name;

-- 6
DROP TRIGGER IF EXISTS artsmuseum.is_valid_year;
DELIMITER $$

CREATE TRIGGER artsmuseum.is_valid_year
BEFORE UPDATE
ON art_objects FOR EACH ROW
BEGIN
	DECLARE minYear INT;
    DECLARE maxYear INT;
    SET @minYear = (SELECT BirthYear FROM art_objects JOIN artsmuseum.artist as a ON old.Artist = a.Name WHERE Artist = OLD.Artist);
    SET @maxYear = (SELECT DeathYear FROM art_objects JOIN artsmuseum.artist as a ON old.Artist = a.Name WHERE Artist = OLD.Artist);
                        
    IF (new.year > @maxYear) or (new.year < @minYear) THEN
        SIGNAL SQLSTATE '42500' 
            SET MESSAGE_TEXT = 'Art object must be between the years the artist was alive.';
    END IF;
END $$

DELIMITER ;

-- 7
DROP TRIGGER IF EXISTS artsmuseum.archiveCollections;
DELIMITER $$
CREATE TRIGGER artsmuseum.archiveCollections
BEFORE DELETE
ON collections FOR EACH ROW
BEGIN
	INSERT INTO collection_archives VALUES (OLD.Name, OLD.Type);
END $$

DELIMITER ;
