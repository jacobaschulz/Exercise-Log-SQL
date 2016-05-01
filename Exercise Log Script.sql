CREATE DATABASE GEN_EXERCISE

CREATE TABLE 

**************************
Create Exercise Table
**************************
CREATE TABLE [Dbo].[Exercises] (
[Exercise_Id] [int] PRIMARY KEY IDENTITY (1,1) NOT NULL,
[Exercise_Name] [varchar](40)
)

**************************
Insert values into Exercise table
**************************

INSERT INTO dbo.Exercises
(Exercise_Name) VALUES
('Bicep Curls'), 
('Chest Press'), 
('Squats'),
( 'Calf Raises'),
('Shoulder Press'),
('Back Rows'),
('Glute Bridge')

select * from Exercises

*********************
Create Days table
*********************
CREATE TABLE [dbo].[Days] (
[Day_Id] [int] PRIMARY KEY IDENTITY (1,1) NOT NULL,
[Day] [varchar](9))

**************************
Inserting into Days table
**************************

INSERT INTO dbo.Days 
(Day) VALUES 
('Monday'),
('Tuesday'),
('Wednesday'),
('Thursday'),
('Friday'),
('Saturday'),
('Sunday')

select * from Days

***********************
Create Exercise_Log table
***********************

CREATE TABLE [dbo].[Exercise_Log] (
[Entry_Id] [int] PRIMARY KEY IDENTITY (1,1) NOT NULL,
[Day_Id] [int] FOREIGN KEY References Days(Day_Id) NOT NULL,
[Exercise_Id] [int] FOREIGN KEY References Exercises(Exercise_Id) NOT NULL,
[Rep_Goal] [varchar](25),
[Actual_Reps] [varchar](25),
[Weight_Used] decimal (4,2),
[Date_Performed] [datetime])

**********************
Inserting into Exercise_Log
**********************

INSERT INTO Exercise_Log 
(Day_Id, Exercise_Id, Rep_Goal, Actual_Reps, Weight_Used, Date_Performed)
VALUES (1, 1, '5', '7', 25.00, GETDATE()),
(2, 2, '5', '7', 35.00, GETDATE()),
(3, 3, '7', '10', 45.00, GETDATE()),
(4, 4, '6', '8', 30.00, GETDATE()),
(5, 5, '11', '12', 40.00, GETDATE()),
(6, 6, '8', '9', 50.00, GETDATE()),
(7, 7, '9', '12', 60.00, GETDATE())





