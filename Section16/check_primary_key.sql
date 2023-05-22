-- check制約について学習する

create table customers(
	id int primary key,
	name varchar(255),
	age int check(age >= 20)
);

insert into customers values(1, 'Taro', 21);

-- check制約でエラーになる
insert into customers values(2, 'Jiro', 19);


-- 複数のカラムに対するcheck制約について学習する
create table students (
	id int primary key,
	name varchar(255),
	age int,
	gender char(1),
	constraint chk_students check((age >= 15 and age <= 20) and gender = 'F' or gender = 'M')
);

insert into students values (1, 'Taro', 18, 'M');

insert into students values (2, 'Sachiko', 18, 'F');

-- check制約でエラーになる
insert into students values (3, 'Taro', 18, 'U');

insert into students values (4, 'Sachiko', 14, 'F');

-- 主キー制約でエラーになる(not null制約とunique制約がつくので)
insert into students values (null, 'Jiro', 16, 'M');

-- 複数のカラムを主キーにする書き方
create table employees (
	company_id int,
	employee_code varchar(8),
	name varchar(255),
	age int,
	primary key(company_id, employee_code)
);

insert into employees values(1, '00000001','Taro', 19);

-- 主キー制約でエラーになる(not null制約とunique制約がつくので)
insert into employees values(null, '00000001','Taro', 19);

