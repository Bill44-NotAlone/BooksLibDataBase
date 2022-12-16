USE BookLib;
SELECT * FROM Instance_Reader;
GO
UPDATE Instance_Reader SET returned = 1 WHERE instance_id='1_1';
GO
SELECT * FROM Instance_Reader;
GO
INSERT INTO Instance_Reader(reader_id, instance_id) VALUES (1, '1_1');
GO
SELECT * FROM Instance_Reader;