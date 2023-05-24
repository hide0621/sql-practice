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


