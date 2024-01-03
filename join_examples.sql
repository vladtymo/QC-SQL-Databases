use CyberAcademy;

select * from Courses;

-- alias: as 'alias'

-- show all students of 'JavaScript' course
select s.*, c.Name as 'Course'
from Students as s, Courses as c
where s.CourseId = c.Id and c.Name = 'JavaScript'
order by s.Name;

-- show all success students sorted by course name
select * 
from Students as s, Courses as c
where s.AverageMark >= 10 and s.CourseId = c.Id
order by c.Name

-- [INNER] JOIN - get related table records
-- table1 as t1 JOIN table2 as t2 ON t1.ForeignKey = t2.PrimaryKey
select * 
from Students as s join Courses as c on c.Id = s.CourseId
where s.AverageMark >= 10
order by c.Name

-- show all teachers of 'JavaScript' course
select t.*
from Teachers as t JOIN TeachersCourses as tg ON tg.TeacherId = t.Id
				   JOIN Courses as c ON tg.CourseId = c.Id
where c.Name = 'JavaScript'

-- change column options
alter table Students alter column CourseId int null

select * from Students
------------------- JOIN types
-- inner join
-- show all students with course data
select s.*, c.Name, c.Hours
from Students as s inner join Courses as c on c.Id = s.CourseId

-- left join
-- показати всіх студентів разом з даними про курс, а також тих, які не мають жодного курса
select s.*, c.Name, c.Hours
from Students as s left join Courses as c on c.Id = s.CourseId

-- показати всіх студентів без курса
select s.*, c.Name, c.Hours
from Students as s left join Courses as c on c.Id = s.CourseId
where c.Id is null

-- показати всіх студентів разом з даними про курс, а також курси без студентів
select s.*, c.Name, c.Hours
from Students as s right join Courses as c on c.Id = s.CourseId

-- показати курси без студентів
select s.*, c.Name, c.Hours
from Students as s right join Courses as c on c.Id = s.CourseId
where s.Id is null

-- показати всі студенти з курсами та без, а також курси без студентів
select s.*, c.Name, c.Hours
from Students as s full join Courses as c on c.Id = s.CourseId

-- показати студентів без курса, а також курси без студентів
select s.*, c.Name, c.Hours
from Students as s full join Courses as c on c.Id = s.CourseId
where s.Id is null or c.Id is null

-- LEN(string) - повертає к-сть символів в рядку

-- завдання: показати всіх студентів в яких ім'я до 5-ти символів, в яких викладає 'Oleg'
select *
from Students as s JOIN Courses as c ON s.CourseId = c.Id
				   JOIN TeachersCourses as tg ON tg.CourseId = c.Id
				   JOIN Teachers as t ON tg.TeacherId = t.Id
where len(s.Name) <= 5 and t.Name = 'Oleg'

