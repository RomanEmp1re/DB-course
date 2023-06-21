select name, size 
from college 
where id not in (10, 30, 50) 
order by size desc, name;
