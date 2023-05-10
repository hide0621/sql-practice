select * from departments;

select * from employees;

-- existsの練習(※でなはく1で書くことが多い)

select * from employees as em
where exists (
	-- select * from departments as dt
	-- select id from departments as dt
	select 1 from departments as dt
	where em.department_id = dt.id
	-- where dt.id = em.department_id
);

-- in で書くとこうなる

select * from employees as em
where em.department_id in (
	select id from departments
);

-- exitsの中にinを含める書き方

select * from employees as em
where exists (
	select 1 from departments as dt where dt.name in ('営業部', '開発部') 
	and dt.id = em.department_id
);

-- exitsの練習

select * from customers as ct
where exists (
	select 1 from orders as od 
	where ct.id = od.customer_id 
	and od.order_date = '2020-12-31'
);

select * from customers as ct
where not exists (
	select 1 from orders as od 
	where ct.id = od.customer_id 
	and od.order_date = '2020-12-31'
);

-- 主クエリのidがサブクエリのidに紐づくパターン
-- where内では主クエリのidから実行する
select * from employees as em1
where exists (
	select 1 from employees as em2 where em1.manager_id = em2.id
);

-- サブクエリのidが主クエリのidに紐づくパターン
-- where内では主クエリのidから実行する
select * from employees as em1
where exists (
	select 1 from employees as em2 where em2.manager_id = em1.id
);
