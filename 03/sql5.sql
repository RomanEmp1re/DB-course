(select id from course except select id from student_on_course)
union
(select id from student_on_course except select id from course) 
order by id;
