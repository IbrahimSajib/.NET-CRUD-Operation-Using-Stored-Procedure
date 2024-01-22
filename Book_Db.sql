Create database Book_Db
GO

USE Book_Db
GO



Create table Book
(
BookId int primary key identity,
Title Varchar(50) not null,
Author Varchar(30) not null
)
go

insert into Book values
('T1','A1')
go

select * from Book
go




-- Procedure for GetAllBook
CREATE PROCEDURE spGetAllBook
AS
BEGIN
    SELECT * FROM Book
END
GO

-- Procedure for GetBookById
CREATE PROCEDURE spGetBookById
    @BookId INT
AS
BEGIN
    SELECT * FROM Book WHERE BookId = @BookId
END
GO

-- Procedure for Insert
CREATE PROCEDURE spCreateBook
    @Title NVARCHAR(50),
    @Author NVARCHAR(30)
AS
BEGIN
    INSERT INTO Book(Title, Author)
    VALUES (@Title, @Author)
END
GO

-- Procedure for Update
CREATE PROCEDURE spUpdateBook
    @BookId INT,
    @Title NVARCHAR(50),
    @Author NVARCHAR(30)
AS
BEGIN
    UPDATE Book
    SET Title = @Title, Author = @Author
    WHERE BookId = @BookId
END
GO

-- Procedure for Delete
CREATE PROCEDURE spDeleteBook
    @BookId INT
AS
BEGIN
    DELETE FROM Book WHERE BookId = @BookId
END
GO

--BackupTable
Create table tblBackup
(
BookId int primary key,
Title Varchar(50) not null,
Author Varchar(30) not null
)
go
select * from tblBackup
go

--Trigger
CREATE TRIGGER trg_AfterDelete
ON Book
FOR DELETE
AS
BEGIN
    INSERT INTO tblBackup
    SELECT * FROM deleted
END
GO

-- SP get all from backup table
CREATE PROCEDURE spGetAllBackup
AS
BEGIN
    SELECT * FROM tblBackup
END
GO