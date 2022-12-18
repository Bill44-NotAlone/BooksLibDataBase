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

GO

CREATE FUNCTION UniqueTitle(@readerId INT, @instanceId VARCHAR(64))
RETURNS INT
AS
	BEGIN
		DECLARE @title NVARCHAR(64);
		DECLARE @countB INT;
		SELECT @title = title FROM Book WHERE id = CAST(LEFT(@instanceId, 1) AS INT);
		SELECT @countB = COUNT(*) FROM Instance_Reader WHERE reader_id = @readerId AND CAST(LEFT(instance_id, 1) AS INT) IN (SELECT id FROM Book WHERE title = @title);
		RETURN @countB;
	END