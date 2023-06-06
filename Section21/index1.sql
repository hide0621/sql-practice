use day_19_21_db;
 
-- インデックスを貼ってない場合
/*
 -> Limit: 200 row(s)  (cost=50983 rows=200) (actual time=0.272..112 rows=200 loops=1)
    -> Filter: (customers.first_name = 'olivia')  (cost=50983 rows=49676) (actual time=0.253..112 rows=200 loops=1)
        -> Table scan on customers  (cost=50983 rows=496756) (actual time=0.25..99.9 rows=192550 loops=1)
 */
explain analyze select * from customers where first_name = 'olivia';

/*
 -> Limit: 200 row(s)  (cost=50996 rows=200) (actual time=0.271..15.2 rows=200 loops=1)
    -> Filter: (customers.age = 41)  (cost=50996 rows=49676) (actual time=0.27..15.2 rows=200 loops=1)
        -> Table scan on customers  (cost=50996 rows=496756) (actual time=0.232..14.1 rows=10108 loops=1)
 */
explain analyze select * from customers where age = 41;

-- 複合インデックスを貼ってないので少し遅くなる
/*
 -> Limit: 200 row(s)  (cost=35.6 rows=10) (actual time=0.547..5.93 rows=10 loops=1)
    -> Filter: ((customers.age = 42) and (customers.first_name = 'olivia'))  (cost=35.6 rows=10) (actual time=0.547..5.93 rows=10 loops=1)
        -> Intersect rows sorted by row ID  (cost=35.6 rows=10.2) (actual time=0.544..5.92 rows=10 loops=1)
            -> Index range scan on customers using idx_customers_first_name over (first_name = 'olivia')  (cost=24.9 rows=503) (actual time=0.147..0.459 rows=503 loops=1)
            -> Index range scan on customers using idx_customers_age over (age = 42)  (cost=7.15 rows=10086) (actual time=0.0347..4.73 rows=10082 loops=1)
 */
explain analyze select * from customers where first_name = 'olivia' and age = 42;

-- インデックスを貼っている場合
create index idx_customers_first_name on customers(first_name);

create index idx_customers_age on customers(age);

drop index idx_customers_first_name on customers;
drop index idx_customers_age on customers;

create index idx_customers_first_name_age on customers(first_name,age);

/*
 -> Limit: 200 row(s)  (cost=273 rows=200) (actual time=0.566..1.49 rows=200 loops=1)
    -> Index lookup on customers using idx_customers_first_name (first_name='olivia')  (cost=273 rows=503) (actual time=0.565..1.48 rows=200 loops=1)
 */
explain analyze select * from customers where first_name = 'olivia';

/*
 -> Limit: 200 row(s)  (cost=3245 rows=200) (actual time=0.409..1.11 rows=200 loops=1)
    -> Index lookup on customers using idx_customers_age (age=41)  (cost=3245 rows=10100) (actual time=0.408..1.1 rows=200 loops=1)
 */
explain analyze select * from customers where age = 41;

-- 複合インデックスを貼っているので早い
/*
 -> Limit: 200 row(s)  (cost=3.56 rows=10) (actual time=0.356..0.362 rows=10 loops=1)
    -> Index lookup on customers using idx_customers_first_name_age (first_name='olivia', age=42)  (cost=3.56 rows=10) (actual time=0.355..0.36 rows=10 loops=1)
 */
explain analyze select * from customers where first_name = 'olivia' and age = 42;

-- 複合インデックスを貼ると最初のカラムだけの絞り込みの際にもそのカラムにインデックスが貼られているが、
-- そうでないカラムにはインデックスが貼られてないので注意
/*
 -> Limit: 200 row(s)  (cost=50437 rows=200) (actual time=0.139..11.6 rows=200 loops=1)
    -> Filter: (customers.age = 41)  (cost=50437 rows=49676) (actual time=0.138..11.6 rows=200 loops=1)
        -> Table scan on customers  (cost=50437 rows=496756) (actual time=0.12..10.8 rows=10108 loops=1)
 */
explain analyze select * from customers where age = 41;
