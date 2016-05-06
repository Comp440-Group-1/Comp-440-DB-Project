-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Navin Row
-- Create date: May 4th 2016
-- Description:	Update Version Number
-- =============================================
CREATE PROCEDURE UpdateVersionNumber 
	-- Add the parameters for the stored procedure here
	@versionId int,
	@versionNumber varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
			UPDATE version SET versionNumber = @versionNumber WHERE versionId = @versionId
	END TRY
	BEGIN CATCH
			RAISERROR('Invalid Version Number',1,1);
	END CATCH
END
GO
