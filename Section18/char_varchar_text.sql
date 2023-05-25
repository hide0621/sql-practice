-- char,varchar,textの使い分け

create table messages (
	name_code char(8),
	name varchar(25),
	message text
);

insert into messages values ('00000001', 'Yoshida Takeshi', 'aaaaba');
insert into messages values ('00000002', 'Yoshida Yusaku', 'aaaaba');

select * from messages;

DROP TABLE patients;

create table patients (
	id serial primary key, -- 1から2147483647まで扱える
	name varchar(50),
	age smallint default 0
);
ALTER TABLE patients ADD COLUMN height real;
ALTER TABLE patients ADD COLUMN weight real;
alter table patients add column score decimal(7, 3); -- 整数部が4,少数部が3まで扱える正確な型

insert into patients (name, age) values('Sachiko', 34);
insert into patients (name, age) values ('Sachiko', 33000); -- 範囲を超えているのでエラーになる
insert into patients (name, age, height, weight) values ('Taro', 44, 175.6789, 67.8934); -- 数を正確に扱っている訳ではないので注意
insert into patients (name, age, score) values ('Jiro', 54, 32.456); -- 正確な数字が挿入される

select * from patients;


create table managers(
	id serial primary key,
	name varchar(50),
	is_superuser boolean 
);

insert into managers (name, is_superuser) values ('Taro', true);
insert into managers (name, is_superuser) values ('Jiro', false);

select * from managers;
select * from managers where is_superuser = true;



