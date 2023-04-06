select * from people;

alter table people add column age int;

insert into people values (2, 'Alice', '2001-01-01', 18)
insert into people values (5, 'Vette', '2001-01-01', 20)
insert into people values (6, 'Tsuyoshi', '2001-01-01', 21)

select * from people;

update people set age = 18 where id = 1;
update people set age = 19 where id = 3;
update people set age = 14 where id = 4;

-- 昇順と降順（order byの練習）
-- デフォルトとASCが昇順
-- DESCが降順
select * from people order by age;
select * from people order by id;

select * from people order by age desc;

-- ２つカラムの場合
select * from people order by birth_day , name;
select * from people order by birth_day desc , name;

-- distinctの練習
select distinct birth_day from people;
select distinct birth_day from people order by birth_day desc;

--両方とも重複する場合はそれを無くして表示
select distinct name , birth_day from people;

-- limitの練習
select * from people limit 3;

-- 飛ばして表示(OFFSETの練習)（３とばし）
select * from people limit 2 offset 3;