USE BookLib;

GO

CREATE PROCEDURE Book_Reader_INSERT_PROCEDURE(@readerId INT, @bookId INT) AS
BEGIN
	IF (SELECT COUNT(*) FROM Book_Reader WHERE reader_id=@readerId AND returned = 0) >= 5
	BEGIN
		RAISERROR('The reader already has 5 books on hand', 16, 5)
		RETURN
	END
	ELSE
		INSERT INTO Book_Reader(reader_id, book_id) VALUES (@readerId, @bookId);
END