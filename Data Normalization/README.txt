# *Database Normalization Assignment*

## *Objectives*
The objectives of this assignment were to gain a basic understanding of First and Second Normal Form (1NF and 2NF) as well as reenforcing basic practices of data normalization. This will be done by creating spatial tables that adhere to specific normalization rules. In this case the goal is to order and normalizing data about three parks and their respective facilities into different tables in repsects to the rules of 1NF and 2NF.
### *Introduction*
Data Normalization is a teqnique in database in database design for the purpose of breaking down large, complex datasets into smaller more manageable tables. This is done not only to make it easier for user expereince and mangement, but also to reduce redundancies and dependencies within the data itself. Essentially it is a way of sorting data into a neater and more efficent manner. Data Normalization is typically split into 4 different steps, for the purposes of this excercise, I only implemented the first two, 1NF and 2NF. 1NF is essentially making sure that all items within the dataset are indivisable and all carry a unique value. 2NF on the other hand is a continuation of this, first step, along with an elimination of partial dependencies. 
### *Tools*
PostgreSQL with PostGIS extension
pgAdmin (for database management)
Git (Hub and Bash)
### *Methods*
In the beginning, I created the table parks, using the command CREATE TABLE, which included randomly generated ids for three park names and attached to these names in a separate colum were shorts lists of all the facilities in that park. I used CREATE TABLE to create all four tables used in the assignment, along with this these commands included the column categories for each table and the command to generate ids for each item. These IDs are the primary keys for each table, assigning each item with a unique value. The Facilities column had multiple items per park, thus is divisible, so I created two tables, one with parks, which contained their unqique respective IDs and one with all the facilities with their respective new IDs. After this I implemented 2NF. I had to do this because in the Facilities table some of teh facilites were partially dependent on the IDs. To solve this, I created a new table for ParkFacilities. This table then included new IDs for individual facility names. I also realized at this point that the ParkIDs in the Facilities table did not align with the original ParkIDs in the original Parks table. I corrected this by populating the table, with columns with ParkIDs assigned to teh correct Facility names. I used the command INSERT INTO to populate tables with data this is also how I nitially populatied the Parks_Info table. I then needed to alter the Facilities table so that it could connect with the new ParkFacilities table. To do this I implemented what is known as a Foreign Key. This essentially connects a new table to the primary key of another. In this case, Facilities FacilityID is now connected to ParkFacilitiesID. Lastly I removed the redundant FacilityName column from the FacilitiesTable as this purpose was now being served by the ParkFacilitiesTable.
## *Conculsion*
In the end I have four differnt tables. The first, Parks_Info contains the original data as it was put into the database. The latter three essentially are that original dataset seperated and sorted into a more manageable and readable data normalization. This process, while confusing at certain points is very useful at "unclogging" the redundancies in data. In this process I had some difficulty conceptualizing the processes at play, such as how foreign keys connect primary keys of some tables to others. The syntax of the final couple commands as well, I do not fully understand, sucha s the use of fk_ after the ADD CONSTRAINT command. Overall though, I feel this has been a good introduction to data normalization and more practice will be needed for a streamlining of the process on an individual level.