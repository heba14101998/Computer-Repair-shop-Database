CREATE DATABASE  IF NOT EXISTS `computerrepairshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `computerrepairshop`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: computerrepairshop
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `computers`
--

DROP TABLE IF EXISTS `computers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computers` (
  `ComputerID` int NOT NULL AUTO_INCREMENT,
  `SerialNum` varchar(50) NOT NULL,
  `Make` varchar(50) NOT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `Descrption` varchar(255) DEFAULT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`ComputerID`),
  KEY `SerialNum` (`SerialNum`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `computers_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computers`
--

LOCK TABLES `computers` WRITE;
/*!40000 ALTER TABLE `computers` DISABLE KEYS */;
/*!40000 ALTER TABLE `computers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustNo` varchar(8) NOT NULL,
  `CustName` varchar(30) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `City` varchar(30) NOT NULL,
  `Contact` varchar(35) NOT NULL,
  `Internal` char(1) NOT NULL,
  `State` char(2) NOT NULL,
  `Zip` char(5) NOT NULL,
  `Phone` char(7) NOT NULL,
  PRIMARY KEY (`CustNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('C100','Football','Box 352200','Boulder','Mary Manager','Y','CO','80309','6857100'),('C101','Men\'s Basketball','Box 352400','Boulder','Sally Supervisor','Y','CO','80309','5431700'),('C103','Baseball','Box 352020','Boulder','Bill Baseball','Y','CO','80309','5431234'),('C104','Women\'s Softball','Box 351200','Boulder','Sue Softball','Y','CO','80309','5434321'),('C105','High School Football','123 AnyStreet','Louisville','Coach Bob','N','CO','80027','4441234');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `LastName` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `mobile` varchar(14) NOT NULL,
  `MI` char(1) DEFAULT NULL,
  `Email` varchar(75) DEFAULT NULL,
  `HTel` varchar(14) DEFAULT NULL,
  `AddressLine1` varchar(75) NOT NULL,
  `AddressLine2` varchar(75) DEFAULT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `ZIP` varchar(10) NOT NULL,
  `Extension` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `Fullname` (`LastName`,`FirstName`),
  KEY `ZIP` (`ZIP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposits` (
  `DepositNum` int NOT NULL AUTO_INCREMENT,
  `DepositDate` date NOT NULL,
  `Amount` int NOT NULL DEFAULT '0',
  `ItemNum` int NOT NULL,
  PRIMARY KEY (`DepositNum`),
  KEY `ItemNum` (`ItemNum`),
  CONSTRAINT `deposits_ibfk_1` FOREIGN KEY (`ItemNum`) REFERENCES `items` (`ItemNum`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `ItemNum` int NOT NULL AUTO_INCREMENT,
  `SerialNum` varchar(50) NOT NULL,
  `ShortName` varchar(75) NOT NULL,
  `Cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `NumInStock` smallint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ItemNum`),
  KEY `SerialNum` (`SerialNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PymentNum` int NOT NULL AUTO_INCREMENT,
  `PaymentDate` date NOT NULL,
  `Amount` int NOT NULL DEFAULT '0',
  `ItemNum` int NOT NULL,
  PRIMARY KEY (`PymentNum`),
  KEY `ItemNum` (`ItemNum`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`ItemNum`) REFERENCES `items` (`ItemNum`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairjobitems`
--

DROP TABLE IF EXISTS `repairjobitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairjobitems` (
  `ItemNum` int NOT NULL,
  `JobNum` int NOT NULL,
  `DateUsed` date DEFAULT NULL,
  `Quantity` int NOT NULL DEFAULT '1',
  `TotalCost` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ItemNum`,`JobNum`),
  KEY `JobNum` (`JobNum`),
  CONSTRAINT `repairjobitems_ibfk_1` FOREIGN KEY (`JobNum`) REFERENCES `repairjobs` (`JobNum`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `repairjobitems_ibfk_2` FOREIGN KEY (`ItemNum`) REFERENCES `items` (`ItemNum`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairjobitems`
--

LOCK TABLES `repairjobitems` WRITE;
/*!40000 ALTER TABLE `repairjobitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `repairjobitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairjobrepairmen`
--

DROP TABLE IF EXISTS `repairjobrepairmen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairjobrepairmen` (
  `JobNum` int NOT NULL,
  `RepairmenId` int NOT NULL,
  `DateStarted` date NOT NULL,
  `DateEnded` date NOT NULL,
  `TotalCost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Comment` text,
  PRIMARY KEY (`JobNum`,`RepairmenId`),
  KEY `RepairmenId` (`RepairmenId`),
  CONSTRAINT `repairjobrepairmen_ibfk_1` FOREIGN KEY (`RepairmenId`) REFERENCES `repairmen` (`RepairmanID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `repairjobrepairmen_ibfk_2` FOREIGN KEY (`JobNum`) REFERENCES `repairjobs` (`JobNum`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairjobrepairmen`
--

LOCK TABLES `repairjobrepairmen` WRITE;
/*!40000 ALTER TABLE `repairjobrepairmen` DISABLE KEYS */;
/*!40000 ALTER TABLE `repairjobrepairmen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairjobs`
--

DROP TABLE IF EXISTS `repairjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairjobs` (
  `JobNum` int NOT NULL AUTO_INCREMENT,
  `DateReceived` date NOT NULL,
  `DatetoReturn` date NOT NULL,
  `DateReturned` date NOT NULL,
  `RepairDetails` varchar(255) DEFAULT NULL,
  `LaborCost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `TotalCost` decimal(10,2) NOT NULL DEFAULT '0.00',
  `CustomerID` int NOT NULL,
  `ComputerID` int NOT NULL,
  PRIMARY KEY (`JobNum`),
  KEY `DateReceived` (`DateReceived`),
  KEY `DatetoReturn` (`DatetoReturn`),
  KEY `DateReturned` (`DateReturned`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ComputerID` (`ComputerID`),
  CONSTRAINT `repairjobs_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `repairjobs_ibfk_2` FOREIGN KEY (`ComputerID`) REFERENCES `computers` (`ComputerID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairjobs`
--

LOCK TABLES `repairjobs` WRITE;
/*!40000 ALTER TABLE `repairjobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `repairjobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairmen`
--

DROP TABLE IF EXISTS `repairmen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairmen` (
  `RepairmanID` int NOT NULL AUTO_INCREMENT,
  `LastName` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `mobile` varchar(14) NOT NULL,
  `MI` char(1) DEFAULT NULL,
  `Email` varchar(75) DEFAULT NULL,
  `HTel` varchar(14) DEFAULT NULL,
  `Extension` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`RepairmanID`),
  KEY `Fullname` (`LastName`,`FirstName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairmen`
--

LOCK TABLES `repairmen` WRITE;
/*!40000 ALTER TABLE `repairmen` DISABLE KEYS */;
/*!40000 ALTER TABLE `repairmen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairmenitems`
--

DROP TABLE IF EXISTS `repairmenitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairmenitems` (
  `ItemNum` int NOT NULL,
  `RepairmenId` int NOT NULL,
  `DateOrdered` date DEFAULT NULL,
  `Quantity` int NOT NULL DEFAULT '1',
  `TotalCost` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`ItemNum`,`RepairmenId`),
  KEY `RepairmenId` (`RepairmenId`),
  CONSTRAINT `repairmenitems_ibfk_1` FOREIGN KEY (`RepairmenId`) REFERENCES `repairmen` (`RepairmanID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `repairmenitems_ibfk_2` FOREIGN KEY (`ItemNum`) REFERENCES `items` (`ItemNum`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairmenitems`
--

LOCK TABLES `repairmenitems` WRITE;
/*!40000 ALTER TABLE `repairmenitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `repairmenitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'computerrepairshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-23  8:47:30
