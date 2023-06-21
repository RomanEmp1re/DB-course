select ('университет: ' || name || ', количество студентов: ' || size)
as "полная информация"
from college order by name;
