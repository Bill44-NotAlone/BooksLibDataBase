USE BookLib;
GO
UPDATE Book_Reader SET duty=duty+5 WHERE returned=0 AND DATEDIFF(day, date_of_return, GETDATE())>0;