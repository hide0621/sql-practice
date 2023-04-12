-- round, floor, ceiling関数

select round(3.14);
select round(3.54);

select round(3.14, 1);
select round(3.14, 2);
select round(3.14, -1);
select round(13.14, -1);

select floor(3.54);

select ceiling(3.14);

-- random関数

select random(); 
select floor(random() * 10); 

-- power関数

select power(3, 4);
select power(2, 4);

select weight / power(height / 100, 2) as BMI from students; 

-- coalesce関数

select * from tests_score;

select coalesce(null, null, null, 'AA', null, 'B');

select coalesce (test_score_1, test_score_2, test_score_3) as score from tests_score;
