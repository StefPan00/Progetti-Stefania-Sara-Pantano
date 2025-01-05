/* Esercizio finale secondo modulo SQL*/
/* TASK 2 Descrivi la struttura delle tabelle che reputi utili e sufficienti a modellare lo scenario proposto tramite la sintassi DDL. 
Implementa fisicamente le tabelle utilizzando il DBMS SQL Server(o altro)*/

CREATE SCHEMA SSP_ToysGroup; -- Creazione dello schemas 
USE SSP_ToysGroup;

-- Creazione della tabella Category
CREATE TABLE Category (
CategoryKey INT NOT NULL,
CategoryName VARCHAR(50) NOT NULL,
Description VARCHAR(300),
CONSTRAINT PK_Category PRIMARY KEY (CategoryKey));


-- Creazione della tabella Product
CREATE TABLE Product (
ProductKey INT NOT NULL,
ProductName VARCHAR(100) NOT NULL,
CategoryKey INT, 
Price DECIMAL(10, 2) NOT NULL,
Description VARCHAR(300),
CONSTRAINT PK_Product PRIMARY KEY (ProductKey),
CONSTRAINT FK_CategoryKey FOREIGN KEY (CategoryKey) REFERENCES Category(CategoryKey));

-- Creazione della tabella Region
CREATE TABLE Region (
RegionKey INT NOT NULL,
RegionName VARCHAR(100) NOT NULL,
CONSTRAINT PK_Region PRIMARY KEY (RegionKey));


-- Creazione tabella Country
CREATE TABLE Country (
CountryKey INT NOT NULL,
CountryName VARCHAR(50) NOT NULL,
RegionKey INT,
CONSTRAINT PK_Country PRIMARY KEY (CountryKey),
CONSTRAINT FK_RegionKey FOREIGN KEY (RegionKey) REFERENCES Region(RegionKey));
    
-- Creazione della tabella Sales
CREATE TABLE Sales (
SalesOrderNumber CHAR(7) NOT NULL,
SalesOrderLineNumber INT NOT NULL,
ProductKey INT,
CountryKey INT,
Date_transaction DATE NOT NULL,
Quantity INT,
TotalAmount DECIMAL(10, 2),
CONSTRAINT PK_Sales PRIMARY KEY (SalesOrderNumber, SalesOrderLineNumber),
CONSTRAINT FK_ProductKey FOREIGN KEY (ProductKey) REFERENCES Product(ProductKey),
CONSTRAINT FK_CountryKey FOREIGN KEY (CountryKey) REFERENCES Country(CountryKey));


/* TASK 3 POPOLAZIONE TABELLE*/
-- popolazione tabella Category
INSERT INTO Category (CategoryKey, CategoryName, Description)
VALUES
    (1, 'Action Figures', 'Toy figures representing characters'),
    (2, 'Board Games', 'Games played on a board for multiple players'),
    (3, 'Educational Toys', 'Toys that promote learning and development'),
    (4, 'Dolls', 'Dolls and doll accessories for children'),
    (5, 'Outdoor Toys', 'Toys designed for outdoor play');


SELECT * 
FROM Category;

