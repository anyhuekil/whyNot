/*

	16. a11_hierarchQuery

계층형 질의
오라클에서 계층형 구조의 테이블을 효과적으로 지원하기 위한
query를 말한다. (self join을 효과적 처리)

계층형 구조 : 상하위 관계에 테이블 구조를 설정한 것을 말한다.
ex)         할아버지(id, parentId, role : 1, 0, '할아버지') 
   아버지(2,1,'아버지')      삼촌(3,1,'삼촌')    
 아들(4,2,'아들')          사촌동생(5,3,'사촌')
손자(6,4,'손자')
계층형 sql 형식
select ....컬럼
from 테이블명
where 조건
start with 조건(비교연산자 ex)컬럼=데이터  : 
                              계층sql의 시작조건 처리-최상위 계층의 조건처리.
                  ex) 가족관계의 최상위 계층은 parentId=0
				    우리가족만 계층 내용을 처리하고자 할 때,
					 parentId=2(아버지 계층이후로 나타남)
connect by [nocycle]  조건 and 조건
    상위관계를 연결시켜주는 조건에 대한 선언. nocycle :반복여부에 대한 처리.
	ex) connect by id = parentId  
	  현재 id값을 확인해서 상위에 있는 id값이 있는지 하위데이터에 확인해서
	  계층구조로 나타나게 하는 것을 말한다. prior:사전 - 상하위 관계에 대한
	                                       처리하게 됨 					 
	ex) emp 테이블을 기준으로 계층구조의 내용 처리하고자 한다.
order siblings by 컬럼 [asc/desc]
 해당 계층구조 컬럼에 대한 같은 레벨의 정렬 순서를 설정한다.
 최근에 등록된 형제를 먼저 list하느냐? 먼저 등록된 형제를 먼저 list하느냐?
 level이 같고, 부모가 같은 데이터들에 대한 list 우선 순위를 결정.  	

## column 옵션  :level -해당 계층의 계층단계을 표시
	ex) 최상위 데이터는 1, 차상위는 2...	
	
*/
select * from emp;
-- mgr(관리자 번호)인데, empno에 매핑되어 있음..
select level, empno, lpad(' ', 4*(level)) || job job, mgr
from emp
start with mgr is null --최상계층의 조건은 mgr이 null일 때
connect by prior empno = mgr;
-- 최상컬럼과 하위 컬럼과 연결처리.
/*  
계층형으로 mgr이 null일 때 부터 시작하여, 하위계층이 empno로 mgr이 있는지
여부를 확인하여, 해당하는 mgr의 데이터가 empno에 없을 때 까지
일단 하나의 node전체를 리스팅한다.
계층형의로 간격을 처리... lpad('왼쪽에 입력할 문자', 반복할 횟수)
 레벨별로 계층형이 표시될 수 있게끔 처리..
 ' ' :공백을 4칸씩  lpad(' ', 4*(level)) || job
*/
-- ex) 확인예제 family를 계층구조로 출력하세요.
-- 출력형식 :  level  role(계층구조공백처리), 이름
select level, lpad(' ',4*(level-1)) || role01 role, name 
from family
start with parentnumid=0
connect by prior numid=parentnumid
order siblings by numid asc;
-- role01==> numid
select * from family;
insert into family values(5,1,'큰아버지','홍정인');
insert into family values(6,0,'작은할아버지','홍길상');
/*
board 계층형 게시판 테이블 만들어서 list하기..
	고유id(글번호), 타이틀, 내용, 등록일자, 수정일자, 작성자, 조회수
	no,    parentno, title,        content,       credte,uptdte, writer,    readcnt
	number,number, varchar2(50), varchar2(1000), date, date, varchar2(50), number
*/
create table board(
	no number primary key,
	parentno number,
	title varchar2(50),
	content varchar2(1000),
	credte date,
	uptdte date,
	writer varchar2(50)
);
select * from board;
-- 1, 0, '글등록시작','냉무',sysdate,sysdate,'작가01'
insert into board values(1, 0, '글등록시작','냉무',sysdate,sysdate,'작가01');
insert into board values(2, 0, '2번째네요!이런!','냉무',sysdate,sysdate,'작가02');
-- 첫번째 글에 대한 답글로 처리..
insert into board values(3, 1, '1번째를 놓쳤습니다.','냉무',sysdate,sysdate,'홍영심');
insert into board values(4, 3, 'ㅎㅎ 등록이 빨랐네요','냉무',sysdate,sysdate,'작가01');
insert into board values(5, 1, '좋은 글 부탁합니다!','냉무',sysdate,sysdate,'작가03');
-- 글번호, 타이틀, 등록일(YYYY/MM/DD), 등록자
select rownum , no, lpad(' ',4*(level-1)) || title title, 
       to_char(credte,'YYYY/MM/DD') credte, writer
