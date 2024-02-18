CREATE EXTENSION postgis;

CREATE TABLE Parks_Info (
    ID SERIAL PRIMARY KEY,
    ParkName VARCHAR(255),
    Facilities VARCHAR(255)
);
-- creates a table called Parks_Info, this table contains, a randomly generated ID for each item
-- The items are ParkName and Facilities

INSERT INTO Parks_Info (ParkName, Facilities) VALUES
('Central Park', 'Playground, Restroom, Picnic area'),
('Liberty Park', 'Restroom, Picnic area'),
('Riverside Park', 'Playground, Bike Path');
-- This then inserts data into each row, with the ParkNames, separated from the Facilities with a comma.

CREATE TABLE Parks (
    ParkID SERIAL PRIMARY KEY,
    ParkName VARCHAR(255)
);
-- This creates a new table called Parks with generated ids and includes the park names

CREATE TABLE Facilities (
    FacilityID SERIAL PRIMARY KEY,
    ParkID INT,
    FacilityName VARCHAR(255),
    FOREIGN KEY (ParkID) REFERENCES Parks(ParkID)
);
-- This command creates a new table called Facilities, ParkID is an INT this time because it connects the items in facilities to the parks in Parks

INSERT INTO Parks (ParkName)
SELECT DISTINCT ParkName FROM Parks_Info;

INSERT INTO Facilities (ParkID, FacilityName) VALUES
(3, 'Playground'),
(3, 'Restroom'),
(3, 'Picnic area'),
(2, 'Restroom'),
(2, 'Picnic area'),
(1, 'Playground'),
(1, 'Bike Path')
;

CREATE TABLE ParkFacilities (
    FacilityID SERIAL PRIMARY KEY,
    FacilityName VARCHAR(255)
);
--Creates a new table called ParkFacilities, with with generated ids and a faility name columns

INSERT INTO ParkFacilities (FacilityName)
Values ('Playground'), ('Restroom'), ('Picnic area'), ('Bike Path');

ALTER TABLE Facilities ADD COLUMN ParkFacilityID INT;
-- This alters the facilities table and adds a column of parkfacilityIDs

ALTER TABLE Facilities
ADD CONSTRAINT fk_parkfacilityid FOREIGN KEY (ParkFacilityID) REFERENCES ParkFacilities(FacilityID);
-- This alters the Facilities table again, this time matching the ids using the foreign key constraint

UPDATE Facilities
SET ParkFacilityID = (SELECT FacilityID FROM ParkFacilities WHERE FacilityName = Facilities.FacilityName);

-- Cleanup redundant columns
ALTER TABLE Facilities DROP COLUMN FacilityName;;

SELECT * FROM Parks;
--all of these display their respective tables.

SELECT * FROM Parks_Info; 

SELECT * FROM Facilities;

SELECT * FROM ParkFacilities;