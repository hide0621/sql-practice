-- viewの練習

select st.name as store_name, it.name as item_name 
from stores as st
inner join items as it
on it.store_id = st.id;

-- viewを作成した
-- viewは以下のクエリの結果を表示させるショートカット
-- よって持っているクエリの結果が変わればviewの結果も変わる
create view stores_items_view as 
select st.name as store_name, it.name as item_name 
from stores as st
inner join items as it
on it.store_id = st.id;

select * from stores_items_view;

-- viewで持ってきたカラムの中で絞り込みなどもできる
select * from stores_items_view where store_name = '山田商店';
select * from stores_items_view order by store_name;
select store_name, count(*)  from stores_items_view group by store_name order by store_name;

update items set name = 'new Item 山田 1' where name = 'Item 山田 1';

-- viewを削除する
drop view stores_items_view;

-- viewの定義変更(drop viewをしてから定義変更ができる)
create or replace view stores_items_view as 
select st.id as store_id,it.id as item_id, st.name as store_name, it.name as item_name 
from stores as st
inner join items as it
on it.store_id = st.id;


