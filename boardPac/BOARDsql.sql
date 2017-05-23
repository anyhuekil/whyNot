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

INSERT INTO YBoard values(
	2,
	'2[콩쥐사항]콩쥐가 밑빠진 독에 물을 붓는데...',
	 '2콩쥐가 밑 빠진 독에 물을 부을 수 있게 도와준 영웅은?\n =>독수리 오형제',
	 'whyNot',
	 '192.168.0.72',
	 sysdate,
	 0
);
INSERT INTO YBoard values(
	3,
	'333333333333333333',
	 '33333333333333333333',
	 'whyNot',
	 '192.168.0.72',
	 sysdate,
	 0
);
INSERT INTO YBoard values(
	4,
	'4공지사항 공지사항 공지사항',
	 '4구라임. 김구라!',
	 'whyNot',
	 '192.168.0.72',
	 sysdate,
	 0
);
INSERT INTO YBoard values(
	4,
	'4공지사항 공지사항 공지사항',
	 '4구라임. 김구라!',
	 'whyNot',
	 '192.168.0.72',
	 sysdate,
	 0
);
INSERT INTO YBoard values(
	5,
	'어노테이션 servlet호출 은 무엇을 대신하는건가??(질문맞나?)',
	'<servlet>\n
		<servlet-name>xmlTester</servlet-name>\n
		<servlet-class>test.A01_SVL_Start</servlet-class>\n
		</servlet>\n
		<servlet-mapping>\n
		<servlet-name>xmlTester</servlet-name>\n
		<url-pattern>/xmltest</url-pattern>\n
	</servlet-mapping>',
	'whyNot',
	'192.168.0.72',
	 sysdate,
	 0
);
COMMIT;


select * from yuser;
select * from YBoard;




select to_date(sysdate) from dual;
select sysdate from dual;
select to_char(sysdate,'yyyy-mm-dd HH24:MI:SS') from dual;