-- Popolazione tabella Product
INSERT INTO Product (ProductKey, ProductName, CategoryKey, Price, Description)
VALUES 
(1,'Superhero Action Figure',1,15.99,'A dynamic figure with superpowers for imaginative battles.'),
(2,'Fantasy Warrior Figure',1,12.49,'A detailed warrior in mystical armor for epic adventures.'),
(3,'Robotic Action Hero',1,19.99,'A futuristic robot with movable parts and sounds for tech-savvy play.'),
(4,'Ninja Stealth Fighter',1,13.50,'A stealthy ninja figure with weapons for covert missions.'),
(5,'Comic Superhero Kit',1,25.99,'A complete set with a mask, cape, and accessories for superhero play.'),
(6,'Army Commander Set',1,17.75,'An army commander figure with vehicles and weapons for military strategies.'),
(7,'Knight in Armor',1,14.99,'A classic knight figure ready for medieval battles.'),
(8,'Classic Monopoly',2,18.00,'A board game of buying, trading, and building properties.'),
(9,'Chess Set',2,20.50,'A strategic game for two players to develop critical thinking.'),
(10,'Ludo Adventure Game',2,15.75,'A colorful game where players race to reach home.'),
(11,'Galactic Strategy Game',2,29.99,'A space-themed game focused on alliances and strategy.'),
(12,'War of Realms',2,21.00,'A fantasy game where players compete for dominance in mythical realms.'),
(13,'Trading Empire Game',2,10.49,'A strategy game for building a trade empire.'),
(14,'Magical Quest',2,26.99,'A board game with quests and puzzles for magical rewards.'),
(15,'Alphabet Learning Blocks',3,22.75,'Colorful blocks to help teach the alphabet.'),
(16,'Animal Sound Book',3,19.99,'An interactive book that plays animal sounds.'),
(17,'Shapes and Colors Set',3,24.99,'A vibrant set for hands-on learning about shapes and colors.'),
(18,'Build and Learn Set',3,27.50,'A construction set promoting creativity and problem-solving.'),
(19,'Musical Instrument Kit',3,18.99,'A collection of kid-friendly instruments for musical exploration.'),
(20,'Fashionista Doll',4,16.49,'A stylish doll with outfits for creative dress-up play.'),
(21,'Baby Care Doll',4,11.25,'A lifelike baby doll for nurturing and caregiving.'),
(22,'Fairy Princess Doll',4,13.50,'A fairy doll with sparkling wings for magical adventures.'),
(23,'Historical Queen Doll',4,26.50,'A queen doll dressed in period attire for imaginative play.'),
(24,'Sports Champion Doll',4,22.00,'An athletic doll celebrating sports and teamwork.'),
(25,'Fantasy Mermaid Doll',4,14.99,'A vibrant mermaid doll ready for underwater fun.'),
(26,'Modern City Doll',4,20.25,'A contemporary doll reflecting urban life.'),
(27,'Fantasy Creature Doll',4,9.99,'A unique creature doll to inspire magical adventures.'),
(28,'Classic Beauty Doll',4,15.49,'An elegant doll perfect for storytelling.'),
(29,'Traditional Bride Doll',4,16.00,'A bride doll in a classic gown for wedding-themed play.'),
(30,'Flying Disc',5,12.50,'A lightweight disc for outdoor throwing fun.'),
(31,'Inflatable Ball',5,18.99,'A colorful ball for active beach or backyard games.'),
(32,'Giant Bouncing Ball',5,15.49,'A large ball providing endless outdoor entertainment.'),
(33,'Water Splash Toy',5,19.75,'A fun toy for splashing during summer.'),
(34,'Kite Adventure',5,21.99,'A colorful kite for soaring fun outdoors.'),
(35,'Mini Golf Set',5,17.50,'A portable set bringing mini-golf to your home.'),
(36,'Basketball Hoop',5,20.99,'A hoop for practicing shots and developing skills.'),
(37,'Space Rocket Model Kit',3,13.75,'A kit to build a detailed rocket for STEM learning.'),
(38,'Nature Explorer Set',3,18.50,'A kit with binoculars and a magnifying glass for outdoor adventures.'),
(39,'Magic Wand Learning Stick',3,23.00,'A learning tool with magic-themed activities.'),
(40,'Word and Spell Puzzle',3,7.99,'A puzzle game promoting literacy and spelling skills.'),
(41,'Color Recognition Puzzle',3,10.99,'A puzzle to help children learn colors and matching.'),
(42,'History Explorer Board Game',2,12.75,'A game teaching about historical events and figures.'),
(43,'Treasure Hunt Adventure',2,6.50,'A treasure hunt game with clues to solve.'),
(44,'Wordsmith Challenge',2,8.99,'A word game to create words and improve vocabulary.'),
(45,'Space Expedition Game',2,16.99,'A game where players travel through space on missions.'),
(46,'Ninja Attack Game',2,13.99,'A fast-paced game with stealth missions.'),
(47,'Rock Climber Figure',1,9.49,'A climber figure for adventurous outdoor play.'),
(48,'Sci-Fi Alien Figure',1,19.99,'An alien figure for imaginative cosmic adventures.'),
(49,'Detective Action Hero',1,24.99,'A detective figure with tools for solving mysteries.'),
(50,'Planet Defender Figure',1,28.99,'A hero figure focused on protecting planets.'),
(51,'Warrior Princess',1,15.25,'A fierce princess figure ready for action.'),
(52,'Musical Rock Guitar',3,12.75,'A toy guitar for kids to explore music.'),
(53,'Wildlife Rescue Kit',3,8.50,'A playset for rescuing animals and promoting kindness.'),
(54,'Numbers and Counting Blocks',3,7.25,'Colorful blocks to teach counting and math skills.'),
(55,'Treasure Island Puzzle',3,21.50,'A puzzle depicting a treasure island for problem-solving fun.'),
(56,'Glow-in-the-Dark Space Puzzle',3,18.25,'A glow-in-the-dark puzzle for space-themed adventures.'),
(57,'Space Command Playset',1,22.99,'A playset with figures and vehicles for space exploration.'),
(58,'Princess Playhouse',4,14.99,'A playhouse set for royal adventures and storytelling.'),
(59,'Little Doctor Kit',3,16.75,'A medical kit for role-playing as a doctor.');

