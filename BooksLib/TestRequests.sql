USE BookLib;
SELECT * FROM Instance_Reader;
SELECT COUNT(*) FROM Instance_Reader WHERE instance_id LIKE '1_1' AND returned = 0;
INSERT INTO Instance_Reader(reader_id, instance_id) VALUES (1, '1_1');
IF (SELECT COUNT(*) FROM Instance_Reader WHERE instance_id LIKE '1_1' AND returned = 0) = 1
	PRINT('1');
else 
	PRINT('2');