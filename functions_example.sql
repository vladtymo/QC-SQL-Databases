------------- Aggregation Functions
/*
	COUNT() - повертає к-сть елементів (числові та рядкові)
	MIN()	- повертає мінімальне значення з колеції (числові та рядкові)
	MAX()	- повертає максимальне значення з колеції (числові та рядкові)
	SUM()	- повертає суму всіх значень з колеції (числові)
	AVG()	- повертає середнє значення з колеції (числові)
*/

select * from Students;

-- отримати кількість всіх студентів
select COUNT(Id) as 'Student Count' from Students;

-- NULL values are ignored
select COUNT(Birthdate) from Students;

-- отмарити максимальну/мінімальну оцінку по студентах
select MIN(AverageMark), MAX(AverageMark) from Students;

-- отримати перше прізвище по алфавіту
select MIN(Surname) from Students;

-- отримати середню оцінку по всіх студентах
select AVG(AverageMark) from Students;
