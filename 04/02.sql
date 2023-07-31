UPDATE student_on_course_kn
set student_rating = CASE
  WHEN student_rating > 0 AND student_rating <= 60 then student_rating - 5
  WHEN student_rating > 60 AND student_rating <= 80 then student_rating - 10
  WHEN student_rating > 80 AND student_rating <= 90 then student_rating - 15
  else student_rating - 20
end;
