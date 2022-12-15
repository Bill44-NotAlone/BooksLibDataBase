USE BookLib;

GO

CREATE FUNCTION HowManyBooksReaderHas(@readetId INT)
RETURNS INT
AS
 BEGIN
  DECLARE @countR INT;
  SELECT @countR = COUNT(*) FROM Instance_Reader WHERE reader_id=@readetId AND returned = 0; 
  RETURN @countR;
 END

GO

CREATE FUNCTION BookInTheLibrary(@instanceId VARCHAR)
RETURNS INT
AS
 BEGIN
    DECLARE @countB INT;
    SELECT @countB = COUNT(*) FROM Instance_Reader WHERE instance_id LIKE @instanceId AND returned = 0;
	RETURN @countB;
 END