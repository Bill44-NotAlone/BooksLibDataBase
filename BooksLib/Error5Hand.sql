USE BookLib;

GO

 ALTER TABLE Book_Reader
 add constraint The_reader_already_has_5_books_on_hand
  check (dbo.BookReaderCount() <= 5)