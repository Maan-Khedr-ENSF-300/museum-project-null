DROP DATABASE IF EXISTS ARTSMUSEUM;
CREATE DATABASE ARTSMUSEUM;
USE ARTSMUSEUM;

CREATE TABLE ART_OBJECTS(
    ID_no               VARCHAR(40) NOT NULL,
    Artist              VARCHAR(100),
    Year                YEAR,
    Title               VARCHAR(100),
    Description         VARCHAR(500),
    CountryOfOrigin     VARCHAR(40),
    Epoch               VARCHAR(40),
    PRIMARY KEY (ID_no)

);

CREATE TABLE PAINTING(
    ID_no               VARCHAR(40) NOT NULL,
    PaintType           VARCHAR(50),
    DrawnOn             VARCHAR(50),
    Style               VARCHAR(50),
    PRIMARY KEY (ID_no),
    FOREIGN KEY (ID_no) REFERENCES ART_OBJECTS(ID_no)
);

CREATE TABLE STATUE(
    ID_no               VARCHAR(40) NOT NULL,
    Material            VARCHAR(50),
    Height              INT,
    Weight              INT,
    Style               VARCHAR(50),
    PRIMARY KEY (ID_no),
    FOREIGN KEY (ID_no) REFERENCES ART_OBJECTS(ID_no)
);


CREATE TABLE SCULPTURE(
    ID_no               VARCHAR(40) NOT NULL,
    Material            VARCHAR(50),
    Height              INT,
    Weight              INT,
    Style               VARCHAR(50),
    PRIMARY KEY (ID_no),
    FOREIGN KEY (ID_no) REFERENCES ART_OBJECTS(ID_no)
);


CREATE TABLE OTHER(
    ID_no               VARCHAR(40) NOT NULL,
    Type                VARCHAR(50),
    Style               VARCHAR(50),
    PRIMARY KEY (ID_no),
    FOREIGN KEY (ID_no) REFERENCES ART_OBJECTS(ID_no)
);

CREATE TABLE PERMANENT_COLLECTION(
    ID_no               VARCHAR(40) NOT NULL,
    DateAquired         DATE,
    Status              VARCHAR(50),
    Cost                DECIMAL(13, 2),
    PRIMARY KEY (ID_no),
    FOREIGN KEY (ID_no) REFERENCES ART_OBJECTS(ID_no)
);

CREATE TABLE BORROWED(
    ID_no               VARCHAR(40) NOT NULL,
    CollectionName      VARCHAR(50) NOT NULL,
    DateBorrowed        DATE,
    DateReturned        DATE,
    PRIMARY KEY (ID_no),
    FOREIGN KEY (ID_no) REFERENCES ART_OBJECTS(ID_no)
);

CREATE TABLE COLLECTIONS(
    Name                VARCHAR(50) NOT NULL,
    Type                VARCHAR(50),
    Description         VARCHAR(500),
    Address             VARCHAR(50),
    Phone               VARCHAR(20),
    ContactPerson       VARCHAR(50),
    PRIMARY KEY (Name)
);

-- ALTER TABLE COLLECTIONS
-- ADD foreign key (Name) references BORROWED(CollectionName);


CREATE TABLE EXHIBITIONS(
    Name                VARCHAR(50) NOT NULL,
    StartDate           DATE,
    EndDate             DATE,
    PRIMARY KEY (Name)
);

CREATE TABLE ARTIST(
    Name                VARCHAR(50) NOT NULL,
    BirthDate           DATE,
    DeathDate           DATE,
    CountryOfOrigin     VARCHAR(50),
    Epoch               VARCHAR(50),
    MainStyle           VARCHAR(50),
    Description         VARCHAR(500),
    PRIMARY KEY (Name)
)