from board
start with parentno=0  -- 최상위 계층 조건 처리
connect by prior no = parentno -- 계층 연결 조건 설정
order siblings by no desc;
-- 최근에 등록된 글을 최상위로 처리
select * from board;
insert into board values(7, 1, '첫번째가 좋죠~~',
		'냉무',sysdate,sysdate,'하이맨');
select rownum, a.*
from emp a
order by empno desc;
-- rownum : 데이터 list에서 고유로 numbering이 붙는 키워드..




/*	17. a12_dml_adv */
/*
여러가지 고급 DML query!!
1. 다중 테이블에 다중행 입력하기..
	insert 구문을 여러번 써서 데이터를 입력하는 경우가 많은 데이터를 입력
	할 때 번거러운 경우가 있다.
	한번은 suberquery를 통해서 여러 동일한 구조의 테이블에 입력할 때,
	insert all 구문을 활용하면 손쉽게 처리할 수 있다.
	1) 형식
	INSERT ALL
	INTO 테이블1명 VALUES(컬럼1, 컬럼2, 컬럼3)
	INTO 테이블2명 VALUES(컬럼1, 컬럼2, 컬럼4)
	SELECT 컬럼1, 컬럼2, 컬럼3, 컬럼4
	FROM 테이블명
	WHERE 조건
	EX) EMP테이블에서 구조복사테이블 생성 
	    	EMP_HIR(EMPNO, ENAME, HIREDATE)
			EMP_MGR(EMPNO, ENAME, MGR)
		원본 EMP테이블에서 부서번호가20인 데이터를 해당 테이블에
		데이터 입력처리..
		
*/
-- 구조복사테이블 생성하기..
	CREATE TABLE EMP_HIR
	AS
	SELECT EMPNO, ENAME, HIREDATE
	FROM EMP WHERE 1=0;
	SELECT * FROM EMP_HIR;
	CREATE TABLE EMP_MGR
	AS
	SELECT EMPNO, ENAME, MGR
	FROM EMP WHERE 1=0;
INSERT ALL
	INTO EMP_HIR VALUES(EMPNO,ENAME, HIREDATE)
	INTO EMP_MGR VALUES(EMPNO, ENAME, MGR)
	SELECT EMPNO, ENAME, HIREDATE, MGR
	FROM EMP
	WHERE DEPTNO=10;
/*
서버 쿼리를 이용한 데이터 수정하기..
UPDATE 테이블명
SET (변경할컬럼1, 변경할컬럼2) = (SELECT 컬럼1,컬럼2 FROM 테이블)
WHERE 조건..
EX) 20번 부서의 지역명을 40번 부서의 지역명으로 변경하기 위해서 서버쿼리
	를 활용해보자..
*/		
CREATE TABLE DEPT01
AS
SELECT * FROM DEPT;
-- 입력할 데이터 LOADING(SUBQUERY)
SELECT DNAME, LOC
FROM DEPT
WHERE DEPTNO=40; 
-- MAIN QUERY
UPDATE DEPT01
SET (DNAME, LOC) =( SELECT DNAME, LOC
					FROM DEPT
					WHERE DEPTNO=40)
WHERE DEPTNO=20;
SELECT * FROM DEPT01;
SELECT * FROM EMP;
CREATE TABLE EMP11
AS
SELECT *
FROM EMP;

UPDATE EMP11
SET (SAL,DEPTNO)=(
	SELECT SAL,DEPTNO
	FROM EMP11
	WHERE JOB='PRESIDENT')
