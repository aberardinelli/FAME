-- MySQL dump 10.16  Distrib 10.1.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: FAME
-- ------------------------------------------------------
-- Server version	10.1.34-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ACCOUNT_TYPE`
--

DROP TABLE IF EXISTS `ACCOUNT_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACCOUNT_TYPE` (
  `TypeName` varchar(7) NOT NULL,
  PRIMARY KEY (`TypeName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACCOUNT_TYPE`
--

LOCK TABLES `ACCOUNT_TYPE` WRITE;
/*!40000 ALTER TABLE `ACCOUNT_TYPE` DISABLE KEYS */;
INSERT INTO `ACCOUNT_TYPE` VALUES ('artist'),('manager');
/*!40000 ALTER TABLE `ACCOUNT_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARTIST`
--

DROP TABLE IF EXISTS `ARTIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARTIST` (
  `ArtistID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(40) NOT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `PhoneNumber` bigint(20) DEFAULT NULL,
  `Email` varchar(80) NOT NULL,
  `MailingAddress` varchar(80) DEFAULT NULL,
  `City` varchar(40) NOT NULL,
  `State` char(2) NOT NULL,
  `ZipCode` char(5) DEFAULT NULL,
  `UnderContract` tinyint(1) DEFAULT '0',
  `Recruiting` tinyint(1) DEFAULT '0',
  `ManagerID` int(11) NOT NULL,
  PRIMARY KEY (`ArtistID`),
  KEY `artistmanagerfk` (`ManagerID`),
  CONSTRAINT `artistmanagerfk` FOREIGN KEY (`ManagerID`) REFERENCES `MANAGER` (`ManagerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARTIST`
--

LOCK TABLES `ARTIST` WRITE;
/*!40000 ALTER TABLE `ARTIST` DISABLE KEYS */;
INSERT INTO `ARTIST` VALUES (1,'Joe','Idol','MALE',2168889999,'joeidolrox@gmail.com','123 E4th ST','Cleveland','OH','44113',0,0,4),(2,'Mary','Jane','FEMALE',3124336868,'mary.jane@gmail.com','1314 W21st ST','Chicago','IL','60608',0,0,2),(3,'Viktoria','Ale','FEMALE',4407125643,'viktoroiusly@hotmail.com','413 Alexander Ave','Amherst','OH','44001',0,0,1),(4,'Horos','Kornel','MALE',2134537860,'notpotionmasterhoros@yahoo.com','1503 E 77th Pl','Los Angelos','CA','9001',0,0,6),(5,'Sofia','Vsevolod','FEMALE',89023896740,'wontspellthisright@yahoo.com','828 E15th ST','Chicago','IL','60607',0,0,4),(6,'Gene','Frenkle','MALE',6789012349,'igotafever@gmail.com','2321 Chapmans Lane','Albuquerque','NM','87110',0,0,2),(7,'Milo','Eberhard','FEMALE',5807819024,'namedafteradog@yahoo.com','2552 Fieldcrest Road','New York','NY','10011',0,0,5),(8,'Ludis','Hippocrates','MALE',9087124098,'notaHippocrates@gmail.com','1967 West Street','Wyoming','MI','49509',0,0,7),(9,'Vulfgang','Biljana','MALE',1897892135,'BiljanaVulfgang@gmail.com','2092 Kinney Street','Springfield','MA','1103',0,0,3),(10,'Drina','Leo','FEMALE',3298245892,'LeDrina@yahoo.com','2652 Rockford Road','Worcester','MA','1608',0,0,1),(11,'Vincenza','Aristides','MALE',8453892348,'VinceAristides@hotmail.com','4065 Thompson Street','Los Angeles','CA','90017',0,0,2),(12,'Teo','Coco','MALE',1289239083,'NotCocoChannel@gmail.com','4296 River Road','Colorado Springs','CO','80918',0,0,5),(13,'Ruth','Fisher','FEMALE',8904658930,'thefisher@gmail.com','4364 Hart Ridge Road','Saginaw','MI','48607',0,0,4),(14,'Achille','Eef','MALE',5892492492,'achilleeef@yahoo.com','2604 Haul Road','Lindstrom','MN','55045',0,0,6),(15,'Halide','Prokopios','FEMALE',6794938933,'halideprokopios@gmail.com','772 Stratford Drive','Waipahu','HI','96797',0,0,6),(16,'Marganita','Gavril','FEMALE',6238942573,'GavrilMarganita@hotmail.com','4857 August Lane','Minden','LA','71055',0,0,4),(17,'Tiziano','Rosendo','MALE',7839939849,'RosendoTiziana@gmail.com','426 Geneva Street','New York','NY','10013',0,0,5),(18,'Elvira','Aaron','FEMALE',7176632783,'AaronElvira@yahoo.com','2138 Meadowbrook Mall Road','Manhattan Beach','CA','90266',0,0,2),(19,'Price','Sebastian','MALE',6583894390,'SebastianPrice@yahoo.com','4242 Metz Lane','Bedford','','1730',0,0,3),(20,'Mike','Williams','MALE',8148769089,'Mwilliams@gmail.com','837 E7th','Erie','PA','16506',0,0,3),(21,'Joel','Manhattan','FEMALE',7163749877,'jmanhattan@yahoo.com','567 wooland St.','Buffalo','NY','14546',0,0,5),(22,'Matthew ','Raider','MALE',5189383039,'mraider@yahoo.com','830 huffunton Dr.','Victor','NY','14872',0,0,7),(23,'Joesph','Blanton','MALE',3457890123,'jblanton23@gmail.com','490 johnson Lane','Buffalo','NY','32546',0,0,3),(24,'John','Steward','MALE',3726836744,'jstew345@gmail.com','7384 lakeview Dr.','Buffalo','NY','83928',0,0,1),(25,'Jack','Daniels','MALE',2910298762,'JD@gmail.com','845 newton Rd.','Seatle','WA','34567',0,0,2),(26,'Mary','Dean','FEMALE',7628299172,'mdean@gmail.com','567 turner Rd.','Chicago','IL','55687',0,0,5),(27,'Scott','Manor','MALE',2029282728,'smanor@yahoo.com','737 Hafner Dr.','San Diego','CA','23453',0,0,4),(28,'Dan','Lancaster','MALE',2817262812,'DLan@msn.com','344 Masters Blvd.','Washington','DC','45768',0,0,3),(29,'Tim','Kenajoski','MALE',1928762852,'TimKen@msn.com','526 Kimber Rd.','Jamestown','NY','39827',0,0,6),(30,'James','Slefer','MALE',9876654321,'jslefer@msn.com','412 Center Dr.','Buffalo','NY','14136',0,0,7),(31,'Sydney','Opinski','FEMALE',9687542612,'sopinski3@gmail.com','569 W 5th St.','Erie','PA','16065',0,0,2),(32,'Julia','Quinsty','FEMALE',8272638202,'JQ@gmail.com','77 Houser St.','Orlando','FL','78836',0,0,1),(33,'Dom','Castaro','MALE',2987624152,'dcastro@yahoo.com','34 jackbarrel Rd.','Tampa ','FL','74321',0,0,6),(34,'Marina','Flannery','FEMALE',2982725176,'mflannery@gmail.com','Berry St.','Louiville','KT','45362',0,0,4),(35,'Jacqulin','King','FEMALE',5468978782,'jking@gmail.com','Hyde Rd.','Jacksonville','FL','79854',0,0,3),(36,'Declan','Lonamon','MALE',9882655767,'dlong@yahoo.com','Multer St.','Phoenix','AR','87655',0,0,7),(37,'Robert','Kinston','MALE',7692657788,'rkingston@gmail.com','Kong Dr.','Kansas City','MO','59483',0,0,2),(38,'Patrick','Star','MALE',1237788445,'Pstar@msn.com','Bikinibottom','Under the Sea','FL','78366',0,0,5),(39,'Julien','Morris','MALE',5679087960,'jMorris@msn.com','Nickle St.','St. Cloud','MN','93028',0,0,1),(40,'Arthur','Camelot','MALE',6657683246,'ArthurofCamelot@msn.com','Broken Dreams Blvd.','Flint','MI','54837',0,0,7);
/*!40000 ALTER TABLE `ARTIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARTIST_CALENDAR`
--

DROP TABLE IF EXISTS `ARTIST_CALENDAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARTIST_CALENDAR` (
  `ArtistID` int(11) NOT NULL,
  `CalDate` date NOT NULL,
  `Available` tinyint(1) NOT NULL,
  PRIMARY KEY (`ArtistID`,`CalDate`),
  CONSTRAINT `calendar_artist_fk` FOREIGN KEY (`ArtistID`) REFERENCES `ARTIST` (`ArtistID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARTIST_CALENDAR`
--

LOCK TABLES `ARTIST_CALENDAR` WRITE;
/*!40000 ALTER TABLE `ARTIST_CALENDAR` DISABLE KEYS */;
/*!40000 ALTER TABLE `ARTIST_CALENDAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARTIST_INSTRUMENT`
--

DROP TABLE IF EXISTS `ARTIST_INSTRUMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARTIST_INSTRUMENT` (
  `InstrumentID` int(11) NOT NULL,
  `ArtistID` int(11) NOT NULL,
  PRIMARY KEY (`InstrumentID`,`ArtistID`),
  KEY `instrument_artist_artist_fk` (`ArtistID`),
  CONSTRAINT `instrument_artist_artist_fk` FOREIGN KEY (`ArtistID`) REFERENCES `ARTIST` (`ArtistID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instrument_artist_instrument_fk` FOREIGN KEY (`InstrumentID`) REFERENCES `INSTRUMENT` (`InstrumentID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARTIST_INSTRUMENT`
--

LOCK TABLES `ARTIST_INSTRUMENT` WRITE;
/*!40000 ALTER TABLE `ARTIST_INSTRUMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ARTIST_INSTRUMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSISTANT`
--

DROP TABLE IF EXISTS `ASSISTANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASSISTANT` (
  `AssistantID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(40) NOT NULL,
  `Email` varchar(80) NOT NULL,
  `PhoneNumber` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`AssistantID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSISTANT`
--

LOCK TABLES `ASSISTANT` WRITE;
/*!40000 ALTER TABLE `ASSISTANT` DISABLE KEYS */;
INSERT INTO `ASSISTANT` VALUES (1,'Arthur','Morgan','ArthurM01@gmail.com',8144345555),(2,'Javier','Sanchez','javierSanchez02@gmail.com',1152667832),(3,'Benjamin','Watson','BbenjaminWatson03@outlook.com',3421669990),(4,'Rose','O\'Malley','MohammedAli04@gmail.com',4642221846),(5,'Tom','Brady','TomBrady05@outlook.com',8816782221),(6,'Lewis','Brindley','LewisBrindley06@gmail.com',1516765890),(7,'Micheal','Victor','MikeyV054@outlook.com',2256757990);
/*!40000 ALTER TABLE `ASSISTANT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONTRACT`
--

DROP TABLE IF EXISTS `CONTRACT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONTRACT` (
  `ArtistID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `Royalty` decimal(6,5) NOT NULL,
  `Notes` blob,
  `Active` tinyint(1) DEFAULT '0',
  `Tentative` tinyint(1) DEFAULT '0',
  `Signed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ArtistID`,`StartDate`),
  CONSTRAINT `contract_artist_fk` FOREIGN KEY (`ArtistID`) REFERENCES `ARTIST` (`ArtistID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONTRACT`
--

LOCK TABLES `CONTRACT` WRITE;
/*!40000 ALTER TABLE `CONTRACT` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONTRACT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CUSTOMER`
--

DROP TABLE IF EXISTS `CUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMER` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(60) NOT NULL,
  `BillingAddress` varchar(80) NOT NULL,
  `BillingCity` varchar(40) NOT NULL,
  `BillingState` char(2) NOT NULL,
  `BillingZip` char(5) NOT NULL,
  `PhoneNumber` bigint(20) NOT NULL,
  `BillingContactFirstName` varchar(20) DEFAULT NULL,
  `BillingContactLastName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CUSTOMER`
--

LOCK TABLES `CUSTOMER` WRITE;
/*!40000 ALTER TABLE `CUSTOMER` DISABLE KEYS */;
INSERT INTO `CUSTOMER` VALUES (1,'Super Cash  Properties','389 Peach Street','Erie','PA','16504',8143157231,'Jake','Andrews'),(2,'Big Baller Properties','501 East 38th street','Erie','PA','16546',8141234567,'John','Smith'),(3,'Dunder Properties','48 Cranberry Road','Scranton','PA','18503',57016234567,'Dwight','Schrute'),(4,'Fast loan Estates','391 Sunset Blvd','Erie','PA','16504',8148328484,'Grace','Soto'),(5,'Wick Real Estate ','4764 Parade Blvd','Erie ','PA','16504',8144737382,'John ','Wick'),(6,'Myers Real Esate','462 State St','Erie ','PA','16504',8145652717,'Micheal ','Myers'),(7,'Mom and Pop Properties','24 Old Street','Grove City','Oh','16520',8147894561,'Tom','Greene'),(8,'Delicious Bowl Estates','500 West Street','Erie ','PA','16054',8145652666,'Rosa','Moore');
/*!40000 ALTER TABLE `CUSTOMER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EXPENSE`
--

DROP TABLE IF EXISTS `EXPENSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EXPENSE` (
  `ExpenseID` int(11) NOT NULL AUTO_INCREMENT,
  `ExpenseType` varchar(30) NOT NULL,
  `Amount` decimal(7,2) NOT NULL,
  `ExpenseDate` date NOT NULL,
  `AccountType` varchar(7) NOT NULL,
  `Notes` varchar(1000) DEFAULT NULL,
  `Settled` tinyint(1) DEFAULT '0',
  `ArtistID` int(11) DEFAULT NULL,
  `ManagerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ExpenseID`),
  KEY `expense_artist_fk` (`ArtistID`),
  KEY `expense_manager_fk` (`ManagerID`),
  CONSTRAINT `expense_artist_fk` FOREIGN KEY (`ArtistID`) REFERENCES `ARTIST` (`ArtistID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `expense_manager_fk` FOREIGN KEY (`ManagerID`) REFERENCES `MANAGER` (`ManagerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EXPENSE`
--

LOCK TABLES `EXPENSE` WRITE;
/*!40000 ALTER TABLE `EXPENSE` DISABLE KEYS */;
INSERT INTO `EXPENSE` VALUES (1,'Travel',425.59,'2018-08-01','artist','New York',1,30,NULL),(2,'Food',727.19,'2018-08-02','artist','wine bar',1,28,NULL),(3,'Phone',924.84,'2018-08-03','artist','verizon',1,16,NULL),(4,'CarRental',19.20,'2018-08-04','artist','hertz',1,8,NULL),(5,'Hotel',26.51,'2018-08-05','artist','Hilton',1,24,NULL),(6,'Entertainment',457.70,'2018-08-06','artist','concert',1,5,NULL),(7,'Entertainment',900.75,'2018-08-07','artist','movie',1,19,NULL),(8,'Entertainment',661.19,'2018-08-08','artist','movie',1,7,NULL),(9,'Entertainment',910.74,'2018-08-09','artist','concert',1,17,NULL),(10,'Entertainment',417.56,'2018-08-10','artist','fashion show',1,14,NULL),(11,'Entertainment',407.63,'2018-08-11','artist','fashion show',1,7,NULL),(12,'Hotel',901.64,'2018-08-12','artist','Double Tree',1,4,NULL),(13,'Hotel',300.77,'2018-08-13','artist','Double Tree',1,6,NULL),(14,'Travel',473.71,'2018-08-14','manager','Florida',1,NULL,3),(15,'Hotel',752.84,'2018-08-15','manager','Hilton',1,NULL,4),(16,'Advertisement',770.50,'2018-08-16','manager','Magazine',1,NULL,7),(17,'Food',587.42,'2018-08-17','manager','Snacks',1,NULL,6),(18,'Food',504.47,'2018-08-18','manager','Lunch',1,NULL,5),(19,'Travel',169.29,'2018-08-19','manager','Connecticut',1,NULL,7),(20,'Food',884.14,'2018-08-20','manager','Dinner',1,NULL,6),(21,'Food',813.91,'2018-08-21','manager','Dinner',1,NULL,7),(22,'Phone',147.84,'2018-08-22','artist','Sprint',1,19,NULL),(23,'Phone',155.32,'2018-08-23','artist','Sprint',1,30,NULL),(24,'Phone',45.84,'2018-08-24','artist','Sprint',1,40,NULL),(25,'Phone',322.01,'2018-08-25','manager','Sprint',1,NULL,2),(26,'Phone',533.14,'2018-08-26','manager','Verizon',0,NULL,3),(27,'CarRental',472.42,'2018-08-27','manager','ZipCar',1,NULL,6),(28,'CarRental',659.02,'2018-08-28','manager','ZipCar',0,NULL,7),(29,'CarRental',977.60,'2018-08-29','manager','ZipCar',1,NULL,4),(30,'CarRental',12.12,'2018-08-30','manager','ZipCar',1,NULL,2),(31,'Travel',823.74,'2018-08-31','manager','Arizona',0,NULL,4),(32,'Shopping',844.55,'2018-09-01','manager','Clothing',0,NULL,7),(33,'Shopping',175.03,'2018-09-02','artist','Equipment',0,27,NULL),(34,'Shopping',539.57,'2018-09-03','artist','Equipment',0,30,NULL),(35,'Shopping',284.74,'2018-09-04','artist','Equipment',0,30,NULL),(36,'Shopping',678.41,'2018-09-05','artist','Clothing',0,27,NULL),(37,'Advertisement',383.36,'2018-09-06','manager','Commercial',1,NULL,3),(38,'Entertainment',18.29,'2018-09-07','manager','movie',0,NULL,5),(39,'Entertainment',885.98,'2018-09-08','manager','concert',1,NULL,4),(40,'Entertainment',21.41,'2018-09-09','manager','bowling',0,NULL,2),(41,'Entertainment',342.06,'2018-09-10','manager','party',1,NULL,1),(42,'Entertainment',619.75,'2018-09-11','manager','party',1,NULL,5),(43,'Entertainment',358.60,'2018-09-12','manager','concert',1,NULL,3),(44,'Entertainment',999.36,'2018-09-13','manager','concert',1,NULL,3),(45,'Entertainment',140.00,'2018-09-14','manager','concert',1,NULL,7),(46,'Travel',819.25,'2018-09-15','manager','Washington',1,NULL,5),(47,'Entertainment',944.73,'2018-09-16','manager','concert',1,NULL,1),(48,'Entertainment',310.78,'2018-09-17','artist','movie',1,37,NULL),(49,'Entertainment',318.40,'2018-09-18','artist','concert',1,7,NULL),(50,'Entertainment',643.07,'2018-09-19','artist','bowling',1,28,NULL),(51,'Entertainment',347.63,'2018-09-20','artist','party',1,23,NULL),(52,'Entertainment',188.16,'2018-09-21','artist','party',1,3,NULL),(53,'Travel',827.37,'2018-09-22','artist','California',1,5,NULL),(54,'Entertainment',415.37,'2018-09-23','artist','concert',1,28,NULL),(55,'Entertainment',350.86,'2018-09-24','artist','movie',1,19,NULL),(56,'Entertainment',19.67,'2018-09-25','artist','concert',1,34,NULL),(57,'Entertainment',134.98,'2018-09-26','artist','bowling',1,4,NULL),(58,'Entertainment',113.67,'2018-09-27','artist','party',1,22,NULL),(59,'Entertainment',370.71,'2018-09-28','artist','party',0,26,NULL),(60,'Entertainment',350.19,'2018-09-29','artist','party',0,39,NULL),(61,'Entertainment',38.95,'2018-09-30','artist','party',0,18,NULL),(62,'Entertainment',294.39,'2018-10-01','artist','party',0,39,NULL),(63,'Entertainment',223.06,'2018-10-02','artist','party',0,36,NULL),(64,'Travel',223.44,'2018-10-03','artist','Spain',0,3,NULL),(65,'Entertainment',763.38,'2018-10-04','artist','movie',0,13,NULL),(66,'Entertainment',433.71,'2018-10-05','artist','concert',0,14,NULL),(67,'Entertainment',683.49,'2018-10-06','artist','party',0,34,NULL),(68,'Travel',601.74,'2018-10-07','artist','France',0,28,NULL),(69,'Hotel',736.12,'2018-10-08','artist','Hilton',0,6,NULL),(70,'Hotel',444.04,'2018-10-09','artist','Marriott',0,32,NULL),(71,'Hotel',998.69,'2018-10-10','artist','Marriott',0,19,NULL),(72,'Hotel',905.32,'2018-10-11','artist','Marriott',0,13,NULL),(73,'Security',37.48,'2018-10-12','manager','Security Detail',1,NULL,3),(74,'Security',72.56,'2018-10-13','manager','Party Security',1,NULL,7),(75,'Security',367.45,'2018-10-14','manager','Security Detail',1,NULL,5),(76,'Security',550.13,'2018-10-15','manager','Security Detail',1,NULL,5),(77,'Security',886.60,'2018-10-16','manager','Party Security',1,NULL,3),(78,'Travel',866.18,'2018-10-17','manager','Iceland',1,NULL,2),(79,'Security',551.19,'2018-10-18','manager','Party Security',1,NULL,2);
/*!40000 ALTER TABLE `EXPENSE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INSTRUMENT`
--

DROP TABLE IF EXISTS `INSTRUMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INSTRUMENT` (
  `InstrumentID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  PRIMARY KEY (`InstrumentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INSTRUMENT`
--

LOCK TABLES `INSTRUMENT` WRITE;
/*!40000 ALTER TABLE `INSTRUMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `INSTRUMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANAGER`
--

DROP TABLE IF EXISTS `MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MANAGER` (
  `ManagerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) NOT NULL,
  `LastName` varchar(40) NOT NULL,
  `Email` varchar(80) NOT NULL,
  `PhoneNumber` bigint(20) DEFAULT NULL,
  `Active` tinyint(1) NOT NULL DEFAULT '1',
  `AssistantID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ManagerID`),
  KEY `mgrfk` (`AssistantID`),
  CONSTRAINT `mgrfk` FOREIGN KEY (`AssistantID`) REFERENCES `ASSISTANT` (`AssistantID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANAGER`
--

LOCK TABLES `MANAGER` WRITE;
/*!40000 ALTER TABLE `MANAGER` DISABLE KEYS */;
INSERT INTO `MANAGER` VALUES (1,'John','Doe','JohnDoe01@gmail.com',8145279212,1,NULL),(2,'Rebecca','Smith','MattSmith02@gmail.com',4491234567,1,NULL),(3,'Richard','Dickson','RichardDickson03@outlook.com',7218654327,1,NULL),(4,'Kevin','Gibbins','KevinGibbin04@gmail.com',1112564091,1,NULL),(5,'Macrina','Matthews','RyanMatthews05@outlook.com',2341975463,1,NULL),(6,'Bob','Barker','BobBarker06@gmail.com',1631817263,1,NULL),(7,'Jacob','Simmons','JacobSimmons07@outlook.com',6198304981,1,NULL);
/*!40000 ALTER TABLE `MANAGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERFORMANCE`
--

DROP TABLE IF EXISTS `PERFORMANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERFORMANCE` (
  `PerformanceID` int(11) NOT NULL AUTO_INCREMENT,
  `Status` varchar(20) NOT NULL,
  `PerformanceDate` date NOT NULL,
  `PerformanceTime` time DEFAULT NULL,
  `Fee` decimal(8,2) NOT NULL,
  `Venue` int(11) NOT NULL,
  `InvoiceStatus` enum('Paid','Sent','Unpaid','Not Sent') DEFAULT NULL,
  PRIMARY KEY (`PerformanceID`),
  KEY `performancevenuefk` (`Venue`),
  KEY `perfstatusfk` (`Status`),
  CONSTRAINT `performancevenuefk` FOREIGN KEY (`Venue`) REFERENCES `VENUE` (`VenueID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `perfstatusfk` FOREIGN KEY (`Status`) REFERENCES `PERFORMANCE_STATUS` (`StatusName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERFORMANCE`
--

LOCK TABLES `PERFORMANCE` WRITE;
/*!40000 ALTER TABLE `PERFORMANCE` DISABLE KEYS */;
INSERT INTO `PERFORMANCE` VALUES (4,'Completed','2018-07-02','21:40:00',3355.13,4,'Paid'),(5,'Completed','2018-07-06','22:25:00',5186.12,15,'Paid'),(6,'Completed','2018-07-09','21:55:00',4077.75,25,'Paid'),(7,'Completed','2018-07-12','22:50:00',1150.54,28,'Paid'),(8,'Cancelled','2018-07-18','13:15:00',2020.63,28,'Unpaid'),(9,'Completed','2018-07-20','20:20:00',2125.74,28,'Paid'),(10,'Completed','2018-07-23','13:05:00',5078.73,10,'Paid'),(11,'Completed','2018-07-26','17:05:00',5328.89,4,'Paid'),(12,'Completed','2018-08-01','09:45:00',1234.98,25,'Unpaid'),(13,'Completed','2018-08-04','21:25:00',2818.18,11,'Paid'),(14,'Completed','2018-08-07','10:35:00',3126.38,7,'Paid'),(15,'Completed','2018-08-11','19:00:00',4609.22,10,'Paid'),(16,'Completed','2018-08-15','14:45:00',4173.64,6,'Unpaid'),(17,'Completed','2018-08-19','18:55:00',5683.05,21,'Paid'),(18,'Completed','2018-08-22','12:50:00',1421.52,6,'Paid'),(19,'Completed','2018-08-25','16:15:00',3667.62,27,'Paid'),(20,'Cancelled','2018-08-28','09:50:00',2947.22,18,'Paid'),(21,'Completed','2018-09-03','16:45:00',4881.87,23,'Paid'),(22,'Completed','2018-09-07','18:45:00',2161.77,29,'Paid'),(23,'Completed','2018-09-10','18:50:00',4420.45,15,'Paid'),(24,'Completed','2018-09-14','13:50:00',5604.02,15,'Unpaid'),(25,'Completed','2018-09-16','20:50:00',4664.23,28,'Paid'),(26,'Completed','2018-09-18','14:50:00',4446.25,27,'Paid'),(27,'Completed','2018-09-20','16:05:00',4274.99,24,'Paid'),(28,'Completed','2018-09-24','22:55:00',5164.42,10,'Paid'),(29,'Cancelled','2018-09-27','11:00:00',5477.63,17,'Paid'),(30,'Completed','2018-10-03','22:30:00',2929.38,5,'Unpaid'),(31,'Completed','2018-10-07','11:25:00',2466.88,10,'Paid'),(32,'Completed','2018-10-15','15:05:00',3737.98,10,'Paid'),(33,'Cancelled','2018-10-19','14:20:00',2671.74,18,'Paid'),(34,'Completed','2018-10-24','09:05:00',1097.45,23,'Paid'),(35,'Completed','2018-11-05','13:35:00',4555.32,19,'Unpaid'),(36,'Scheduled','2018-11-08','18:25:00',5912.04,9,'Unpaid'),(37,'Scheduled','2018-11-11','17:00:00',5663.63,18,'Unpaid'),(38,'Scheduled','2018-11-14','22:10:00',3788.78,4,'Unpaid'),(39,'Scheduled','2018-11-17','13:20:00',4918.15,28,'Unpaid'),(40,'Scheduled','2018-11-20','15:35:00',2206.91,25,'Unpaid'),(41,'Scheduled','2018-11-28','14:25:00',2294.25,15,'Unpaid'),(42,'Scheduled','2018-12-01','10:50:00',1077.49,1,'Unpaid'),(43,'Scheduled','2018-12-04','21:00:00',5468.06,24,'Unpaid'),(44,'Scheduled','2018-12-09','10:40:00',3710.81,26,'Unpaid'),(45,'Scheduled','2018-12-12','09:40:00',2059.23,14,'Unpaid'),(46,'Scheduled','2018-12-15','13:30:00',1895.20,13,'Unpaid'),(47,'Scheduled','2018-12-18','18:20:00',5609.44,3,'Unpaid'),(48,'Scheduled','2018-12-21','11:30:00',4343.91,24,'Unpaid'),(49,'Scheduled','2018-12-22','10:05:00',2661.49,25,'Unpaid'),(50,'Requested','2018-12-26','21:50:00',4103.89,12,'Unpaid'),(51,'Scheduled','2018-12-29','17:35:00',1135.05,13,'Unpaid');
/*!40000 ALTER TABLE `PERFORMANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERFORMANCE_ARTIST`
--

DROP TABLE IF EXISTS `PERFORMANCE_ARTIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERFORMANCE_ARTIST` (
  `PerformanceID` int(11) NOT NULL,
  `ArtistID` int(11) NOT NULL,
  PRIMARY KEY (`PerformanceID`,`ArtistID`),
  KEY `performance_artist_artist_fk` (`ArtistID`),
  CONSTRAINT `performance_artist_artist_fk` FOREIGN KEY (`ArtistID`) REFERENCES `ARTIST` (`ArtistID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `performance_artist_performance_fk` FOREIGN KEY (`PerformanceID`) REFERENCES `PERFORMANCE` (`PerformanceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERFORMANCE_ARTIST`
--

LOCK TABLES `PERFORMANCE_ARTIST` WRITE;
/*!40000 ALTER TABLE `PERFORMANCE_ARTIST` DISABLE KEYS */;
/*!40000 ALTER TABLE `PERFORMANCE_ARTIST` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PERFORMANCE_STATUS`
--

DROP TABLE IF EXISTS `PERFORMANCE_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PERFORMANCE_STATUS` (
  `StatusName` varchar(20) NOT NULL,
  PRIMARY KEY (`StatusName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PERFORMANCE_STATUS`
--

LOCK TABLES `PERFORMANCE_STATUS` WRITE;
/*!40000 ALTER TABLE `PERFORMANCE_STATUS` DISABLE KEYS */;
INSERT INTO `PERFORMANCE_STATUS` VALUES ('Cancelled'),('Completed'),('Requested'),('Scheduled');
/*!40000 ALTER TABLE `PERFORMANCE_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VENUE`
--

DROP TABLE IF EXISTS `VENUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VENUE` (
  `VenueID` int(11) NOT NULL AUTO_INCREMENT,
  `VenueName` varchar(60) NOT NULL,
  `VenueAddress` varchar(80) DEFAULT NULL,
  `VenueCity` varchar(40) NOT NULL,
  `VenueState` char(2) NOT NULL,
  `VenueZip` char(5) DEFAULT NULL,
  `SeatingCapacity` int(11) DEFAULT NULL,
  `StageCapacity` int(11) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `OwnerID` int(11) NOT NULL,
  PRIMARY KEY (`VenueID`),
  KEY `venueownerfk` (`OwnerID`),
  CONSTRAINT `venueownerfk` FOREIGN KEY (`OwnerID`) REFERENCES `CUSTOMER` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VENUE`
--

LOCK TABLES `VENUE` WRITE;
/*!40000 ALTER TABLE `VENUE` DISABLE KEYS */;
INSERT INTO `VENUE` VALUES (1,'Erie Dev','4843 Lost Creek Road','Philadelphia','PA','19103',2000,50,'Concert hall',4),(2,'Erie Inc','672 Pringle Drive','Chicago','IL','60606',2000,75,'Concert hall',7),(3,'Erie Rank','866 Upton Avenue','Monomouth','ME','4259',2000,73,'Concert hall',8),(4,'Erie Vine','336 Aaron Smith Drive','East Waterford','PA','17021',2000,57,'Concert hall',4),(5,'Ridge Erie','1658 Owen Lane','Grand Rapids','MI','49503',2000,65,'Concert hall',1),(6,'Inc Erie','4733 Burning Memory Lane','Doylestown ','PA','18901',2000,56,'Concert hall',2),(7,'Vine Erie','3637 Juniper Drive ','Saginaw ','MI','48607',2000,67,'Concert hall',3),(8,'Erie Ability ','505 Cost Avenue','Temple Hills ','MD','20031',2000,75,'Concert hall',5),(9,'Erie Industries','2997 Hewes Avenue ','Baltimore ','MD','21201',2000,59,'Concert hall',5),(10,'Erie Zoom','2898 Nutter Street ','Adrian ','MO','64720',2000,60,'Concert hall',5),(11,'Erie Rhino ','3089 Meadow Lane ','San Francisco ','CA','94103',2000,65,'Concert hall',6),(12,'Erie Bit ','4957 Jim Rosa Lane ','Oakland','CA','94612',2000,75,'Concert hall',8),(13,'Erie Able ','2247 Ritter Avenue ','Southfield','MI','48075',2000,74,'Concert hall',7),(14,'Erie Ink','4118 Valley Drive','Philadelphia','PA','19108',2000,65,'Concert hall',1),(15,'Erie Ment ','438 Berkley Street ','Philadelphia','PA','19108',2000,65,'Concert hall',2),(16,'Erie Gorilla ','2767 Harvest Lane','Sedalia ','MO','65301',2000,76,'Concert hall',5),(17,'Able Erie','2485 Jenna Lane','West Des Moines','IA','50266',2000,67,'Concert hall',3),(18,'Ridge Theater','667 Martha Ellen Drive ','Reno','NV','89501',500,75,'Theater',4),(19,'Rank Theater','391 Ferry Street ','Anniston ','AL','36201',500,67,'Theater',4),(20,'Vine Theater','3316 Broadway Street ','Moncks Corner','SC','29461',500,69,'Theater',1),(21,'Theater Industries','589 White Avenue','Corpus Christi','TX','78401',500,76,'Theater',7),(22,'Ex Theater','86 Thomas Street ','Northbrook','IL','60062',500,78,'Theater',8),(23,'Rhino Theater ','4505 Sunny Day Drive ','Anaheim ','CA','92805',500,65,'Theater',5),(24,'Theater Able ','4373 Broadway Avenue ','Johnson City ','TN','37601',500,63,'Theater',4),(25,'Theater Bit','3960 Bottom Lane','Lancaster','NY','14086',500,67,'Theater',5),(26,'Theater Ment ','3563 Skinner Hollow Road ','La Grande ','OR','87850',500,75,'Theater',2),(27,'Theater Gorilla','428 Stadium Drive ','Waltham ','MA','2154',500,77,'Theater',3),(28,'Key Bank Center','1 Seymour H Knox III Plaza ','Buffalo ','NY','14203',19200,200,'Stadium',3),(29,'New Era Field ','1 Bills Drive ','Orchard Park ','NY','14127',71870,350,'Stadium',3);
/*!40000 ALTER TABLE `VENUE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-08 12:15:20
