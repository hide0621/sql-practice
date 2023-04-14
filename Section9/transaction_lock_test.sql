-- トランザクションとロックについて（確認用）

select * from customers;

-- 行ロックされる
update customers set age = 44 where id = 1;


-- for shareなどの検証結果の確認

update customers set age = 44 where id = 1;

select * from customers where id = 1;

