select * from accessuser;

insert into accessuser values(
	12, '127.0.0.1', 'seo jong won', '나다', 0, 81
	);
update accessuser set nameCode = null where userno = 12;