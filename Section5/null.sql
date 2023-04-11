select * from customers;

select * from customers where name is null;

select * from customers where name in ('河野 文典', '稲田 季雄') or name is null;

select * from customers where name not in ('河野 文典', '稲田 季雄') and name is not null;

select * from users where birth_day <= all (select birth_day from customers where id < 10 and birth_day is not null);