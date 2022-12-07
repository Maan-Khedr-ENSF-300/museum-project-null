DROP DATABASE IF EXISTS ARTSMUSEUM;
CREATE DATABASE ARTSMUSEUM;
USE ARTSMUSEUM;

CREATE TABLE ARTIST(
    Name                VARCHAR(50) NOT NULL,
    BirthYear           YEAR,
    DeathYear           YEAR,
    CountryOfOrigin     VARCHAR(50),
    Epoch               VARCHAR(50),
    MainStyle           VARCHAR(50),
    Description         VARCHAR(500),
    PRIMARY KEY (Name)
);

INSERT INTO ARTIST(Name, BirthDate, DeathDate, CountryofOrigin, Epoch, Mainstyle, Description)
VALUES
('Benedetto da Rovezzano', 1474 , 1554, 'Italian', 'Renaissance', 'Sculptor', 'Italian architect and sculptor who worked mainly in Florence.')
('Michiel Sittow', 1468, 1525, 'Estonian','Early Netherlandish', 'Painting, portraits','For most of his life, Sittow worked as a court portrait painter, for Isabella of Castile, the Habsburgs and other prominent royal houses in Spain and Netherlands.'),
('Samuel van Hoogstraten',1627, 1678, 'Dutch,Dordrecht', 'Golden Age', 'Painting', 'Specialized in the quodlibet(Latin for “whatever you please”), a seemingly random assortment of objects that typically contains verbal and visual criticism about art, artists, patrons, and politics.'),
('David Drake', 1801, 1870, 'American','Anno Domini','Stonework',NULL),
('Lucas de Heere',1534,1584,'Netherlandish,Grent','Renaissance','Painting','Went to France where he was employed by Catherine de Medici designing Gobelins tapestry'),
('Louise-Elisabeth Vigee-Le Brun', 1755, 1842, 'France', '18th century', 'Painting,Portraits', 'French portrait painter, especially of women. Her artistic style is generally considered part of the aftermath of Rococo with elements od an adopted Neoclassical style.'),
('Jean Antoine Houdon', 1741, 1828, 'France', 'American Revolution','Sculptor, Portrait of Louise Brongniart the dauther of the architect Alexander Theodore Brongniart'),
('Francois Barois',1656, 1726, 'France','Anno Domini','Sculptor','Barois was among the large team of sculptors delivering decorative vases and other sculptural elements for the gardens of Versailles');

CREATE TABLE EXHIBITIONS(
    Name                VARCHAR(50) NOT NULL,
    StartDate           DATE,
    EndDate             DATE,
    PRIMARY KEY (Name)
);

('The Tudors: Art and Majesty in Renaissance England', October 10 2022, January 8,2023),
('Cubism and the Trompe I’Oeil Tradition',October 20 2022, January 22, 2023),
('Hear Me Now: The Black Potters of Old Edgefield, South Carolina', September 9 2022, February 5, 2023),
('Figure of the artist, Richelieu', September 26 2019, June 30 2021 ),
('Sculptor of the Englightenment, Los Angeles', November 4 2003, January 25 2004),
('Babylon, Napoleon, Temporary Exhibition under the pyramid', March 14 2008, June 2 2008),
('Champollion the path of hieroglyphs, Louve-Lens', September 28 2022, January 16 2023);

CREATE TABLE ART_OBJECTS(
    ID_no               VARCHAR(40) NOT NULL,
    Artist              VARCHAR(100),
    Year                YEAR,
    Title               VARCHAR(100),
    Description         VARCHAR(500),
    CountryOfOrigin     VARCHAR(40),
    Epoch               VARCHAR(40),
    Exhibit             VARCHAR(50),
    PRIMARY KEY (ID_no),
    FOREIGN KEY (Exhibit) REFERENCES EXHIBITIONS(Name),
    FOREIGN KEY (Artist) REFERENCES ARTIST(Name)

);

