CREATE DATABASE CodeCourse

use CodeCourse

create TABLE Students(
    [Id] int PRIMARY KEY IDENTITY, 
    [Name] NVARCHAR(50),
    [Surname] NVARCHAR(50),
    [Age] int,
    [Email]NVARCHAR(100),
    [Address] NVARCHAR(150)
)

create TABLE StudentArchives(   
    [Id] int PRIMARY KEY IDENTITY,
    [StudentId] int,
    [Operation] NVARCHAR (50),
    [Date] DATETIME
)

CREATE TRIGGER trg_deleteStudent on Students
after DELETE
AS
BEGIN
insert into StudentArchives([StudentId],[Operation],[Date])
select [Id],'Deleted',GETDATE() from deleted
end    

create PROCEDURE usp_deleteStudentById
@id INT
as
BEGIN
DELETE from Students WHERE [Id]=@id
END

insert into Students([Name],[Surname],[Age],[Email],[Address])
VALUES ('Ilgar','Shiriyev',26,'shiriyev@gmail.com','Bayil'),
('Orxan','Aliyev',21,'orxan@gmail.com','Yasamal'),
('Nigar','Memmedova',24,'nigar@gmail.com','Zabrat'),
('Elcin','Suleymanov',18,'elcin@gmail.com','Kurdexani'),
('Zamiq','Huseynov',26,'zamiq@gmail.com','28May')

select * FROM Students
SELECT * FROM StudentArchives

EXEC usp_deleteStudentById 2