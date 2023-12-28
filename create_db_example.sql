------------ SQL script ------------
-- run script: select text + F5

create database CyberAcademy;
go

use CyberAcademy;
go

-- logic operators: > < = <> >= <= and or not

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
	Course nvarchar(200) not null,
	AverageMark real null check(AverageMark >= 1 and AverageMark <= 12),
	Email nvarchar(50) not null unique,
	IsPremium bit not null default(0)
);
go

-- Inserting sample data into the Students table
INSERT INTO Students (Name, Surname, Birthdate, Course, AverageMark, Email, IsPremium) VALUES 
('John', 'Doe', '1995-05-15', 'Computer Science', 9.5, 'john.doe@example.com', 1),
('Alice', 'Smith', '1998-08-22', 'Mathematics', 8.2, 'alice.smith@example.com', 0),
('Bob', 'Johnson', '1997-03-10', 'Physics', 7.8, 'bob.johnson@example.com', 1),
('Eva', 'Anderson', '1996-11-03', 'Biology', 11.2, 'eva.anderson@example.com', 0),
('Michael', 'Williams', '1999-01-25', 'Chemistry', 10.6, 'michael.williams@example.com', 1),
('Sophia', 'Brown', '1994-09-18', 'History', 8.9, 'sophia.brown@example.com', 0),
('David', 'Jones', '1996-07-12', 'English', 6.4, 'david.jones@example.com', 1),
('Olivia', 'Miller', '1998-04-30', 'Geography', 9.8, 'olivia.miller@example.com', 0),
('Daniel', 'Garcia', '1997-12-05', 'Economics', 11.0, 'daniel.garcia@example.com', 1),
('Emma', 'Rodriguez', '1995-06-28', 'Political Science', 8.5, 'emma.rodriguez@example.com', 0),
('Christopher', 'Martinez', '1994-02-14', 'Sociology', 7.1, 'christopher.martinez@example.com', 1),
('Ava', 'Lopez', '1999-10-08', 'Psychology', 10.2, 'ava.lopez@example.com', 0),
('Andrew', 'Hill', '1996-08-20', 'Anthropology', 6.9, 'andrew.hill@example.com', 1),
('Isabella', 'Scott', '1997-04-12', 'Philosophy', 9.0, 'isabella.scott@example.com', 0),
('William', 'Green', '1998-11-17', 'Archeology', 7.6, 'william.green@example.com', 1),
('Mia', 'Baker', '1995-09-03', 'Linguistics', 10.8, 'mia.baker@example.com', 0),
('Ethan', 'Turner', '1999-01-08', 'Criminal Justice', 8.7, 'ethan.turner@example.com', 1),
('Sophie', 'Ward', '1996-03-24', 'Environmental Science', 11.5, 'sophie.ward@example.com', 0),
('Jacob', 'Cooper', '1997-07-19', 'Statistics', 7.3, 'jacob.cooper@example.com', 1);
go

-- insert with invalid data
INSERT INTO Students (Name, Surname, Birthdate, Course, AverageMark, Email, IsPremium) VALUES 
('John', 'Doe', '2001-05-15', 'Computer Science', 12, 'john.doe2@example.com', 1)
go

-- show table data
select * from Students;

select Name, Surname, Birthdate from Students;
