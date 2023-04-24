-- 新しいDBの作成

create database day_10_14_db;

-- 現在使用しているDBを表示する

SELECT current_database();


-- DB一覧を表示する

SELECT datname FROM pg_database;


-- 現在のDBにてpublicスキーマのテーブルが全て表示される

SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';



