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
-- Description:	Select product name from product table
-- =============================================
CREATE PROCEDURE SelectProductName 
	-- Add the parameters for the stored procedure here
	@productId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	BEGIN TRY
		SELECT productName FROM product WHERE @productId = productId
	END TRY
	BEGIN CATCH
		RAISERROR('Unable to retrieve product name',1,1);
	END CATCH
END
GO
