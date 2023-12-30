------------------ DQL - SELECT

-- select column1, column2 (* - all columns)
-- from table
-- filtering, sorting, goruping...

select * from Students;

select Email, CourseId from Students;

select top 10 *
from Students

-- where condition - filter data by condition
-- logic operators: > < = <> >= <= 
-- and or
-- not between in like

select * 
from Students
where AverageMark >= 10
order by Name

select *
from Students
where AverageMark >= 7 and CourseId <> 2
		and Birthdate >= '1996-01-01'

select *
from Students
where AverageMark between 7 and 9 --AverageMark >= 7 and AverageMark <= 9

-- get date part: year() month() day()
-- show students who born at 1996, 1999, 2001
select * 
from Students
where year(Birthdate) in (1996, 1999, 2001)
	--year(Birthdate) = 2001 
	--	or year(Birthdate) = 1999
	--	or year(Birthdate) = 1996

-- show students with name starts with 'A'
/* special characters: 
	_ any single character
	% any many characters
	[123] any single character from brackets
	[^123] any single character except brackets
*/
select * 
from Students
where	--Surname like '%e_'
		--Name like 'A%'
		--Name like '[ABC]%'
		Email like '%@gmail.com'

-- order by column asc/desc - sort records by column value
select *
from Teachers
order by Name, Surname

select top 5 *
from Students
order by AverageMark desc

select top 50 percent * 
from Students

-- distinct - show without dublicates
select distinct Name, Surname
from Students

-- Practical Task: show students who born at winter and has avg mark bigger than 8 from 1 course. Sort by Name
select *
from Students
where month(Birthdate) in (1,2,12)
	and AverageMark > 8
	and CourseId = 1
order by Name asc
