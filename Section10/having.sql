-- havingについて学習

select department, avg(salary) from employees
group by department
having avg(salary) > 3980000;

select birth_place , age, count(*)
from users 
group by birth_place , age;

select birth_place , age, count(*)
from users 
group by birth_place , age
having count(*) > 2;

select birth_place , age, count(*)
from users 
group by birth_place , age
having count(*) > 1
order by count(*) ;

