select
  (
  select cast (count(*) as float) from
    (
    select id from course intersect select id from student_on_course
    )
  as first
  )/(
  select count(*) from
    (
    select id from course union select id from student_on_course
    )
  as second
  )
as result;
