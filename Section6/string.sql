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