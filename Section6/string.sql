-- lnegth（バイト数）

select length('ABC');

select length('あいう');

select name, length(name) from users;

-- char_length（文字数）

select char_length('ABC');

select char_length('あいう');

select name, char_length(name) from users; 

-- 空白の削除

select ltrim(' ABC ');
select rtrim(' ABC ');
select trim(' ABC ');

select * from employees where char_length(name) <> char_length(trim(name));  

update employees set name = trim(name) 
where char_length(name) <> char_length(trim(name));  

-- replace（置換）

select replace('I lile an apple' , 'apple', 'lemon');

select * from users where name like 'Mrs%';

select replace(name , 'Mrs' , 'Ms') from users where name like 'Mrs%';

update users set name = replace(name , 'Mrs' , 'Ms') where name like 'Mrs%';

select * from users where name like 'Ms%';

-- upper , lower(大文字、小文字)

select upper('apple'); 
select lower('APPLE'); 

select name, upper(name), lower(name) from users;

-- substring(一部取り出し)

select substring(name, 2, 3) , name from employees; 

select * from employees where substring(name, 2, 1) = '田'; 

-- reverse（逆順にする）

select reverse(name), name from employees; 