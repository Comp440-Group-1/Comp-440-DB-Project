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
-- Description:	Insert new customer subscription into subscriptionCustomer table
-- =============================================
CREATE PROCEDURE InsertSubscription
	-- Add the parameters for the stored procedure here
	@subscriptionId int,
	@customerFirstName varchar(25),
	@customerLastName varchar(25),
	@customerEmail varchar(80),
	@companyId int,
	@customerUsername varchar(20)
	@customerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		INSERT INTO subscriptionCustomer VALUES(@subscriptionId, @customerFirstName, @customerLastName, @customerEmail, @companyId, @customerUsername, @customerId)
    END TRY
	BEGIN CATCH
		RAISERROR('Error: Unable to insert new subscription', 1, 1);
	END CATCH
END
GO
