CREATE PROC ContactDeleteByID
@ContactID int
AS
	BEGIN
	DELETE FROM Contacts
	WHERE ContactID = @ContactID
	END