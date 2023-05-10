-- existsでexcept(差)を実現する

-- nullを含めているパターン
select * from customers as c1
where not exists (
	select * from customers_2 as c2
	where 
		c1.id = c2.id and 
		c1.first_name = c2.first_name and 
		c1.last_name = c2.last_name and 
		c1.phone_number = c2.phone_number and 
		c1.age = c2.age
);

-- nullを含めないパターン
select * from customers as c1
where not exists (
	select * from customers_2 as c2
	where 
		c1.id = c2.id and 
		c1.first_name = c2.first_name and 
		c1.last_name = c2.last_name and 
		c1.phone_number = c2.phone_number or (c1.phone_number is null and c2.phone_number is null) and 
		c1.age = c2.age
);

-- existsでintersect（積）を実現する

select * from customers as c1
where exists (
	select * from customers_2 as c2
	where 
		c1.id = c2.id and 
		c1.first_name = c2.first_name and 
		c1.last_name = c2.last_name and 
		c1.phone_number = c2.phone_number or (c1.phone_number is null and c2.phone_number is null) and 
		c1.age = c2.age
);

