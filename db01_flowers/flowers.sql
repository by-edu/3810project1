-- flowers database
-- created at: 02/28/2021
-- author(s): Stuart Griffin, Brandon Young, Timothy Trusov

-- database creation and use

CREATE DATABASE flowers;

USE flowers;

DROP TABLE IF EXISTS Flowers;
	-- These are just placeholders above
-- tables creation satisfying all of the requirements
DROP TABLE IF EXISTS Zones;
	-- This is incase Zones already exists
CREATE TABLE Zones(
  Zone_id smallint Primary Key,
  lowestTemperature smallint Not null,
  highestTemperature smallint Not null
);
Insert into Zones(
  Zone_id, lowestTemperature, highestTemperature
) Values (2,-50,-40);
Insert into Zones(
  Zone_id, lowestTemperature, highestTemperature
) Values (3,-40,-30);
Insert into Zones(
  Zone_id, lowestTemperature, highestTemperature
) Values (4,-30,-20);
Insert into Zones(
  Zone_id, lowestTemperature, highestTemperature
) Values (5,-20,-10);
Insert into Zones(
  Zone_id, lowestTemperature, highestTemperature
) Values (6,-10,-0);
Insert into Zones(
  Zone_id, lowestTemperature, highestTemperature
) Values (7,0,10);
Insert into Zones(
  Zone_id, lowestTemperature, highestTemperature
) Values (8,10,20);
Insert into Zones(
  Zone_id, lowestTemperature, highestTemperature
) Values (9,20,30);
Insert into Zones(
  Zone_id, lowestTemperature, highestTemperature
) Values (10,30,40);
	-- This is a pretty general declaration of Zones, huh?
    -- Give this thing highestTemperature and lowestTemperature (make sure it can have negative sign)
	-- Give it ID integer (should be 2 digits), categ varchar(10) or 40 or something
	-- Then delSize Double I think.

DROP TABLE IF EXISTS Deliveries;

CREATE TABLE Deliveries(
  delivery_id smallint Primary Key,
  category varchar(5) Not null,
  delSize decimal(5,3)
);
Insert into Deliveries Values (1,'pot', 1.5);
Insert into Deliveries Values (2,'pot', 2.25);
Insert into Deliveries Values (3,'pot', 2.625);
Insert into Deliveries Values (4,'pot', 4.25);
Insert into Deliveries Values (5,'plant', null);
Insert into Deliveries Values (6,'bulb', null);
Insert into Deliveries Values (7,'hedge', 18);
Insert into Deliveries Values (8,'shrub', 24);
Insert into Deliveries Values (9,'tree', 36);
	-- (delivery id) id INTEGER, one digit only I think
    -- (delivery category)categ varchar (5) ONLY 5 CHAR
    -- (delivery size) delSize double I think, 5 Digit with three decimal, and can be null

DROP TABLE IF EXISTS FlowersInfo;

CREATE TABLE FlowersInfo(
  flowers_id int Primary Key,
  commonName varchar(30) Not null,
  latinName varchar(35) Not null,
  coolZone smallint Not null references Zones(zone_id),
  hotZone smallint Not null references Zones(zone_id),
  delivery_id smallint not null references Deliveries(delivery_id),
  sunNeeds varchar(5) Not null
);
Insert into FlowersInfo Values (101, 'Lady Fern', 'Atbyrium filix-femina', 2, 9, 5, 'SH');
Insert into FlowersInfo Values (102, 'Pink Caladiums', 'C.x bortulanum', 10, 10, 6, 'PtoSH');
Insert into FlowersInfo Values (103, 'Lily-of-the-Valley', 'Convallaria majalis', 2, 8, 1, 'SH');
Insert into FlowersInfo Values (105, 'Purple Liatris', 'Liatris spicata', 3, 9, 6, 'StoP');
Insert into FlowersInfo Values (106, 'Black Eyed Susan', 'Rudbeckia fulgida var. specios', 4, 10, 2, 'StoP');
Insert into FlowersInfo Values (107, 'Nikko Blue Hydrangea', 'Hydrangea macrophylla', 5, 9, 4, 'StoSH');
Insert into FlowersInfo Values (110, 'Lombardy Poplar', 'Populus nigra Italica', 3, 9, 9, 'S');
Insert into FlowersInfo Values (111, 'Purple Leaf Plum Hedge', 'Prunus x xistena', 2, 8, 7, 'S');
Insert into FlowersInfo Values (114, 'Thorndale Ivy', 'Hedera belix Thorndale', 3, 9, 1, 'StoSH');


	-- (id) id INTEGER, three digits
    -- (common name) commonName varchar(30)
    -- (latin name) latinName varchar(35)
    -- (coolest zone) coolZone varchar()? Nah, INTEGER, must match other tables' id's
    -- (hottest zone) hotZone varchar()? Nah, INTEGER, must match other tables' id's
    -- (delivery category) categ varchar(5)?
    -- (sun needs) sunNeeds varchar(5)

-- tables population

-- a) the total number of zones.
select count(*) as num_zones from zones;
-- b) the number of flowers per cool zone.
select coolZone,count(*) num_flowers from FlowersInfo group by coolZone;
-- c) common names of the plants that have delivery sizes less than 5.
select commonName from FlowersInfo fi join Deliveries d on (fi.delivery_id=d.delivery_id) where d.delSize <5;
-- d) common names of the plants that require full sun (i.e., sun needs contains ‘S’).
select commonName from FlowersInfo where sunNeeds like '%S%';
-- e) all delivery category names order alphabetically (without repetition).
select distinct category from Deliveries order by 1;
-- f) the exact output (see instructions)
select fi.commonName name, zc.lowestTemperature "Cool Zone (low)", zc.highestTemperature "Cool Zone (high)", d.category "Delivery Category"
from FlowersInfo fi join Zones zc on (fi.coolZone=zc.zone_id)
join Deliveries d on (fi.delivery_id=d.delivery_id) order by name;

-- c. and d. are alias so you don't have to write them completely

-- g) plant names that have the same hot zone as “Pink Caladiums” (your solution MUST get the hot zone of “Pink Caladiums” in a variable).
select commonName from FlowersInfo where hotZone in (select hotZone from FlowersInfo where commonName='Pink Caladiums')
and commonName !='Pink Caladiums';
-- h) the total number of plants, the minimum delivery size, the maximum delivery size, and the average size based on the plants that have delivery sizes (note that the average value should be rounded using two decimals).
select count(*) Total, min(d.delSize) "Min", max(d.delSize) "Max", round(avg(d.delSize),2) "Average"
from FlowersInfo fi join Deliveries d on (fi.delivery_id=d.delivery_id)
where d.delSize is not null;

-- fi. and d. are alias or placeholders so you don't have write out complete topics

-- i) the Latin name of the plant that has the word ‘Eyed’ in its name (you must use LIKE in this query to get full credit).
select latinName from FlowersInfo where commonName like '%Eyed%';
-- j) the exact output (see instructions)
select d.category Category, fi.commonName Name
from FlowersInfo fi join Deliveries d on (fi.delivery_id=d.delivery_id) order by Category, Name;
-- fi. and d. are placeholders or aliases
