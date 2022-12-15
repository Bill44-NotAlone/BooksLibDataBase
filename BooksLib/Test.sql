USE BookLib;

GO

INSERT INTO Book(title, date_of_publication) VALUES ('1', '1.02.1960');
INSERT INTO Book(title, date_of_publication) VALUES ('2', '1.02.1961');
INSERT INTO Book(title, date_of_publication) VALUES ('3', '1.02.1962');
INSERT INTO Book(title, date_of_publication) VALUES ('4', '1.02.1963');
INSERT INTO Book(title, date_of_publication) VALUES ('5', '1.02.1964');
INSERT INTO Book(title, date_of_publication) VALUES ('6', '1.02.1965');
INSERT INTO Book(title, date_of_publication) VALUES ('7', '1.02.1966');

GO

INSERT INTO Human(name_human, surname) VALUES ('Василий', 'Очников');
INSERT INTO Human(name_human, surname) VALUES ('Деблет', 'Мрачный');

GO

INSERT INTO Reader(home_address, telephone, human_id) VALUES ('Катиская 6/2', '89109586953', 1);

GO

INSERT INTO Human_Book(human_id, book_id) VALUES (1, 1);
INSERT INTO Human_Book(human_id, book_id) VALUES (2, 1);
INSERT INTO Human_Book(human_id, book_id) VALUES (1, 2);
INSERT INTO Human_Book(human_id, book_id) VALUES (1, 3);

GO

INSERT INTO Instance(book_id, ordinal_number) VALUES (1, 1);
INSERT INTO Instance(book_id, ordinal_number) VALUES (1, 2);
INSERT INTO Instance(book_id, ordinal_number) VALUES (1, 3);
INSERT INTO Instance(book_id, ordinal_number) VALUES (1, 4);
INSERT INTO Instance(book_id, ordinal_number) VALUES (2, 1);
INSERT INTO Instance(book_id, ordinal_number) VALUES (2, 2);
INSERT INTO Instance(book_id, ordinal_number) VALUES (2, 3);
INSERT INTO Instance(book_id, ordinal_number) VALUES (2, 4);
INSERT INTO Instance(book_id, ordinal_number) VALUES (3, 1);
INSERT INTO Instance(book_id, ordinal_number) VALUES (3, 2);
INSERT INTO Instance(book_id, ordinal_number) VALUES (3, 3);
INSERT INTO Instance(book_id, ordinal_number) VALUES (3, 4);

