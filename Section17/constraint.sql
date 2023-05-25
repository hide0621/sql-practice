-- 後からunique制約をつけてみる

select * from employees;

insert into employees values (1, '00000002', 'Taro',19);

update employees set name = 'Jiro' where employee_code = '00000002';

-- 後からunique制約をつけた
alter table employees add constraint uniq_employees_name unique(name);

-- 制約一覧の表示
SELECT *
FROM information_schema.key_column_usage
WHERE table_name = 'employees';

-- 後から追加した制約の削除
alter table employees drop constraint uniq_employees_name;

-- 後からunique制約をつけた
alter table employees add constraint uniq_employees_name_age unique(name, age);

-- defaultの追加

select * from customers;

-- check制約の削除
alter table customers drop constraint customers_age_check; 

-- defaultの追加
alter table customers alter age set default 20;
insert into customers (id, name) values (2, 'Jiro');
select * from customers;

-- not nullの追加
ALTER TABLE customers
ALTER COLUMN name TYPE varchar(255),
ALTER COLUMN name SET NOT NULL;

insert into customers (id, name) values (3, null);

-- check制約の追加
alter table customers add constraint check_age check(age >= 20);

-- serial（自動的に増分させる）の学習
CREATE TABLE animals (
    id serial PRIMARY KEY,
    name varchar(50) NOT NULL
);
-- 自動的にidが挿入・増分される
INSERT INTO animals (name) VALUES ('Dog');
insert into animals (name) values ('Cat');
insert into animals values (4, 'Panda');
-- 上記でid４が挿入されたが、自動挿入の続きとして「3」が挿入される 
-- auto_increment（MySQL）との違い
insert into animals (name) values ('Fish');

select * from animals;