WHERE JOB='CLERK';
SELECT * FROM EMP11
WHERE JOB='CLERK';
/*
MERGE 처리..
 DATA MINGRATION(데이터 이관처리) 할때, 많이 활용된다.
 테이블  A, 테이블 B 로 데이터를 이관처리시, 부서가 달라 입력되어 있는 데이터도 있고,
 신규로 입력해야될 데이터도 있으며, 입력되어 있는 데이터는 특정 컬럼을 수정처리해야
 될 경우 많이 활용된다.
형식 ex) 테이블A에 있으나  테이블B에는 없는 데이터는 insert처리
            테이블A에 있고, 테이블B에 있으나 특정한 컬럼을 수정하는 것을 update처리
		두가지 내용을 한번에 처리하는 것을 MERGE
	MERGE INTO 통합할테이블  EX) 테이블B
		USING 이전및참조할테이블  ex) 테이블A
		ON 조건처리-일반적으로 두 테이블의 KEY값(공통컬럼)을 조건으로 처리한다.
		                       ex) 테이블A.컬럼01=테이블B.컬럼01
		WHEN MATCHED THEN -- 두개의 테이블 KEY데이터가 공통으로 있을 때.
		    업데이터 관련처리         ex) 테이블A의 컬럼01과 테이블B에 컬럼01에
			update set 		해당 데이터가 동일한 경우..
			통합할테이블.변경할컬럼=이전및참조할테이블.컬럼	
			              ex) 테이블B.변경컬럼 = 테이블A.컬럼														
		WHEN NOT MATCHED THEN -- 한쪽 테이블에 데이터 없는 경우
								EX) 테이블A에는 있으나, 테이블 B에는 없는 경우
			입력관련처리..					
		    insert [테이블X] values(이전및참조할테이블.컬럼...)
								EX) INSERT VALUES(테이블B.컬럼명....);
*/
/*
EMP01, EMP02 데이터를 로딩해서..EMP01에 데이터 머지처리..
1. EMP01 복사테이블 만들기.
2. EMP02 복사테이블 만들기  EMP에 JOB='MANAGER'만... 
   EMP02 JOB ==> 'test'로 UPDATE (##empno는 동일, job이 다른 데이터)
   EMP02 입력 7935 '홍길동', 'SUPERMAN' 7839 SYSDATE 4000 100 40 
   	(## empno가 EMP01에 없는 데이터)
*/
select * from emp order by empno desc;
DROP TABLE EMP01;
CREATE TABLE EMP01
AS
	SELECT * FROM EMP; -- EMP01 복사테이블 생성
SELECT * FROM EMP01; -- 이 테이블에 머지 처리..
DROP TABLE EMP02;
CREATE TABLE EMP02
AS
	SELECT * FROM EMP
	WHERE JOB='MANAGER';
SELECT * FROM EMP02;
UPDATE EMP02
SET JOB='TEST'; -- EMP02의 JOB을 'TEST'로 변경
-- EMP02 입력 7935 '홍길동', 'SUPERMAN' 7839 SYSDATE 4000 100 40 
INSERT INTO EMP02 VALUES(7935,'홍길동','SUPERMAN',7839,SYSDATE, 4000,100,40);
SELECT * FROM EMP01;
SELECT * FROM EMP02;
MERGE INTO EMP01  -- 최종 데이터는 EMP01에 처리
	 USING EMP02   -- EMP02데이터를 사용함..
	 ON (EMP01.EMPNO = EMP02.EMPNO) -- 해당 KEY값이 EMPNO가 있는지 여부에 따라 UPDATE/INSERT                   
WHEN MATCHED THEN -- EMPNO값이 같을 때..
	UPDATE SET
	  EMP01.JOB = EMP02.JOB  -- EMP02.JOB 데이터 즉, 'test'데이터를 EMP01.JOB에 UPDATE
WHEN NOT MATCHED THEN --동일한 EMPNO값이 EMP01에 없을 경우,
	INSERT VALUES(EMP02.EMPNO, EMP02.ENAME, EMP02.JOB, EMP02.MGR, EMP02.HIREDATE,
	              EMP02.SAL, EMP02.COMM,EMP02.DEPTNO); 
SELECT * FROM EMP01 ORDER BY EMPNO;				  	  
/*
확인예제. 
EMP의 복사테이블 EMP03
EMP에서 부서번호(DEPTNO)가 30인 데이터를 EMP04로 복사테이블 만들기
	EMP04의 HIREDATE를 오늘날(SYSDATE)로 UPDATE 처리..
EMP04에 7370 '원더걸' 'SUPERMAN' 7839 SYSDATE 6000 400 40 데이터 입력
두 테이블 머지처리..
*/
DROP TABLE EMP03;
CREATE TABLE EMP03
AS
	SELECT * FROM EMP;
