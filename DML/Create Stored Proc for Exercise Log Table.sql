USE [Gen_Exercise]
GO

--Intended to be an easier way to update the table
EXEC UpdateExerciseLog
	@Day_Id = 1,
	@Exercise_Id = 2,
	@Week_Id = 1,
	@Rep_Goal = 16,
	@Actual_Reps = 12,
	@Weight_Used = 150.00,
	@Date_Performed = '2018-08-08'

--Verify the record was added
SELECT * FROM dbo.Exercise_Log el
WHERE el.Date_Performed = '2018-08-08'