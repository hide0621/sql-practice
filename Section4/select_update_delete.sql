-- 全レコード、全カラムの表示
select * from people;

-- カラムの一部を表示
select id from people;
select id , birth_day from people;
select name , id , birth_day from people;
select name , id , birth_day, name from people;

-- ASの練習（こっちは""で囲む）
select id as "番号" , name as "名前" from people;

-- where句の学習
select * from people where id = 1;
select * from people where id > 1;
select * from people where id <= 3;
select * from people where name = 'Jiro';

-- update文の練習
-- 全てのカラムの値が変わってしまう危険なクエリ！
update people set birth_day = '1900-01-01';

-- whereで指定したカラムの値だけ変わる
update people set name = 'hide', birth_day = '2000-01-01' where id = 3;

select * from people;

select * from people;

-- delete文の練習
delete from people where id = 2;

select * from people;