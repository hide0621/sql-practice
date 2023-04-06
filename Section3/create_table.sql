-- テーブル作成　
create table users (
	id INT , 
	name VARCHAR(10) , -- 可変長文字列
	age INT ,
	phone_number CHAR(13) , -- 固定長文字列
	message TEXT
)

 -- テーブルの削除
drop table users;

-- テーブル作成（主キー付き）　
create table users (
	id INT primary KEY , 
	name VARCHAR(10) , -- 可変長文字列
	age INT ,
	phone_number CHAR(13) , -- 固定長文字列
	message TEXT
)