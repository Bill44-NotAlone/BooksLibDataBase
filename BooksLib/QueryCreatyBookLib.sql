--CREATE DATABASE BookLib;

--GO

USE BookLib;

GO

CREATE TABLE Human(
	PRIMARY KEY (id),
	id			  INT		   NOT NULL IDENTITY,
	name_human	  NVARCHAR(30) NOT NULL,
	surname		  NVARCHAR(30) NOT NULL,
	patronymic	  NVARCHAR(30) NULL
);

GO

CREATE TABLE Book(
	PRIMARY KEY (id),
	id					INT			  NOT NULL IDENTITY,
	title				NVARCHAR(64)  NOT NULL,
	date_of_publication DATE		  NOT NULL,
	CONSTRAINT date_of_the_book_is_out_of_range CHECK(GETDATE() >= date_of_publication AND YEAR(date_of_publication) >= 1960)
);

GO

CREATE TABLE Instance(
	PRIMARY KEY (id),
	id					VARCHAR(64)	  NOT NULL,
	book_id				INT			  NOT NULL REFERENCES Book(id),
	ordinal_number		INT			  NOT NULL,
	UNIQUE(book_id, ordinal_number)
)

GO

CREATE TABLE Human_Book(
	PRIMARY KEY (id),
	id					INT			  NOT NULL IDENTITY,
	human_id			INT			  NOT NULL REFERENCES Human(id),
	book_id				INT			  NOT NULL REFERENCES Book(id),
	UNIQUE(human_id, book_id)
);

GO

CREATE TABLE Reader(
	PRIMARY KEY(id),
    id					INT		     NOT NULL IDENTITY,
	home_address		NVARCHAR(64) NOT NULL,
	telephone			VARCHAR(12)  NOT NULL,
	human_id			INT		     NOT NULL REFERENCES Human(id),
	UNIQUE(telephone),
	UNIQUE(human_id),
	CONSTRAINT phone_is_not_recognized CHECK(telephone NOT LIKE('^((8|\+374|\+994|\+995|\+375|\+7|\+380|\+38|\+996|\+998|\+993)[\- ]?)?\(?\d{3,5}\)?[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}(([\- ]?\d{1})?[\- ]?\d{1})?$'))
);

GO

CREATE TABLE Instance_Reader(
	PRIMARY KEY(id),
    id			   INT		   NOT NULL IDENTITY,
	date_of_taking DATE		   NOT NULL DEFAULT(GETDATE()),
	date_of_return DATE		   NOT NULL DEFAULT(DATEADD(day, 5, GETDATE())),
	returned	   BIT		   NOT NULL DEFAULT(0),
	duty		   MONEY	   NOT NULL DEFAULT(0),
	instance_id	   VARCHAR(64) NOT NULL REFERENCES Instance(id),
	reader_id	   INT		   NOT NULL REFERENCES Reader(id),
	CONSTRAINT the_reader_already_has_5_books_on_hand
    CHECK(dbo.HowManyBooksReaderHas(reader_id) <= 5),
	CONSTRAINT the_book_is_not_in_the_library
	CHECK(dbo.BookInTheLibrary(instance_id) <= 1)
);