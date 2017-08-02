/*
Источник: http://www.sql.ru/forum/252690/kak-udalit-foreign-key
*/

USE AppStarterBase
GO

/*Удаление ограничений "внешний ключ",
которые реально существуют в таблицах БД*/
DECLARE cur CURSOR FOR
SELECT
RTRIM(TC.table_schema)+'.'+TC.table_name AS ChildTable,
TC.constraint_name AS ChildForeignKey,
KCU.column_name AS ChildColumn,
RTRIM(CTU.table_schema)+'.'+CTU.table_name AS ParentTable,
RC.unique_constraint_name AS ParentKey,
KCU1.column_name AS ParentColumn
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS TC
INNER JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC ON TC.constraint_name=RC.constraint_name
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU ON TC.constraint_name=KCU.constraint_name
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 ON RC.unique_constraint_name=KCU1.constraint_name
INNER JOIN INFORMATION_SCHEMA.CONSTRAINT_TABLE_USAGE AS CTU ON RC.unique_constraint_name=CTU.constraint_name
WHERE TC.constraint_type='FOREIGN KEY'
AND TC.table_name LIKE N'Table%'
ORDER BY
TC.table_name,
TC.constraint_name,
KCU.ordinal_position
OPEN cur

DECLARE @ChildTable NCHAR(1000)
DECLARE @ChildForeignKey  NCHAR(1000)
DECLARE @ParentColumn NCHAR(1000)
DECLARE @ParentTable NCHAR(1000)
DECLARE @ParentKey NCHAR(1000)
DECLARE @ChildColumn NCHAR(1000)
DECLARE @sql NCHAR(1000)

FETCH NEXT FROM cur INTO @ChildTable,@ChildForeignKey,@ChildColumn,@ParentTable,@ParentKey,@ParentColumn
WHILE @@FETCH_STATUS=0
BEGIN
	SET @sql='ALTER TABLE '+LTRIM(RTRIM(@ChildTable))+' DROP CONSTRAINT '+LTRIM(RTRIM(@ChildForeignKey))
	EXEC(@sql)
	PRINT @sql
	FETCH NEXT FROM cur INTO @ChildTable,@ChildForeignKey,@ChildColumn,@ParentTable,@ParentKey,@ParentColumn
END
CLOSE cur
DEALLOCATE cur