USE BookLib;

GO

 ALTER TABLE Book_Reader
 ADD CONSTRAINT The_reader_already_has_5_books_on_hand
  CHECK(BookReaderCount() <= 5)