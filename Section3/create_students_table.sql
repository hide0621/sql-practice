create table students (
	id int primary key ,
	name char(10) 
)

-- ""ではなくて''で文字列を囲む！
-- CHAR型は末尾のスペースが削除される！
insert into students (id, name) values (1, 'ABCDEF   ');

select * from students;

-- カラムのデータ型の変更
-- VARCHAR型の場合は末尾のスペースが含まれる！
alter table students alter column name type varchar(10);

insert into students (id, name) values (2, 'ABCDEF   ');

select name, char_length(name) from students;