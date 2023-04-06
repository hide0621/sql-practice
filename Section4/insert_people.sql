-- peopleテーブルの作成
create table people (
	id int primary key,
	name varchar(50),
	birth_day date default '1990-01-01'
);

-- insert 1
insert into people values (1, 'Taro', '2020-01-01');

select * from people;

-- insert カラム指定
insert into people (id , name) values (2, 'Jiro'); 

select * from people;

-- insert 3
insert into people (id , name) values (3, 'Saburo');

select * from people;

-- insert シングルクォートの中にシングルクウォート
insert into people values (4, 'John''s son', '2021-01-01');

select * from people;
