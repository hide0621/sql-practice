-- case式

select * from users;

select * ,
	case birth_place
		when '日本' then '日本人'
		when 'Iraq' then 'イラク人'
		else '外国人'
	end as 国籍
from users;

select * ,
	case birth_place
		when '日本' then '日本人'
		when 'Iraq' then 'イラク人'
		else '外国人'
	end as 国籍
from users
where id > 30;

select * from prefectures;

select name, 
	case 
		when name in ('徳島県', '香川県', '愛媛県', '高知県') then '四国'
		when name in ('三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県') then '近畿'
		else 'その他'
	end as 地域名
from prefectures;

-- うるう年判定

SELECT name, birth_day,
       CASE
           WHEN EXTRACT(YEAR FROM birth_day) % 4 = 0 THEN 'うるう年'
           ELSE 'うるう年ではない'
       END AS うるう年か否か
FROM users;

-- 本当のうるう年判定

SELECT name, birth_day,
       CASE
           WHEN EXTRACT(YEAR FROM birth_day) % 4 = 0 and EXTRACT(YEAR FROM birth_day) % 100 <> 0 THEN 'うるう年'
           ELSE 'うるう年ではない'
       END AS うるう年か否か
FROM users;

select *  ,
	case
		when student_id % 3 = 0 then test_score_1
		when student_id % 3 = 1 then test_score_2
		when student_id % 3 = 2 then test_score_3
	end as score
from tests_score;


-- order by に case文を書く

select * from prefectures;

select * , 
case 
		when name in ('徳島県', '香川県', '愛媛県', '高知県') then '四国'
		when name in ('三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県') then '近畿'
		else 'その他'
	end as 地域名
from prefectures
order by 
	case 
		when name in ('徳島県', '香川県', '愛媛県', '高知県') then '四国'
		when name in ('三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県') then '近畿'
		else 'その他'
	end ;


select * , 
case 
		when name in ('徳島県', '香川県', '愛媛県', '高知県') then '四国'
		when name in ('三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県') then '近畿'
		else 'その他'
	end as 地域名
from prefectures
order by 
	case 
		when name in ('徳島県', '香川県', '愛媛県', '高知県') then '四国'
		when name in ('三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県') then '近畿'
		else 'その他'
	end
desc;


select * , 
case 
		when name in ('徳島県', '香川県', '愛媛県', '高知県') then '四国'
		when name in ('三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県') then '近畿'
		else 'その他'
	end as 地域名
from prefectures
order by 
	case 
		when name in ('徳島県', '香川県', '愛媛県', '高知県') then 0
		when name in ('三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県') then 1
		else 2
	end;




	

	
	