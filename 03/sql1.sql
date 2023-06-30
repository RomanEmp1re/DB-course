select (student.name) as name from student
union
select (course.name) as name from course
order by name desc;
