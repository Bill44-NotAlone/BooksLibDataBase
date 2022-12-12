CREATE DATABASE BookLib;

GO

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
	quantity			INT			  NOT NULL	DEFAULT(1),
	CONSTRAINT date_of_the_book_is_out_of_range CHECK(GETDATE() >= date_of_publication AND YEAR(date_of_publication) >= 1960)
);

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
	CONSTRAINT phone_is_not_recognized CHECK(telephone NOT LIKE('^((8|\+374|\+994|\+995|\+375|\+7|\+380|\+38|\+996|\+998|\+993)[\- ]?)?\(?\d{3,5}\)?[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}[\- ]?\d{1}(([\- ]?\d{1})?[\- ]?\d{1})?$'))
);

GO

CREATE TABLE Book_Reader(
	PRIMARY KEY(id),
    id			   INT		   NOT NULL IDENTITY,
	date_of_taking DATE		   NOT NULL DEFAULT(GETDATE()),
	date_of_return DATE		   NOT NULL DEFAULT(DATEADD(day, 5, GETDATE())),
	returned	   BIT		   NOT NULL DEFAULT(0),
	duty		   MONEY	   NOT NULL DEFAULT(0),
	book_id		   INT		   NOT NULL REFERENCES Book(id),
	reader_id	   INT		   NOT NULL REFERENCES Reader(id),
	UNIQUE(book_id, reader_id),
	CONSTRAINT The_reader_already_has_5_books_on_hand CHECK (dbo. BookReaderCount() >= 5
);