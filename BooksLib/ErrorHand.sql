USE BookLib;

GO

 ALTER TABLE Instance_Reader
 ADD CONSTRAINT the_book_is_not_in_the_library
 CHECK(dbo.BookInTheLibrary(instance_id)<=0);

GO

 ALTER TABLE Instance_Reader
 ADD CONSTRAINT the_reader_already_has_5_books_on_hand 
 CHECK(dbo.HowManyBooksReaderHas(reader_id) <= 5)
