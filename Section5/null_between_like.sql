-- nullの勉強
select * from customers where name is null;

select * from customers where name is not null;

-- 空白の取り出し方()
-- nullと空白は別物
select * from prefectures;

select * from prefectures where name is null;

select * from prefectures where name = '';

-- betweenの学習
-- 5 以上 10以下の場合
select * from users where age between 5 and 10;

-- 5 未満 10より大きいの場合
select * from users where age not between 5 and 10;

-- likeの学習（％は任意の０文字以上）
-- 前方一致
select * from users where name like '村%';

-- 後方一致
select * from users where name like '%郎';

-- 中間一致
select * from users where name like '%a%';
select * from users where name like '%ab%';

-- _の学習（任意の一文字）
select * from prefectures where name like '福_県';
select * from prefectures where name like '福_%';

select * from prefectures where name like '福_%' order by name;