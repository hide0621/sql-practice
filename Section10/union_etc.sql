-- unionについて学習(重複は削除される)

select * from new_students

union

select * from students
order by id;


-- union all について学習(重複を削除しない)

select * from new_students

union all

select * from students 
order by id;

-- カラムが揃ってなくても型が同じなら和集合（union）をとれる
-- ただし、最後のorder byのカラムは最初のクエリのカラムでなければならない
select id, name from students where id < 10

union 

select age, name from users where id < 10
order by id;

-- カラムの数があっていないとunionはできない
select id, name, height from students 
union
select age, name from users;


