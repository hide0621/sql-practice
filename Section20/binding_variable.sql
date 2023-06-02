-- ハードパース、ソフトパースについて学習

-- ハードパースの場合
select * from customers where id = 1;
select * from customers where id = 2;
select * from customers where id = 3;

-- ソフトパースの場合(バインド変数を使う)
set @customer_id = 2;
select * from customers where id = customer_id;