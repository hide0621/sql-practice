explain analyze select * from customers;

explain analyze select * from customers where id = 1;

-- ユニークフルスキャン(const)の場合
explain select * from customers where id = 1;

-- インデックスレンジスキャン（range）の場合
explain select * from customers where id < 1;

-- テーブルスキャンをインデックススキャンにする方法
explain analyze select * from customers where first_name = 'Olivia';

create index idx_customer_first_name on customers(first_name);

-- インデックススキャンではなくてフルスキャンの方がいい場合もある
-- インデックスを貼る方法はその対象が全体の15%までなら早く検索できるので良い
explain analyze select * from customers where gender = 'F';

create index idx_customers_gender on customers(gender);

drop index idx_customers_gender on customers;
drop index idx_customer_first_name on customers;