INSERT INTO ART_OBJECTS(ID_no, Artist, Year, Title, Description, CountryofOrigin, Epoch, Exhibit)
VALUES
('1','Benedetto da Rovezzano',1524-29,'Angel Bearing Candlestick','Bronze angels nearing candlesticks. Bronzes statuettes of this kind were often housed alongside antique examples by wealthy collectors.', 'Italian', 'Renaissance', 'The Tudors: Art and Majesty in Renaissance England'),
('2','Michiel Sittow',1514,'Mary Tudor, Later Queen of France and Duchess of Suffolk','Portrait Painting of Mary Tudor','Estonian', '2nd Millennium','The Tudors: Art and Majesty in Renaissance England'),
('3','Samuel van Hoogstraten',1666-1678,'Trompe I’Oeil Still Life','This conceit required marvelous fidelity to the textures and scale of the items depicted, even so, the frame proclaims the entirety to be a painting.','Dutch, Dordrecht','Anno Domini','Cubism and the Trompe I’Oeil Tradition'),
('4','David Drake',1853,'Jug','Manufactured by Stony Bluff Manufactory','American','Victorian Era','Hear Me Now: The Black Potters of Old Edgefield, South Carolina'),
('5','Lucas de Heere',1595-1600,'Allegory of the Tudor Dynasty','Displays Henry VIII, the founder of the Church of England, passing the sword of justice to the Protestant Edward VI.','Netherlandish, Grent','English Reformation','The Tudors: Art and Majesty in Renaissance England'),
('6','Louise-Elisabeth Vigee-Le Brun',1786,'Madame Vigee-Le Brun and her daughter, Jeanne-Lucie-Louise,known as Julie','Portrait of Madame Vigee-Le Brun holding her daughter','France','4th quarter of the 18th century','Figure of the artist,Richelieu'),
('7','Jean Antoine Houdon',1777,'Louise Brongniart daughter of the architect Alexandre Theodore Brongniart', 'France','American Revolution','Sculptor of the Englightenment, Los Angeles'),
('8','David Drake', 1866,'Fragment','Manufactured by Stony Bluff Manufactory','American','Common Era','Hear Me Now: The Black Potters of Old Edgefield, South Carolina'),
('9', NULL, 1792,'stele','DecorLShamash; Hammurabi; inscription','Iraq','1st dynasty of BabylonLhammurabi', 'Babylon, Napoleon, Temporary Exhibition under the pyramid'),
('10','Francois Barois',1700,'Dying Cleopatra','Sculpture Portait of Cleopatra','France','Enlightenment','Champollion the path of hieroglyphs, Louve-Lens');

CREATE TABLE PAINTING(
    ID_no               VARCHAR(40) NOT NULL,
    PaintType           VARCHAR(50),
    DrawnOn             VARCHAR(50),
    Style               VARCHAR(50),
    PRIMARY KEY (ID_no),
    FOREIGN KEY (ID_no) REFERENCES ART_OBJECTS(ID_no)
);

INSERT INTO PAINTING(ID_no, PaintType, DrawnOn, Style)
VALUES
('2','Oil','Panel','portrait'),
('3','Oil','Canvas','illusion/abstract'),
('6', 'Oil', 'Wood', 'portrait');

CREATE TABLE STATUE(
    ID_no               VARCHAR(40) NOT NULL,
    Material            VARCHAR(50),
    Height              INT,
    Weight              INT,
    Style               VARCHAR(50),
    PRIMARY KEY (ID_no),
    FOREIGN KEY (ID_no) REFERENCES ART_OBJECTS(ID_no)
);

INSERT INTO STATUE (ID_no, Material, Height, Weight, Style)
VALUES
('1','Bronze', 101, 141, 'Portrait'),
('7', 'terracotta, white marble', 46, 89, 'Portrait');

