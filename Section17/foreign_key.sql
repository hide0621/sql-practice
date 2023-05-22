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