-- 集計関数について学習

select * from customers where name is null;

-- count関数

select count(*) from customers; -- nullも含めて何行あるか？
select count(name) from customers;  -- null以外で何行あるか？

select count(name) from customers where id > 80; 

-- max, min関数

select max(age) , min(age) from users;
select max(age) , min(age) from users where birth_place = '日本';

select max(birth_day), min(birth_day) from users;

-- sum関数

select sum(salary) from employees;

-- avg関数

select avg(salary) from employees;

select avg(age) from users; -- 行にnullがあればそれを無視（カウントしない）して平均値を出す
select avg(coalesce(age, 0)) from users; -- 行にnullがあれば、それを０とみなして平均値を出す