DROP TABLE EMP04;
CREATE TABLE EMP04
AS 
	SELECT * FROM EMP
	WHERE DEPTNO=30;
UPDATE EMP04
SET HIREDATE=SYSDATE;
INSERT INTO EMP04 VALUES(7370,'원더걸','SUPERMAN',7839,SYSDATE,6000,400,40);
MERGE INTO EMP03
 USING EMP04
 ON	(EMP03.EMPNO=EMP04.EMPNO)
WHEN MATCHED THEN
	UPDATE SET
		EMP03.HIREDATE=EMP04.HIREDATE
WHEN NOT MATCHED THEN
	INSERT VALUES(EMP04.EMPNO, EMP04.ENAME, EMP04.JOB, EMP04.MGR, EMP04.HIREDATE,
				  EMP04.SAL, EMP04.COMM, EMP04.DEPTNO);
SELECT * FROM EMP03;
SELECT * FROM EMP;				  
	



/*	13. a13_constraintsExp	*/

select * from a01_not_nullExp;




/*	14.a14_constraintsExp */
select * from a01_not_nullExp;
select * from a02_nullExp;
-- 묵시적 null 값 입력. 제약조건이 있기에 에러발생..
insert into a01_not_nullExp(job) values('프로그래머1');
-- 명시적 null 값 입력..
-- 테이블명(컬럼명시X) ==> 전체 컬럼에 대한 입력을 처리하겠다
-- values(전체컬럼에 들어갈 데이터를 명시)
insert into a02_nullExp values(null, '홍길동','프로그래머3');
select * from a02_nullExp;
insert into a01_not_nullExp values(null, '신길동','프로그래머3');
-- 명시적으로 null값에 호출하더라도 제약조건이 하나라도 있으면 입력이
-- 되지 않는다.
/*
데이터 딕션어리(data dictionary)를 통해 constraints 확인하기..
user_constraints : 전체 테이블에 대한 제약조건 내용 확인하기..
constraint_type
 제약조건의 유형에 대한 내용을 선언하는 부분.
 P : PRIMARY KEY : ## - 제약조건에 NOT NULL, UNIQUE를 설정한다.
 						보통 메인테이블에서 KEY로 정의하는 컬럼설정.
 R : FOREIGN KEY(외래키) : 해당 컬럼에 데이터다 참조한 다른 테이블에
 						데이터가 반드시 있어야 처리되는 경우
						EX) dept에 deptno인 경우, 부서번호에 대한 정보
						부서정보 key deptno가 등록되어 있어야지..
						emp테이블에서 deptno에 데이터 입력할 수 있게끔 
						처리해야 무결성을 지킬 수 있다.
 U : UNIQUE (유일키설정) : 해당 컬럼의 데이터가 다른 컬럼의 데이터와 비교
 						해서 반드시 하나의 유일한 데이터가 되게 할 때
						설정하는  옵션.												
 						EX) DEPT테이블에 DEPTNO가 다른 데이터와 비교해서
						같은 DEPTNO로 다른 DNAME(부서이름)이 입력되게
						되면 데이터 무결성에 문제가 발생하기에 이를 입력
						당시 사전에 에러를 발생시켜 무결성을 확보하기 위
						해서 처리한다.
						20 회계감사  
						20 총무      ==> 무결성에 문제를 발생시킴.
 C : CHECK              특정한 컬럼에 특정한 데이터만 들어오게 처리하는
 						제약 조건을 말한다. 
						EX) EMP에 컬럼으로 GENDER(성별)을 설정했을 때,
						F(여자), M(남자)만 들어오게 하여, 데이터 자체
						에 대한 통일을 유지하여 무결성 확보를 하기 위한
						목적으로 사용된다.					
*/
select * from user_constraints;
/*
UNIQUE : 유일키 설정 처리..
1. 연습테이블만들기( EMP03)
2. 컬럼에 유일키 설정하기(UNIQUE)
3. 데이터 입력 TEST - 데이터를 동일할 때, 어떤 에러가 발생하는지 확인.
4. 데이터 딕션너리에서 해당 제약사항 확인하기..
*/
SELECT * FROM EMP03;
DROP TABLE EMP03;
CREATE TABLE EMP03(
	EMPNO NUMBER UNIQUE, -- EMPNO가 중복이 되지 않게 제약조건으로 설정
	ENAME VARCHAR2(30),
	JOB VARCHAR2(30)
);
SELECT * FROM EMP03;
INSERT INTO EMP03 VALUES(1000,'ALLEN','SALESMAN');
INSERT INTO EMP03 VALUES(1001,'JONES','MANAGER');
-- 동일한 값 1000은 컬럼으로 설정시 UNIQUE로 설정했기에 에러가 발생한다.
INSERT INTO EMP03 VALUES(1000,'HIMAN', 'SUPERMAN');
-- DATA DICTIONARY를 통해서 제약사항을 확인할 수 있다.
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP03';
/*
확인예제 - 테이블 생성시 DROP하고, 새로 생성처리.
STUDENT라는 학생테이블에 컬럼으로  학번, 이름, 학과을 설정한 후에,
제약조건으로 학번에 UNIQUE를 설정해서 생성하세요.
데이터 입력으로 해당 내용이 처리되는지 확인
데이터 딕션너리를 통해서 제약조건이 등록되어 있는지 확인..
*/
DROP TABLE STUDENT; 
CREATE TABLE STUDENT(
	STNUMBER VARCHAR2(10) UNIQUE,
	NAME VARCHAR2(50),
	MAJOR VARCHAR2(100)
);
INSERT INTO STUDENT VALUES('C070801','홍정아','컴퓨터공학');
INSERT INTO STUDENT VALUES('C070802','김정기','경영정보');
INSERT INTO STUDENT VALUES('C070801','이준희','멀티미디어');
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='STUDENT';
/*
제약 조건명을 사용자 정의하기..
1. 테이블 생성시, 설정
	형식
	create table 테이블명
		제약조건선언할컬럼 데이터type ex) empno number
		constraint 제약조건명(테이블명_컬럼명_제약조건유형축약) 제약조건
							ex) constraint emp_empno_pk primary key,

*/
create table emp05(
	empno number constraint emp_empno_pk primary key,
	ename varchar2(20)
);
select * 
from user_constraints
where table_name='EMP05';

