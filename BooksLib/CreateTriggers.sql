USE BookLib;

GO

CREATE TRIGGER instance_trigger_instead_of_insert
ON Instance INSTEAD OF INSERT
AS
	BEGIN
		DECLARE @bookId INT;
		DECLARE @ordinalNumber INT;
		SELECT @bookId = book_id, @ordinalNumber = ordinal_number FROM INSERTED;
		INSERT INTO Instance VALUES (CAST(@bookId AS VARCHAR)+'_'+CAST(@ordinalNumber AS VARCHAR), @bookId, @ordinalNumber)
	END;