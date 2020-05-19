CREATE PROC ContactViewByID
@ContactID int
AS
	BEGIN
	SELECT * 
	FROM Contacts
	WHERE ContactID = @ContactID
	END