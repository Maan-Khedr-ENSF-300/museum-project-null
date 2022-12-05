-- DROP DATABASE IF EXISTS ARTSMUSEUM;
-- CREATE DATABASE ARTSMUSEUM;
USE ARTSMUSEUM;

DROP TABLE IF EXISTS ART_OBJECTS;
CREATE TABLE ART_OBJECTS(
    ID_no               VARCHAR(40) NOT NULL,
    Artist              VARCHAR(100),
    Year                INT,
    Title               VARCHAR(100),
    Description         VARCHAR(500),
    CountryOfOrigin     VARCHAR(40),
    Epoch               VARCHAR(40),
    PRIMARY KEY (ID_no)

);

DROP TABLE IF EXISTS PAINTING;
CREATE TABLE PAINTING(
    ID_no               VARCHAR(40) NOT NULL,
    PaintType           VARCHAR(50),
    DrawnOn             VARCHAR(50),
    Style               VARCHAR(50),
    PRIMARY KEY (ID_no),
    FOREIGN KEY (ID_no) REFERENCES ART_OBJECTS(ID_no)
);
