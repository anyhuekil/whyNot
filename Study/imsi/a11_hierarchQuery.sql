/*
	계층형 질의
	오라클에서 계층형 구조의 테이블을 효과적으로 지원하기위한 쿼리를 말한다.
	(self join을 효과적으로 처리)
	
	게시판에서 자주 활용되는 대표적인 예.
*/
	select * from emp;
	--- mgr 관리자, empno와 연동되어잇음.
	--- 저번에 배운 self join.
	select a.empno, a.ename, a.mgr , b.empno, b.ename from emp a, emp b
	where a.mgr = b.empno;
	
	
	/*
	계층형구조. 
		상하위 관계에 테이블 구조를 설정한것을 말한다.
			ex) 할아버지 (id, parentId, role: 
					1, 0, '할아버지'		
					2, 1, '아버지'
					3, 1, '삼촌'
					4, 2, '아들'
					5, 3, '사촌')
	
	계층형 sql형식
		select ... 컬럼
		from 테이블명
		where 조건
	
	start with 조건(비교연산자) 
		조건) 컬럼= 데이터   // 계층sql의 시작조건 처리 - 최상위 계층의 조건처리!
		cf) 가족관계의 최상위 계층은 parentId = 0;
			우리가족만 계층내용을 처리하고자 할때엔 parentId = 2 // 아버지계층이후로만 나타나게됨.
	
	????>> connect by [nocycle] 조건 and 조건
		: 상위 관계를 연결시켜주는 조건에 대한 선언. nocycle: 반복여부에대한 선언.
		ex) connect by id = parentId
		현재 id값을 확인해서 상위에 있는 id값이 있는지 하위데이터에 확인해서 
		계층구조로 나타나게하는것을 말한다. prior : 사전 - 상하위 관계에 대한 처리.
	
	order siblings by 컬럼[asc/desc]
		해당 계층구조 컬럼에 대한 같은 레벨의 정렬순서를 설정한다.
		최근에 등록된 현제를 먼저 list하는가, 먼저등록된 형제를 먼저 list하는가.
		level이 같고 부모가 같은 데이터들에 대한 list우선 순위를 결정.
	
	*/
	select * from family
	order by id;
	drop table family;
	
	create table family (
		id number(7,0),
		parentId number(7,0),
		role varchar2(10)
	);
	alter table family modify role varchar2(50);
	insert into family values(1, 0, '할아버지');
	insert into family values(2, 1, '아버지');
	insert into family values(3, 1, '삼촌');
	insert into family values(4, 2, '아들');
	insert into family values(5, 3, '사촌');
	
	select * from family
	start with parentId = 0
	connect by prior id= parentId;

	/*
		emp테이블을 기준으로 계층구조의 내용처리하고자한다.
	*/
	
	select * from emp;
	select min(mgr), max(mgr) from emp;  /* 7566 ~ 7902 */
	
	select ename, empno, mgr
	from emp 
	start with mgr is null  --- 최상 계층의 조건은 mgr이 null일때..
	connect by prior empno = mgr;  
	/* 결과값보면 하위내용이 연결이된다. king의 empno = Jones의 MGR..... 이런식으로 계속 진행됨.
	 이거시 답변형 게시판의 핵심!!!
	
	계층형으로 mgr이 null일떄부터 시작해서 , 하위계층이 empno로 mgr이 있는지 여부를 확인하여,
	해당하는 mgr의 데이터가 empno에 없을떄까지 일단하나의 node전체를 list한다.
	
	계층확인법:
	select 쪽에 level 이라는 계층연산을 넣어본다.
		ex)	select level, ename, empno, mgr
			
	계층형의로 간격을 처리.. lpad('왼쪽에 입력할 문자', 반복할문자수)
	>> 레벨별로 계층형이 표시될수 있게끔 처리..
		'    ' 공백을 4칸씩. >> lpad(' ', 4*(level) ) || job
	
	
	*/
	select level, ename, empno, mgr, lpad(' ', 4*(level) ) || job
	from emp 
	start with mgr is null  --- 최상 계층의 조건은 mgr이 null일때..
	connect by prior empno = mgr;  
	
	/*
		확인예제: 
			family를 계층구조로 출력.
			출력형식: level role 계층구조공백처리, 이름.
	*/

	select  numid,parentnumid, level, lpad(' ', 4*(level-1)) || ROLE01 role, NAME 
	from family
	start with PARENTNUMID = 0
	connect by prior NUMID = parentnumid  
				/* 이거 순서에도 주의를 줘야함..*/
	order siblings by NUMID desc;
		/*asc : 최근 update한것먼저..
			desc: 최근update는 계층에서 가장 마지막쪽으로..
		*/


	select * from family;
	insert into family values(5, 1, '큰아버지', '홍정인');
	insert into family values(6, 0, '작은할아버지', '홍정식');

	/*
		board 계층형 게시판 테이블 만들어서 list하기..
		no글번호, parentno, title타이틀, content내용, credte등록일자, uptdte수정일자, writer등록자, readcnt조회수 
		number, number, varchar2(50), varchar2(1000), date, date, varchar2(50), number	
	*/

	create table board(
		no number(7,0),
		parentno number(7,0),
		title varchar2(50),
		content varchar2(1000),
		credte date,
		uptdte date,
		writer varchar2(50),
		readcnt number(7,0)
	);

	select * from board;
	drop table board;
	insert into board values(1, 0, '시작', '난 이제 시작인데.', sysdate, sysdate, 'moneymashi', 5);
	insert into board values(2, 1, '시작', '어? 나도 이제시작인데.', sysdate, sysdate, 'money', 5);
	insert into board values(3, 1, '시작', 'ㅋㅋㅋㅋ.', sysdate, sysdate, 'monei', 7);
	insert into board values(4, 2, '시작', '난 이제 시작인데.', sysdate, sysdate, 'moneymashi', 5);
	insert into board values(5, 3, '시작', '난 이제 시작인데.', sysdate, sysdate, 'moneymashi', 5);
	insert into board values(6, 3, '시작', '어? 나도 이제시작인데.', sysdate, sysdate, 'money', 5);
	insert into board values(7, 2, '시작', 'ㅋㅋㅋㅋ.', sysdate, sysdate, 'monei', 7);
	insert into board values(8, 2, '시작', '난 이제 시작인데.', sysdate, sysdate, 'moneymashi', 5);
	insert into board values(9, 7, '시작', '난 이제 시작인데.', sysdate, sysdate, 'moneymashi', 5);
	insert into board values(10, 3, '다시', '이게 어디로가나', sysdate, sysdate, 'marhdano', 8 );
	
	select rownum, level, no, parentno, title, lpad(' ', 4*(level-1)) ||content 레벨별게시계층, to_char(credte, 'YY"년"MM"월"DD"일"') 게시시간, 
	to_char(uptdte,'yy/MM/DD/HH24:MI:SS') 수정시간, writer, readcnt from board
	start with parentno = 0
	connect by prior no = parentno
	order siblings by credte desc ;
	
	select rownum, a.*
	from emp a
	order by empno desc;
	/* rownum: 데이터list에서 고유로 numbering 이 붙는 키워드.
		하지만 orderby에 영향이 없어서... 공부용이 아닌 display용인듯하다.
	
	*/
	
	
	
	
	
	
	
	