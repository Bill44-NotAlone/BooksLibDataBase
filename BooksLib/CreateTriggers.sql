USE BookLib;

GO

CREATE TRIGGER Book_Reader_INSERT_TRIGGER
ON Book_Reader INSTEAD OF INSERT
AS
BEGIN
	IF (SELECT COUNT(*) FROM Book_Reader WHERE reader_id NOT IN (SELECT i.reader_id FROM inserted i) AND returned = 0) > 5
	BEGIN
		RAISERROR('The reader already has 5 books on hand', 16, 5)
		RETURN
	END
	ELSE
		INSERT INTO Book_Reader(reader_id, book_id) SELECT reader_id, book_id FROM inserted;
END