------------- Grouping
-- GROUP BY [key]

-- при групуванні в SELECT можна використовувати лише ключі групи та агрегаційні ф-ї
-- агрегаційна ф-я повертає значення для кожної групи окремо

select IsPremium, COUNT(Id), AVG(AverageMark)
from Students
group by IsPremium

-- показати к-сть студентів на кожному курсі
select CourseId, c.Name, COUNT(s.Id) as 'Students'
from Students as s JOIN Courses as c ON s.CourseId = c.Id
group by CourseId, c.Name

-- показати к-сть відмінників на кожному курсі
select CourseId, c.Name, COUNT(s.Id) as 'Students'
from Students as s JOIN Courses as c ON s.CourseId = c.Id
where s.AverageMark >= 10
group by CourseId, c.Name
order by 'Students' 

-- HAVING condition - використовується лише для фільтрації груп, ставиться після group by

-- показати курси які мають більше 3-х преміум студентів
select CourseId, c.Name, COUNT(s.Id) as 'Students'			-- визначаємо колонки для показу
from Students as s JOIN Courses as c ON s.CourseId = c.Id	-- вказуємо джерело даних (зв'язуючи з таблицями)
where s.IsPremium = 1										-- фільтруємо записи
group by CourseId, c.Name									-- утворюємо групи із записів
having COUNT(s.Id) > 3										-- фільтруємо групи
order by 'Students' desc									-- сортуємо групи

-- показати к-сть відмінних студентів для кожного викладача
select t.Name, t.Surname, COUNT(s.Id)
from Teachers as t JOIN TeachersCourses as tg ON tg.TeacherId = t.Id
					JOIN Courses as c ON tg.CourseId = c.Id
					JOIN Students as s ON s.CourseId = c.Id
where s.AverageMark >= 10
group by t.Id, t.Name, t.Surname
