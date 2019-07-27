/************************************
--Author: Jacob Schulz
--Function: This script will create and add all data to the Exercise_Log database.
--Execution: You can run this in its entirety by clicking the 'Execute' button.
--Last Modified: 2018-05-15 19:37
*************************************/

/*******************************
First, use the master database
*******************************/
USE master
GO

/*******************************
Create the Gen_Exercise Database
*******************************/
CREATE DATABASE Exercise_Log
GO

/***************************************************
Use the Exercise_Log databse to add objects and data
***************************************************/
USE Exercise_Log
GO

/***************************
Creating the Exercise table
***************************/
CREATE TABLE dbo.Exercises
(
	Exercise_Id INT PRIMARY KEY IDENTITY (1,1),
	Exercise_Name VARCHAR(40),
	CONSTRAINT UN_ExerciseName UNIQUE (Exercise_Name)
)
GO

/***************************************
Inserting values into the Exercise table
***************************************/
INSERT INTO dbo.Exercises
(Exercise_Name) 
VALUES
	('Bicep Curls'), 
	('Chest Press'), 
	('Squats'),
	( 'Calf Raises'),
	('Shoulder Press'),
	('Back Rows'),
	('Glute Bridge'),
	('Reverse Lunges'),
	('Underhand Pull Ups'),
	('Neutral Grip Pull Ups'),
	('Split Squats'),
	('Goblet Squats')
GO

/**********************
Creating the Days table
**********************/
CREATE TABLE dbo.Days
(
	Day_Id SMALLINT PRIMARY KEY IDENTITY (1,1),
	Day VARCHAR(9)
)
GO

/**********************
Inserting into Days table
**********************/
INSERT INTO dbo.Days 
(Day) VALUES 
	('Monday'),
	('Tuesday'),
	('Wednesday'),
	('Thursday'),
	('Friday'),
	('Saturday'),
	('Sunday')
GO

/**********************
Create Exercise_Log table
**********************/
CREATE TABLE dbo.Exercise_Log
(
	Entry_Id INT PRIMARY KEY IDENTITY (1,1),
	Day_Id SMALLINT,
	Exercise_Id INT,
	Week_Id INT,
	Rep_Goal SMALLINT,
	Actual_Reps SMALLINT,
	Weight_Used DECIMAL (4,2),
	Date_Performed DATE,
	CONSTRAINT FK_DayId FOREIGN KEY (Day_Id) 
		REFERENCES DAYS(Day_ID),
	CONSTRAINT FK_Exercise_Id FOREIGN KEY (Exercise_Id) 
		REFERENCES Exercises(Exercise_Id)
)
GO

/**********************
Inserting into Exercise_Log
**********************/
INSERT INTO dbo.Exercise_Log 
(Day_Id, Exercise_Id, Week_Id, Rep_Goal, Actual_Reps, Weight_Used, Date_Performed)
VALUES 
	(1, 1, 1, 5, 7, 25.00, GETDATE()), --GETDATE() gets the current date and time
	(2, 2, 1, 5, 6, 35.00, GETDATE()),
	(3, 3, 1, 8, 9, 45.00, GETDATE()),
	(4, 4, 1, 6, 8, 30.00, GETDATE()),
	(5, 5, 1, 11,12, 40.00, GETDATE()),
	(6, 6, 1, 8, 9, 50.00, GETDATE()),
	(7, 7, 1, 9, 12, 60.00, GETDATE()),
	(1, 1, 2, 8, 10, 30.00, GETDATE()),
	(2, 2, 2, 6, 8, 35.00, GETDATE()),
	(3, 3, 2, 8, 9, 45.00, GETDATE()),
	(4, 4, 2, 10, 10, 35.00, GETDATE()),
	(5, 5, 2, 10, 11, 45.00, GETDATE()),
	(6, 6, 2, 9, 10, 50.00, GETDATE()),
	(7, 7, 2, 10, 11, 60.00, GETDATE())
GO

/**********************
Creation of Weeks table
**********************/
CREATE TABLE dbo.Weeks
(
	Week_Id INT PRIMARY KEY IDENTITY (1,1),
	Week_Number INT NOT NULL
)
GO

/**********************
Inserting into Weeks Table
**********************/
INSERT INTO dbo.Weeks
(Week_Number)
VALUES 
(1),(2),(3),(4),(5),(6),(7)
GO


/*******************************************************
Function:
Joins the Exercises, Exercise_Log and Days table to view
the exercise names, days, rep goals, actual reps the 
weight used and the date it was performed.
********************************************************/
SELECT 
	D.Day,
	E.Exercise_Name,
	EL.Rep_Goal,
	EL.Actual_Reps,
	EL.Weight_Used,
	EL.Date_Performed
FROM Days AS D
	INNER JOIN Exercise_Log AS EL
		ON D.Day_Id = EL.Day_Id
	INNER JOIN Exercises AS E
		ON EL.Exercise_Id = E.Exercise_Id
GO

/********************************************
Function:
Creates a virtual table (a view), helping 
the user identify the exercise, actual reps
weight used and date performed in accordance
with the week number.
********************************************/

CREATE VIEW vOverview 
AS
SELECT 
	Week_Id, 
	Exercise_Id, 
	Actual_Reps, 
	Weight_Used, 
	Date_Performed
FROM Exercise_Log
GO

/**********************************
Using aggregate functions to pull 
the max reps and weight for the week.
***********************************/

SELECT 
	MAX(Actual_Reps) As Max_Reps,
	MAX(Weight_Used) AS Max_Weight,
	Week_Id
FROM Exercise_Log
GROUP BY 
	Actual_Reps, 
	Weight_Used, 
	Week_Id
GO

/*******************************
Use the master database if you'd
like to drop Exercise_Log
*******************************/
USE master
GO
