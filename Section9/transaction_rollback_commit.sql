

select * from users;
select * from users where id = 1;

 
-- transactionの開始

begin;

-- update処理をやってみる

update users set name = '奥山 成美' where id = 1;
-- update users set name = '奥村 成美' where id = 1;

select * from users where id = 1;

-- rollbackを行う（トランザクション開始前に戻す）

rollback;

 -- commitを行う（トランザクションをDBに反映）

commit;







