USE [Gen_Exercise]
GO

--Needed to increase the precision for Weight_Used
ALTER TABLE dbo.Exercise_Log ALTER COLUMN Weight_Used DECIMAL(6, 2);
GO

--Creating a stored proc to be able to add the data to the table in an easier fashion
CREATE PROCEDURE UpdateExerciseLog
	@Day_Id smallint,
	@Exercise_Id int,
	@Week_Id int,
	@Rep_Goal smallint,
	@Actual_Reps smallint,
	@Weight_Used decimal(6,2), --Was initially decimal (4,2), but used ALTER PROCEDURE to update the precision
	@Date_Performed date
AS
INSERT INTO [dbo].[Exercise_Log]
           ([Day_Id]
           ,[Exercise_Id]
           ,[Week_Id]
           ,[Rep_Goal]
           ,[Actual_Reps]
           ,[Weight_Used]
           ,[Date_Performed])
     VALUES
           (@Day_Id
           ,@Exercise_Id
           ,@Week_Id
           ,@Rep_Goal
           ,@Actual_Reps
           ,@Weight_Used
           ,@Date_Performed)
GO