/*
확인예제..
   PROFESSOR 테이블을 생성하된
	PROID, NAME ==> 둘다 CONSTRAINT를 설정하는데,
			NOT NULL, UNIQUE로 이름을 지정해서 설정하세요.
	MAJOR
   user_constraints에서 지정된 제약조건이름 검색해서 확인.
*/

create table PROFESSOR(
	PROID VARCHAR2(10) CONSTRAINT PROFESSOR_PROID_NN NOT NULL,
	NAME VARCHAR2(30) CONSTRAINT PROFESSOR_NAME_UQ UNIQUE,
	MAJOR VARCHAR2(20) 
);
select * 
from user_constraints
where table_name='PROFESSOR';
/*
하나의 컬럼이 아니라, 두개의 이상의 컬럼으로 제약조건을 선언하는 경우..
EX) 학생테이블을 KEY을 컬럼을 신규로 생성하는 것이 아니라.
	GRADE(학년) PART(반) NO(번호)  이름..
형식
	CREATE TABLE 테이블명(
		컬럼명1 데이터TYPE,
		컬럼명2 데이터TYPE,
		컬럼명3  데이터TYPE,
		CONSTRAINT 제약조건명(테이블_컬럼복합_제약단축) 제약조건(컬럼1, 컬럼2..)
	);	
	한꺼번에 다중의 컬럼으로 제약조건을 처리함으로 해당 내용에 대한 KEY 컬럼을 신규작성할 필요가 
	없을 때, 활용된다. 단 위 제약조건 해당 내용에 한꺼번에 처리하지 않으면 에러가 발생..
EX) 학생테이블을 KEY을 컬럼을 신규로 생성하는 것이 아니라.
	GRADE(학년) PART(반) NO(번호)  이름..
*/
DROP TABLE HIGHSCHOOL;
CREATE TABLE HIGHSCHOOL(
	GRADE NUMBER,
	PART NUMBER,
	NO NUMBER,
	NAME VARCHAR2(30),
	CONSTRAINT HIGHSCHOOL_DIST_PK PRIMARY KEY(GRADE, PART, NO)
	-- HIGHSCHOOL테이블에 PRIMARY KEY를 3개의 컬럼으로 잡는데, GRADE, PART, NO
	-- GRADE, PART, NO를 동시에 조합에서 동일한 데이터가 안 나오게 처리..
);
INSERT INTO HIGHSCHOOL VALUES(1,1,2,'김길동');
INSERT INTO HIGHSCHOOL VALUES(1,1,3,'신길동');
SELECT * FROM HIGHSCHOOL;
select * 
from user_constraints
where table_name='HIGHSCHOOL';

