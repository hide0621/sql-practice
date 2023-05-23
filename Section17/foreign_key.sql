-- 参照整合性制約について勉強する

create table schools (
	id int primary key,
	name varchar(255)	
);

-- 外部キーを作成する
create table students(
	id int primary key,
	name varchar(255),
	age int,
	school_id int,
	foreign key(school_id) references schools(id)
);

insert into schools values (1, '北高校');

insert into students values (1, 'Taro', 18, 1);

-- 外部キー制約が効いているのでエラーになる(参照整合性のエラー)
update schools set id = 2;

-- 複数のカラムに外部キーを設定する
create table salaries (
	id int primary key,
	company_id int,
	employee_code char(8),
	payment int,
	paid_date date,
	foreign key (company_id, employee_code) references employees(company_id, employee_code)
);

select * from employees;

-- 外部キー制約が効いているのでエラーになる(参照整合性のエラー)
insert into salaries values (1, 1, '00000003', 1000, '2020-01-01');

drop table students;

-- 外部キー制約のオプションを試す(on delete, on update cascade)
create table students(
	id int primary key,
	name varchar(255),
	age int,
	school_id int,
	foreign key(school_id) references schools(id)
	on delete cascade on update cascade 
);

insert into students values (1, 'Taro', 18, 1);

select * from students;
select * from schools;

update schools set id = 3 where id = 1;

delete from schools;


drop table students;

-- 外部キー制約のオプションを試す(on delete, on update set null)
create table students(
	id int primary key,
	name varchar(255),
	age int,
	school_id int,
	foreign key(school_id) references schools(id)
	on delete set null on update set null 
);

insert into schools values (2, '南高校');
insert into students values (2, 'Taro', 16, 2);

select * from students;

update schools set id = 3 where id = 1;

update students set school_id = 3 where school_id is null;

insert into schools values (1, '北高校');
insert into students values (1, 'Taro', 16, 1);

select * from schools;
delete from schools where id = 3;


drop table students;
-- 外部キー制約のオプションを試す(on delete, on update set default)
create table students(
	id int primary key,
	name varchar(255),
	age int,
	school_id int default -1,
	foreign key(school_id) references schools(id)
	on delete set default on update set default
);

select * from schools;

insert into schools values (1, '北高校');

insert into students values (1, 'Taro', 17, 1);

select * from students;

-- PostgreSQLでも外部キー制約のset defaultはエラーになってしまう
update schools set id = 3 where id = 1;