CREATE TABLE SCULPTURE(
    ID_no               VARCHAR(40) NOT NULL,
    Material            VARCHAR(50),
    Height              INT,
    Weight              INT,
    Style               VARCHAR(50),
    PRIMARY KEY (ID_no),
    FOREIGN KEY (ID_no) REFERENCES ART_OBJECTS(ID_no)
);

INSERT INTO SCULPTURE(ID_no, Material, Height, Weight, Style)
VALUES
('9', 'basalt',225,184,'Inscribed stele'),
('10','marble',49,103,'Portrait,Sculpture');

CREATE TABLE OTHER(
    ID_no               VARCHAR(40) NOT NULL,
    Type                VARCHAR(50),
    Style               VARCHAR(50),
    PRIMARY KEY (ID_no),
    FOREIGN KEY (ID_no) REFERENCES ART_OBJECTS(ID_no)
);

INSERT INTO OTHER(ID_no,Type,Style)
VALUES
('4','Stoneware','Jug'),
('5','Prints','Engraving on Paper'),
('8','Soneware','Fragment');

CREATE TABLE PERMANENT_COLLECTION(
    ID_no               VARCHAR(40) NOT NULL,
    DateAquired         DATE,
    Status              VARCHAR(50),
    Cost                DECIMAL(13, 2),
    PRIMARY KEY (ID_no),
    FOREIGN KEY (ID_no) REFERENCES ART_OBJECTS(ID_no)
);

INSERT INTO PERMANENT_COLLECTION(ID_no, DateAcquired, Status, Cost)
VALUES
('1',January 5 2019, 'on display', 10000),
('2',November 28 2008, 'on display', 15800),
('3',June 16 2012,'on loan', 26000 ),
('4',December 10 2013,'stored', 60000),
('5',February 18 2018, 'on loan',5800),
('8',May 30 2004, 'stored', 5500);

CREATE TABLE COLLECTIONS(
    Name                VARCHAR(50) NOT NULL,
    Type                VARCHAR(50),
    Description         VARCHAR(500),
    Address             VARCHAR(50),
    Phone               VARCHAR(20),
    ContactPerson       VARCHAR(50),
    PRIMARY KEY (Name)
);

INSERT INTO COLLECTIONS(Name, Type, Description, Address, Phone, ContactPerson)
VALUES
('The Art of Portraiture', 'museum','Explore portraiture through the ages with sculptures, paintings, drawings and engravings od emblematic figures.','Rue de Rivoli, 75001 Paris, France','33 1 40 20 50 50', 'Louis Le Vau'),
('Masterpieces of the Louvre','museum','Artworks essential to history and the history of art, masterpieces bear witness to the wealth of the Louvres collections and the wide range of artistics practices used around the world.','Rue de Rivoli, 75001 Paris, France','33 (0)1 40 20 51 77', 'Michel Laclotte'),
('Queen, Kings, and Emperors','museum','Objects associated with the Coronation to statues and portraits, kings, queens and emperors succeeded in imposing their image on people through the arts','Rue de Rivoli, 75001 Paris, France','33 (0)1 40 20 51 77', 'Pierre Lescot');

CREATE TABLE BORROWED(
    ID_no               VARCHAR(40) NOT NULL,
    CollectionName      VARCHAR(50) NOT NULL,
    DateBorrowed        DATE,
    DateReturned        DATE,
    PRIMARY KEY (ID_no),
    FOREIGN KEY (ID_no) REFERENCES ART_OBJECTS(ID_no),
    FOREIGN KEY (CollectionName) REFERENCES COLLECTIONS(Name)
);

INSERT INTO BORROWED (ID_no, CollectionName, DateBorrowed, DateReturned)
VALUES
('6','The Art of Partraiture', January 24 2019, April 28 2019),
('7','The Art of Partraiture', September 15 2021, December 15 2022),
('9','Masterpieces of the Louvre', October 30 2016, January 30 2017),
('10','Queen, Kings, and Emperors', May 2 2010, August 31 2012);