SELECT *
FROM Product;


-- popolazione tabella Region
INSERT INTO Region (RegionKey, RegionName)
VALUES 
(1,'Southern Europe'),
(2,'Northern Europe'),
(3,'Western Europe'),
(4,'North America'),
(5,'South America'),
(6,'East Asia'),
(7,'South Asia'),
(8,'East Africa'),
(9,'Southern Africa'),
(10,'West Africa'),
(11,'North Africa'),
(12,'Australia/Oceania'),
(13,'Southeast Asia'),
(14,'Eastern Europe'),
(15,'Middle East'),
(16,'Central Asia');

SELECT *
FROM Region;

-- popolazione tabella Country
INSERT INTO Country (CountryKey, CountryName, RegionKey)
VALUES
(1,'Italy',1),
(2,'Germany',2),
(3,'France',3),
(4,'Switzerland',3),
(5,'Spain',1),
(6,'Canada',4),
(7,'USA',4),
(8,'Mexico',4),
(9,'Brazil',5),
(10,'Argentina',5),
(11,'Chile',5),
(12,'Japan',6),
(13,'China',6),
(14,'South Korea',6),
(15,'India',7),
(16,'Pakistan',7),
(17,'Bangladesh',7),
(18,'Kenya',8),
(19,'South Africa',9),
(20,'Nigeria',10),
(21,'Egypt',11),
(22,'Morocco',11),
(23,'Australia',12),
(24,'New Zealand',12),
(25,'Fiji',12),
(26,'Indonesia',13),
(27,'Malaysia',13),
(28,'Thailand',13),
(29,'Vietnam',13),
(30,'Philippines',13),
(31,'Russia',2),
(32,'Ukraine',14),
(33,'Poland',14),
(34,'Czech Republic',14),
(35,'Hungary',14),
(36,'Romania',14),
(37,'Turkey',15),
(38,'Iran',15),
(39,'Saudi Arabia',15),
(40,'United Arab Emirates',15),
(41,'Iraq',15),
(42,'Jordan',15),
(43,'Lebanon',15),
(44,'Syria',15),
(45,'Mongolia',6),
(46,'Kazakhstan',16),
(47,'Uzbekistan',16),
(48,'Tajikistan',16),
(49,'Kyrgyzstan',16),
(50,'Afghanistan',16),
(51,'Barbados',5),
(52,'Cuba',5);

SELECT *
FROM Country;


