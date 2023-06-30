select name, 'курс' as object_type from course
union
select name, 'университет' as object_type from college
order by object_type desc;
