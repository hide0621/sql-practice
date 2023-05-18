-- 新しいDBを作成する

create database day_15_18_db;


-- not null制約について学習
create table users(
	id int primary key,
	first_name varchar(255),
	last_name varchar(255) default '' not null
);

insert into users(id) values(1);

select * from users;

create table users_2(
	id int primary key,
	first_name varchar(255),
	last_name varchar(255) not null,
	age int default 0
);

-- last_nameカラムがnot null制約が効いているので、このクエリはエラーになる
insert into users_2(id , first_name) values(1, 'Taro');

insert into users_2(id , first_name, last_name) values(1, 'Taro', 'Yamada');

select * from users_2;

-- ageカラムがnot null制約が効いてないので、nullが挿入できる
insert into users_2 values(2, 'Jiro', 'Suzuki', null);


-- unique制約について学習

create table login_users (
	id int primary key,
	name varchar(255) not null,
	email varchar(255) not null unique
);

insert into login_users values(1, 'Shingo', 'abc@mail.com');

-- emailカラムがunique制約が効いているので、同じ値は挿入できない
insert into login_users values(2, 'Shingo', 'abc@mail.com');

create table tmp_names (
	name varchar(255) unique
);

insert into tmp_names values ('Taro');

-- emailカラムがunique制約が効いているので、同じ値は挿入できない
insert into tmp_names values ('Taro');

-- nullはunique制約が効いていても挿入できるので注意
insert into tmp_names values (null);

select * from tmp_names;