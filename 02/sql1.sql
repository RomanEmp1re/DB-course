select name, telegram_contact
from student
where city = 'Казань' or city = 'Москва'
order by name;
