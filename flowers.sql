-- flowers database
-- created at: 02/28/2021
-- author(s): Brandon Young, Stuart Griffin, Timothy Trusov

-- database creation and use

CREATE DATABASE flowers;

USE flowers;

DROP TABLE IF EXISTS Flowers;
	-- These are just placeholders above
-- tables creation satisfying all of the requirements
DROP TABLE IF EXISTS Zones;
	-- This is incase Zones already exists
CREATE TABLE Zones (
id INTEGER(2),
highestTemperature INTEGER,
categ VARCHAR(10),
delSize DOUBLE);
	-- This is a pretty general declaration of Zones, huh?
    -- Give this thing highestTemperature and lowestTemperature (make sure it can have negative sign)
	-- Give it ID integer (should be 2 digits), categ varchar(10) or 40 or something
	-- Then delSize Double I think.
    
DROP TABLE IF EXISTS Deliveries;

CREATE TABLE Deliveries(
id INTEGER(1),
categ VARCHAR(5),
delSize DOUBLE);
	-- (delivery id) id INTEGER, one digit only I think
    -- (delivery category)categ varchar (5) ONLY 5 CHAR
    -- (delivery size) delSize double I think, 5 Digit with three decimal, and can be null
    
DROP TABLE IF EXISTS FlowersInfo;

CREATE TABLE FlowersInfo(
id INTEGER(3),
commonName VARCHAR(30),
latinName VARCHAR(35),
coolZone INTEGER,
hotZone INTEGER,
categ VARCHAR(5),
sunNeeds VARCHAR(5));
	-- (id) id INTEGER, three digits
    -- (common name) commonName varchar(30)
    -- (latin name) latinName varchar(35)
    -- (coolest zone) coolZone varchar()? Nah, INTEGER, must match other tables' id's
    -- (hottest zone) hotZone varchar()? Nah, INTEGER, must match other tables' id's
    -- (delivery category) categ varchar(5)?
    -- (sun needs) sunNeeds varchar(5)

-- tables population

-- a) the total number of zones.

-- b) the number of flowers per cool zone.

-- c) common names of the plants that have delivery sizes less than 5.

-- d) common names of the plants that require full sun (i.e., sun needs contains ‘S’).

-- e) all delivery category names order alphabetically (without repetition).

-- f) the exact output (see instructions)

-- g) plant names that have the same hot zone as “Pink Caladiums” (your solution MUST get the hot zone of “Pink Caladiums” in a variable).

-- h) the total number of plants, the minimum delivery size, the maximum delivery size, and the average size based on the plants that have delivery sizes (note that the average value should be rounded using two decimals).

-- i) the Latin name of the plant that has the word ‘Eyed’ in its name (you must use LIKE in this query to get full credit).  

-- j) the exact output (see instructions)
