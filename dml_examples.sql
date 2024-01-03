---------------- DML (insert, update, delete)
insert Students(Name, Surname, Email, AverageMark, IsPremium, CourseId)
values ('Igor', 'Martyn', 'fighter@gmail.com', 9.2, 1, 3),
		('Natalia', 'Herus', 'tester@gmail.com', 20.9, default, NULL)

select * from Students;

-- update data
update Students
	set AverageMark = 11
	where Id in (16, 19)

-- delete data
delete from Students
where Id between 16 and 18