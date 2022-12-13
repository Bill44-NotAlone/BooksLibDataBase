USE BookLib;

GO

CREATE FUNCTION BookReaderCount()
RETURNS INT
AS
 BEGIN
    DECLARE @countR INT;
    SELECT @countR = COUNT(*) FROM Book_Reader WHERE reader_id=reader_id AND returned = 0 > 5; 
	RETURN @countR;
 END