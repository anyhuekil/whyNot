Create table YUSER(
	NO NUMBER PRIMARY KEY,
	ID VARCHAR2(50) UNIQUE,
	PASS VARCHAR2(50) NOT NULL,
	NAME VARCHAR2(50) NOT NULL,
	GRADE NUMBER NOT NULL
);

Create table YBoard(
	NO number PRIMARY KEY,
	TITLE VARCHAR2(100),
	Contents VARCHAR2(500),
	ID VARCHAR2(50) REFERENCES YUSER(ID),
	IP VARCHAR2(50),
	TIME DATE,
	Lookup NUMBER
);

INSERT INTO YUSER values(
	1, 'whyNot', 'yynn', '관리자', 0
);

INSERT INTO YBoard values(
	1,
	'[콩쥐사항]콩쥐가 밑빠진 독에 물을 붓는데...',
	 '콩쥐가 밑 빠진 독에 물을 부을 수 있게 도와준 영웅은?\n =>독수리 오형제',
	 'whyNot',
	 '192.168.0.72',
	 to_date('2015-7-16 11:26:05','yyyy-mm-dd HH24:MI:SS'),
	 0
);

COMMIT;


select * from yuser;
select * from YBoard;

select sysdate from dual;