CREATE TABLE ADDRESS(
	STATE VARCHAR2(50),
	CITY VARCHAR2(50),
	AREA VARCHAR2(50),
	ADNUMBER NUMBER,
	HOST VARCHAR2(50),
	RISDNUMBER NUMBER,
	CONSTRAINT ADDRESS_COM_PK 
		PRIMARY KEY(STATE, CITY,AREA,ADNUMBER)
);
INSERT INTO ADDRESS VALUES('서울특별시','강남구','대치동',253,'김길동',4);
SELECT * FROM ADDRESS;
/*2. 제약조건을 따로 지정하여 설정하는 방법..
	1) 테이블 생성
	2) ALTER TABLE 테이블명
	      ADD CONSTRAINT 제약조건명 제약조건유형(컬럼명)
		  MODIFY 컬럼명 CONSTRAINT 제약조건명 제약조건유형
		  DROP 제약조건명*/
		  

/* 15. a15_constraintsExp */
제약 조건 추가하기
ALTER TABLE 테이블명
ADD CONSTRAINT 테이블명_컬럼명_제약조건단축 제약조건유형(컬럼명);
EX) 제약조건 NOT NULL(x), UNIQUE(O)
*/
/* 제약조건 추가, 삭제, 수정 연습.
1. address 테이블에  host컬럼에  UNIQUE 제약조건을 추가..
2. 데이턱 딕션어리에서 확인.
3. host컬럼의 제약조건을 삭제..
4. address 테이블에 host컬럼에 NOT NULL 제약조건으로 변경.
5. 데이터 딕션어리에서 확인
*/
-- 1. 추가
ALTER TABLE address
add constraint address_host_uq unique(host);
-- 2. 확인
select * from user_constraints
where table_name='ADDRESS';
-- 3. 삭제..
/*
ALTER TABLE 테이블명
DROP CONSTRAINT 등록된제약조건명
*/
ALTER TABLE address
drop constraint address_host_uq; 
-- address 테이블에서 제약조건 address_host_uq 삭제
-- 4. 수정(modify)
-- 제약의 유형에 따라 add와 modify를 쓰는 경우가 있다..
-- not null의 경우에는 add로 제약조건을 등록할 수 없다.
-- 이 경우에는 modify를 활용하여야 한다.
/* 형식
	 ALTER TABLE 테이블명
	 MODIFY 컬럼명 CONSTRAINT 제약조건명  제약조건유형(EX-NOT NULL)
*/
	ALTER TABLE address
	MODIFY host constraint address_host_nn NOT NULL;
-- 	host라는 컬럼에 제약조건을 address_host_nn을 하고, 이는 not null
--  제약조건으로 변경 처리한다.
	select * from user_constraints
	where table_name='ADDRESS';
/*  확인예제
	1. EMP테이블의 복사 테이블 EMP07을 만들고,
	2. ENAME컬럼에 UNIQUE 제약조건을 설정한 후,
	3. 위 제약조건을 삭제하고,
	4. ENAME컬럼의 제약조건을 NOT NULL로 변경하세요..
*/	
CREATE TABLE emp07
as select * from emp;

alter table EMP07
add constraint emp07_ename_uq unique(ename);
SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP07';
ALTER TABLE EMP07
DROP CONSTRAINT emp07_ename_uq;



ALTER TABLE EMP07
MODIFY ename CONSTRAINT emp07_ename_nn not null;

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP07';

/*
제약조건 활성 및 비활성화 처리..
: 제약조건을 임시적으로 비활성화 함으로 데이터를 test하거나,
특정한 기간에 제약조건이 맞지 않는 내용을 입력하는 하게 처리하는
것을 말한다.
형식
alter table 테이블명
enable/disable CONSTRAINT 제약조건명; 

ALTER TABLE EMP07
MODIFY ename CONSTRAINT emp07_ename_nn not null;
*/
ALTER TABLE EMP07
ENABLE CONSTRAINT emp07_ename_nn;





select * from address;







	









