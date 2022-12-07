USE ARTSMUSEUM;

-- 1
SELECT K.CONSTRAINT_NAME, K.TABLE_NAME, T.TABLE_TYPE, K.COLUMN_NAME, C.COLUMN_TYPE, K.REFERENCED_TABLE_NAME, K.REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE as K
JOIN (SELECT TABLE_NAME, TABLE_TYPE, TABLE_ROWS, CREATE_TIME
FROM information_schema.tables
WHERE table_schema = 'artsmuseum') as T
ON K.TABLE_NAME = T.TABLE_NAME
LEFT JOIN (SELECT * FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'artsmuseum') as C
ON (K.TABLE_NAME = C.TABLE_NAME AND K.COLUMN_NAME = C.COLUMN_NAME)
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
