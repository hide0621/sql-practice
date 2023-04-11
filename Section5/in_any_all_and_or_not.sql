-- inの学習
select * from users where age in (12, 24, 36);

select * from users where age not in (12, 24, 36);

select * from customers where id in (select customer_id from receipts);

select * from customers where id in (select customer_id from receipts where id < 10);

-- all , anyの学習

select * from employees where salary > 5000000;

select * from users where age > all (select age from employees where salary > 5000000);

select * from users where age > any (select age from employees where salary > 5000000);

select * from users where age = any (select age from employees where salary > 5000000);

 -- and , or の学習

select * from employees where department = ' 営業部 ' and name like '%田%';

select * from employees where department = ' 営業部 ' and name like '%田%' and age < 35;

select * from employees where department = ' 営業部 ' and (name like '%田%' or name like '%西%') and age < 35;

-- notの学習

select * from employees where not department = ' 営業部 ';

