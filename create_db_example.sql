------------ SQL script ------------
-- run script: select text + F5

create database CyberAcademy;
go
-- delete database
--drop database CyberAcademy;

use CyberAcademy;
go

-- logic operators: > < = <> >= <= and or not

-- create table for Courses and link with students
create table Courses
(
	Id int primary key identity,
	Name nvarchar(200) not null unique,
	Hours int not null check(Hours > 0)
	-- other columns...
);
go

insert into Courses
values ('Relational Databases', 10), ('JavaScript', 24), ('Manual Testing', 46)
go

create table Students
(
	-- column: name type options... 
	/*
		null / not null
		primary key (unique + not null)
		identity(start, step) default: identity = identity(1, 1)
		unique
		check(condition)
		default(value)
		foreign key
	*/
	Id int primary key identity(10, 1),
	Name nvarchar(100) not null,
	Surname nvarchar(100) not null,
	Birthdate date null check(Birthdate < getdate()), -- getdate() - return current date
	AverageMark real null check(AverageMark >= 1 and AverageMark <= 12),
	Email nvarchar(50) not null unique,
	IsPremium bit not null default(0),
	-- create foreign key with courses table (One to Many relation)
	CourseId int references Courses(Id) not null
);
go

-- delete table 
--drop table Students;

-- Inserting sample data into the Students table
INSERT INTO Students (Name, Surname, Birthdate, AverageMark, Email, IsPremium, CourseId) VALUES 
('John', 'Doe', '1995-05-15', 9.5, 'john.doe@example.com', 1, 3),
('Alice', 'Smith', '1998-08-22', 8.2, 'alice.smith@example.com', 0, 2),
('Bob', 'Johnson', '1997-03-10', 7.8, 'bob.johnson@example.com', 1, 1),
('Eva', 'Anderson', '1996-11-03', 11.2, 'eva.anderson@example.com', 0, 1),
('Michael', 'Williams', '1999-01-25',10.6, 'michael.williams@example.com', 1, 1),
('Sophia', 'Brown', '1994-09-18', 8.9, 'sophia.brown@example.com', 0, 3),
('David', 'Jones', '1996-07-12', 6.4, 'david.jones@example.com', 1, 2),
('Olivia', 'Miller', '1998-04-30', 9.8, 'olivia.miller@example.com', 0, 2),
('Daniel', 'Garcia', '1997-12-05', 11.0, 'daniel.garcia@example.com', 1, 2),
('Emma', 'Rodriguez', '1995-06-28', 8.5, 'emma.rodriguez@example.com', 0, 3),
('Christopher', 'Martinez', '1994-02-14', 7.1, 'christopher.martinez@example.com', 1, 3),
('Ava', 'Lopez', '1999-10-08', 10.2, 'ava.lopez@example.com', 0, 1),
('Andrew', 'Hill', '1996-08-20', 6.9, 'andrew.hill@example.com', 1, 1),
('Isabella', 'Scott', '1997-04-12', 9.0, 'isabella.scott@example.com', 0, 2),
('William', 'Green', '1998-11-17', 7.6, 'william.green@example.com', 1, 3),
('Mia', 'Baker', '1995-09-03', 10.8, 'mia.baker@example.com', 0, 1),
('Ethan', 'Turner', '1999-01-08', 8.7, 'ethan.turner@example.com', 1, 2),
('Sophie', 'Ward', '1996-03-24', 11.5, 'sophie.ward@example.com', 0, 1),
('Jacob', 'Cooper', '1997-07-19', 7.3, 'jacob.cooper@example.com', 1, 3);
go

-- insert with invalid data
--INSERT INTO Students (Name, Surname, Birthdate, Course, AverageMark, Email, IsPremium) VALUES 
--('John', 'Doe', '2025-05-15', 'Computer Science', 13, 'john.doe@example.com', 1)
--go

-- create Teachers table and link with courses using [Many to Many] relation
create table Teachers
(
	Id int primary key identity,
	Name nvarchar(100) not null,
	Surname nvarchar(100) not null,
	HireDate date null check(HireDate < getdate()) default(getdate()),
	PhoneNumber nvarchar(20) null,
	-- many courses
);
go

-------------------------------- Many to Many Relationship
-- create intermediate table for Many to Many relation
create table TeachersCourses
(
	--Id int primary key identity,
	TeacherId int not null references Teachers(Id),
	CourseId int not null references Courses(Id),
	-- composite primary key
	primary key(TeacherId, CourseId)
);
go

insert into Teachers (Name, Surname, HireDate)
values	('Luda', 'Fisher', default),
		('Viktor', 'Fedor', '2020-01-10')
go

insert into TeachersCourses
values (1, 2), (1, 3),
	   (2, 1), (2, 2)
go

-- show table data
select * from Students;
select * from Courses;
select * from Teachers;
select * from TeachersCourses;

select Name, Surname, Birthdate from Students;

---------------------- rename key
sp_rename 'FK__Students__Course__2C3393D0', 'FK_Student_Course';
