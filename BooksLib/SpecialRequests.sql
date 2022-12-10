USE BookLib;

GO

SELECT * FROM Book WHERE (SELECT COUNT(*) FROM Human_Book WHERE book_id=Book.id) > 1;

GO

SELECT *, DATEDIFF(day, (SELECT date_of_return FROM Book_Reader WHERE reader_id=id), GETDATE()) AS CountDuty FROM Reader WHERE id IN (SELECT reader_id FROM Book_Reader WHERE duty > 0);

GO

SELECT date_of_taking, (SELECT COUNT(*) FROM Book_Reader WHERE date_of_taking =date_of_taking) AS countTakeBook  FROM Book_Reader GROUP BY date_of_taking ORDER BY date_of_taking ASC;