select * from users limit 10;

select * from users where name = '奥村 成美';

select * from users where birth_place = '日本';

-- where句でnot equalの書き方
select * from users where birth_place <> '日本';
select * from users where birth_place != '日本';
select * from users where birth_place != '日本' order by age;
select * from users where birth_place != '日本' order by age limit 10;

-- SQLの実行順序 from → where → order by → limit selectは一番最後!

select * from users where age > 50 limit 10;
select * from users where age >= 50 limit 10;

select * from users where birth_day >= '2011-04-03';

select * from users where is_admin = 1;
select * from users where is_admin = 0;

-- update 
update users set name = '奥山 成美' where id = 1;
select * from users where id = 1;

-- delete 
select * from users order by id desc limit 1;

delete from users where id = 200;
delete from users where id > 190;
