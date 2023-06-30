select name, amount_of_students
from course
order by
case
when amount_of_students = 300 then 0
else 1
end,
amount_of_students asc
limit 3;
