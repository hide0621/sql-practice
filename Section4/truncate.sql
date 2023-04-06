select * from people;

-- truncateの練習
-- deleteと違ってロールバックができずデータが完全に削除されるが、deleteと違ってディスク領域を解放することが出来る
truncate people;