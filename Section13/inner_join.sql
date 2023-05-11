-- inner joinについて学習

select * from employees;

select * from departments;

-- 通常のjoin
select * from employees as emp
inner join departments as dt 
on emp.department_id = dt.id;

-- 特定のカラムを取り出す
select emp.id, emp.first_name, emp.last_name, dt.id as department_id, dt.name as department_name 
from employees as emp
inner join departments as dt 
on emp.department_id = dt.id;

-- 複数のレコードで紐付ける
select * from students as std
inner join users as usr 
on std.first_name = usr.first_name and std.last_name = usr.last_name;

-- =　以外で紐づける方法
select * from employees as emp
inner join students as std 
on emp.id < std.id;

-- left joinの勉強
select emp.id, emp.first_name, emp.last_name, dt.id as department_id, dt.name as department_name 
from employees as emp
left join departments as dt 
on emp.department_id = dt.id;

-- right joinの勉強
select * from students as std
left join enrollments as enr
on std.id = enr.student_id
left join classes as cs 
on enr.class_id = cs.id;

select * from students as std
right join enrollments as enr
on std.id = enr.student_id
right join classes as cs 
on enr.class_id = cs.id;

-- full joinの練習（両方から取り出して、値が取り出せないものはnullとする）
select * from enrollments as enr
full join classes as cs 
on enr.class_id = cs.id;
