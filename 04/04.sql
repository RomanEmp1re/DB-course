insert into student_on_course_kn(id, student_id, course_id, student_rating, finished_date, name, city)
select 
student_on_course.id, 
student_id, 
course_id, 
case
  when student_rating between 0 and 60 then student_rating - 5
  when student_rating between 61 and 80 then student_rating - 10
  when student_rating between 81 and 90 then student_rating - 15
  else student_rating - 20
end,
finished_date,
student.name,
student.city
from student_on_course
inner join student
on student_on_course.student_id = student.id
where city = 'Москва';
