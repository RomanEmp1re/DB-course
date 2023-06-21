select course.name as course_name, 
college.name as college_name, 
course.amount_of_students 
from course 
inner join college 
on course.college_id = college.id 
where amount_of_students > 27 and amount_of_students <= 310 
order by course_name desc, amount_of_students desc;
