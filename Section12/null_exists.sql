-- nullとexistsについて学習する

-- nullを含めないパターン(サブクエリで値を返すものだけ返すから)
select * from customers as c1
where exists (
	select * from customers_2 as c2
	where c1.first_name = c2.first_name 
	and c1.last_name = c2.last_name
	and c1.phone_number = c2.phone_number
);

-- not existsを用いてnullを返すパターン(サブクエリで値を返さないものだけ返すので、nullも返す)
select * from customers as c1
where not exists (
	select * from customers_2 as c2
	where c1.first_name = c2.first_name 
	and c1.last_name = c2.last_name
	and c1.phone_number = c2.phone_number
);

-- not inのパターン（三値論理で偽のものを返すパターン）
select * from customers as c1
where (first_name, last_name, phone_number) not in 
(select first_name, last_name, phone_number from customers_2);

