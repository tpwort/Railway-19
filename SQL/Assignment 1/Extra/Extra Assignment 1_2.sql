-- Create database Fresher Training Management
DROP DATABASE IF EXISTS TrainingManagement;
CREATE DATABASE 		TrainingManagement;
USE 					TrainingManagement;

-- create table  Fresher Training Management
DROP TABLE IF EXISTS  	Trainee;
CREATE TABLE  			Trainee (
Trainee_ID   		SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
Full_Name			NVARCHAR(50) NOT NULL,
Birth_Date			DATE NOT NULL,
Gender				ENUM('male', 'female', 'unknown') DEFAULT('male') NOT NULL,
ET_IQ				TINYINT UNSIGNED CHECK(ET_IQ>=0 AND ET_IQ<=20) NOT NULL,
ET_Gmath			TINYINT UNSIGNED CHECK(ET_Gmath>=0 AND ET_Gmath<=20) NOT NULL,
ET_English			TINYINT UNSIGNED CHECK(ET_English>=0 AND ET_English<=20) NOT NULL,
Training_Class		VARCHAR(30) NOT NULL,
Evaluation_Notes 	NVARCHAR(1000)
);

ALTER TABLE Trainee
ADD COLUMN VTI_Account VARCHAR(50) UNIQUE KEY NOT NULL;

-- Exercise 2
CREATE TABLE `Table 2`(
ID				MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`Name`			VARCHAR(50),
`Code`			CHAR(5),
ModifiedDate 	DATETIME DEFAULT(now())
);

-- Exercise 3
CREATE TABLE `Table 3`(
ID				MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`Name`			VARCHAR(50),
BirthDate		DATE,
Gender 			BIT ,
IsDeletedFlag 	BIT DEFAULT 1
);