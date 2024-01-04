---------------- підзапити
-- показати курси та кількість їх студентів
select Id, Name, (select COUNT(Id) from Students where CourseId = Courses.Id)
from Courses

-- покзати всіх викладачів та к-сть їх відмінних студентів
select t.Name, t.Surname, (select COUNT(s.Id)
						   from Students as s JOIN Courses as c ON s.CourseId = c.Id
												JOIN TeachersCourses as tg ON tg.CourseId = c.Id
						   where s.AverageMark >= 10 and tg.TeacherId = t.Id
						  )
from Teachers as t

-- показати студентів середня оцінка яких більша за середню оцінку студентів групи JavaScript
select * 
from Students
where AverageMark > (select AVG(s.AverageMark) from Students as s where s.CourseId = 2)

-------------- UNION - об'єднує декілька таблиць в одну (кількість та типи колонок повинні співпадати)
select Id, Name
from Students
union all
select Id, Surname
from Teachers
