-- char,varchar,textの使い分け

create table messages (
	name_code char(8),
	name varchar(25),
	message text
);

insert into messages values ('00000001', 'Yoshida Takeshi', 'aaaaba');
insert into messages values ('00000002', 'Yoshida Yusaku', 'aaaaba');

select * from messages;