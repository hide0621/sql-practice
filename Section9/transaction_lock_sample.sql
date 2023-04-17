 -- トランザクションとロックについて（検証用）
 
begin;
 
select * from customers;

-- 主キーでupdate（行ロック）
update customers set age = 43 where id = 1;

-- rollbackするとロックされた別のトランザクションのupdate処理が実行される
rollback;


-- 主キー以外だとテーブル全体がロックされる

begin;

update customers set age = 42 where name = '河野 文典';


-- selectにロックをかける

-- for shareが共有ロック
-- for updateが排他ロック

begin;

select * from customers where id = 1 for share; -- 別のユーザーが行を更新するのを防げる

rollback;


begin;

select * from customers where id = 1 for update; -- 別のユーザーが参照すら出来なくさせられる

rollback;


-- 明示的にロックをかける場合

begin;

 -- lock table customers in EXCLUSIVE mode;
lock table customers in share mode;

select * from customers where id = 1;

update customers set age = 44 where id = 1;

commit;