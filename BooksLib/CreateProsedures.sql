--CREATE DATABASE BookLib;

--GO

USE BookLib;

GO

CREATE FUNCTION HowManyBooksReaderHas(@readerId INT)
RETURNS INT
AS
	BEGIN
		DECLARE @countR INT;
		SELECT @countR = COUNT(*) FROM Instance_Reader WHERE reader_id=@readerId AND returned=0; 
		RETURN @countR;
	END

GO

CREATE FUNCTION BookInTheLibrary(@instanceId VARCHAR(64))
RETURNS INT
AS
	BEGIN
		DECLARE @countB INT;
			SELECT @countB = COUNT(*) FROM Instance_Reader WHERE instance_id=@instanceId AND returned=0;
		RETURN @countB;
	END