-- popolazione tabella Sales
INSERT INTO Sales (SalesOrderNumber , SalesOrderLineNumber, ProductKey ,CountryKey ,Date_transaction ,Quantity ,TotalAmount)
VALUES
('SO43659',1,43,29,'2024-4-4',1,6.50),
('SO43659',2,39,46,'2024-4-5',2,46.00),
('SO43659',3,45,44,'2024-4-6',9,152.91),
('SO43659',4,1,41,'2024-4-7',7,111.93),
('SO43659',5,54,12,'2024-4-8',2,14.50),
('SO43659',6,6,11,'2024-1-9',4,71.00),
('SO43659',7,37,7,'2024-1-10',7,96.25),
('SO43659',8,20,44,'2024-1-11',10,164.90),
('SO43659',9,56,28,'2024-1-12',10,182.50),
('SO43659',10,18,3,'2024-1-13',8,200.00),
('SO43659',11,9,11,'2024-1-14',3,61.50),
('SO43659',12,13,48,'2024-4-15',5,52.45),
('SO43660',1,16,52,'2024-4-16',2,39.98),
('SO43660',2,40,16,'2024-4-17',10,79.90),
('SO43661',1,13,41,'2023-4-18',8,83.92),
('SO43661',2,35,46,'2023-4-19',1,17.50),
('SO43661',3,5,26,'2023-4-20',7,181.93),
('SO43661',4,21,23,'2023-4-21',10,112.50),
('SO43661',5,54,42,'2023-4-22',4,29.00),
('SO43661',6,23,43,'2023-4-23',1,26.50),
('SO43661',7,4,23,'2023-4-24',7,94.50),
('SO43661',8,27,40,'2023-4-25',4,39.96),
('SO43661',9,43,31,'2021-4-26',5,32.50),
('SO43661',10,6,22,'2021-4-27',6,106.50),
('SO43661',11,37,52,'2021-4-28',9,123.75),
('SO43661',12,57,13,'2021-4-29',7,160.93),
('SO43661',13,8,16,'2021-4-30',2,36.00),
('SO43661',14,37,27,'2021-2-1',2,27.50),
('SO43661',15,31,2,'2021-2-2',5,94.95),
('SO43662',1,18,47,'2021-2-3',9,247.50),
('SO43662',2,43,41,'2021-2-4',2,13.00),
('SO43662',3,28,16,'2021-2-5',6,92.94),
('SO43662',4,46,17,'2021-5-6',9,125.91),
('SO43662',5,41,47,'2021-2-7',10,109.90),
('SO43662',6,54,2,'2021-5-8',8,58.00),
('SO43662',7,31,48,'2021-5-9',8,151.92),
('SO43662',8,18,43,'2022-5-10',3,82.50),
('SO43662',9,36,43,'2022-5-11',9,188.91),
('SO43662',10,49,51,'2022-5-12',4,99.96),
('SO43662',11,39,35,'2022-5-13',5,115.00),
('SO43662',12,8,50,'2022-5-14',3,54.00),
('SO43662',13,2,47,'2022-5-15',8,99.92),
('SO43662',14,32,27,'2022-3-16',8,123.92),
('SO43662',15,35,18,'2022-3-17',8,140.00),
('SO43662',16,10,38,'2022-3-18',2,31.50),
('SO43662',17,33,22,'2022-3-19',5,98.75),
('SO43662',18,20,34,'2022-3-20',8,131.92),
('SO43662',19,37,20,'2020-3-21',8,110.00),
('SO43662',20,40,13,'2020-5-22',10,79.90),
('SO43662',21,18,31,'2020-5-23',10,275.00),
('SO43662',22,53,8,'2020-5-24',7,59.50),
('SO43663',1,6,16,'2020-5-25',1,17.75),
('SO43664',1,41,9,'2020-5-26',1,10.99),
('SO43664',2,29,31,'2020-5-27',5,80.00),
('SO43664',3,48,22,'2020-5-28',4,79.96),
('SO43664',4,42,27,'2021-5-29',8,102.00),
('SO43664',5,44,1,'2021-5-30',4,35.96),
('SO43664',6,2,37,'2021-5-31',4,49.96),
('SO43664',7,30,1,'2021-6-1',7,87.50),
('SO43664',8,50,43,'2023-6-2',5,144.95),
('SO43665',1,52,48,'2023-6-3',6,76.50),
('SO43665',2,18,14,'2023-6-4',8,220.00),
('SO43665',3,5,22,'2023-6-5',2,51.98),
('SO43665',4,52,35,'2023-10-6',3,38.25),
('SO43665',5,25,13,'2023-10-7',8,119.92),
('SO43665',6,24,6,'2023-10-8',2,44.00),
('SO43665',7,2,11,'2022-10-9',3,37.47),
('SO43665',8,18,6,'2020-10-10',4,110.00),
('SO43665',9,10,29,'2021-10-11',5,78.75),
('SO43665',10,4,27,'2020-10-12',2,27.00),
('SO43666',1,50,41,'2022-10-13',6,173.94),
('SO43666',2,16,42,'2023-10-14',10,199.90),
('SO43666',3,43,42,'2024-6-15',2,13.00),
('SO43666',4,37,29,'2024-6-16',4,55.00),
('SO43666',5,4,50,'2024-11-17',10,135.00),
('SO43666',6,48,32,'2021-11-18',7,139.93),
('SO43667',1,42,34,'2021-11-19',10,127.50),
('SO43667',2,57,43,'2021-11-20',8,183.92),
('SO43667',3,5,27,'2021-11-21',3,77.97),
('SO43667',4,18,11,'2021-11-22',2,55.00),
('SO43668',1,35,18,'2021-11-23',7,122.50),
('SO43668',2,21,4,'2022-11-24',10,112.50),
('SO43668',3,9,1,'2022-11-25',3,61.50),
('SO43668',4,28,32,'2022-11-26',7,108.43),
('SO43668',5,56,17,'2022-11-27',2,36.50),
('SO43668',6,34,4,'2022-12-28',7,153.93),
('SO43668',7,38,22,'2022-12-29',2,37.00),
('SO43668',8,3,38,'2022-12-30',8,159.92),
('SO43668',9,49,17,'2021-12-1',10,249.90),
('SO43668',10,43,43,'2020-12-2',3,19.50),
('SO43668',11,33,50,'2021-12-3',2,39.50),
('SO43668',12,26,13,'2021-12-4',2,40.50),
('SO43668',13,41,25,'2021-12-5',5,54.95),
('SO43668',14,1,45,'2021-1-6',2,31.98),
('SO43668',15,10,21,'2021-2-7',6,94.50),
('SO43668',16,58,15,'2021-12-8',4,59.96),
('SO43668',17,57,25,'2021-12-9',9,206.91),
('SO43668',18,35,47,'2021-12-10',9,157.50),
('SO43668',19,10,48,'2021-12-11',1,15.75),
('SO43668',20,21,40,'2021-12-12',2,22.50);

SELECT * 
FROM sales;


