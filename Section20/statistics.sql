create database day_19_21_db;

use day_19_21_db;

show tables;

-- 統計情報の確認
SELECT * from mysql.innodb_table_stats where database_name = 'day_19_21_db';

-- 統計情報の手動更新
analyze table prefectures;

-- SQLを実行せずに実行計画だけを出す
explain SELECT * from customers;

-- SQLを実行して実行計画を出す
explain analyze SELECT * from customers;

SELECT * from customers;
