/*
	계층형 질의
	오라클에서 계층형 구조의 테이블을 효과적으로 지원하기 위한 쿼리를 말한다.
	(self join을 효과적 처리)
	
	계층형 구조: 상하위 관계에 테이블 구조를 설정한 것을 말한다.
	ex) 할아버지(id, parentId, role : 1, 0, '할아버지)
	아버지(2,1,'아버지')		삼촌(3,1,'삼촌')
	아들(4,2,'아들')			사촌동생(5,3,'사촌')
	
	계층형 sql형식
	SELECT .. 컬럼
	FROM 테이블명
	WHERE 조건
	START WITH 조건 (비교연산자 EX)컬럼=데이터;
		 계층SQL의 시작조건 처리-최상위 계층의 조건처리.
			EX) 가족관계의 최상위 계층은 parentId=0
			우리가족만 계층 내용을 처리하고자 할 때,
				parentId=2(아버지 계층이후로 나타남)
	CONNECT BY [NOCYCLE] 조건 and 조건
		상위 관계를 연결시켜주는 조건에 대한 선언.
		nocycle : 반복여부에 대한 처리
			ex) CONNECT BY ID = parentId
			현재 id값을 확인해서 상위에 있는 id값이 있는지 하위 데이터에 확인해서
			계층 구조로 나타나게 하는 것을 말한다.
			prior:사전-상하위 관계에 대한 처리하게됨
*/

select * from emp;
SELECT EMPNO, MGR
FROM EMP
START WITH MGR IS NULL   --최상위 계층의 조건은 mgr이 null일때
CONNECT BY PRIOR EMPNO = MGR;  -- 최상컬럼과 하위 컬럼과 연결처리.

/*
확인예제 family를 계층구조로 출력하세요
	출력형식 : lever role(계층구조 공백처리), 이름
*/

SELECT LEVEL, LPAD(' ',4*(LEVEL-1)) || role01 role, name
FROM FAMILY
START WITH parentnumid=0
CONNECT BY PRIOR numid=parentnumid order by level;

INSERT INTO FAMILY VALUES(5,1,'큰할아버지','홍정인');
INSERT INTO FAMILY VALUES(6,0,'작은할아버지','홍길상');

SELECT * FROM FAMILY;


/*BORD계층형 게시판 테이블 만들어서 LIST하기
	고유ID(글번호), 타이틀, 내용, 등록일자, 수정일자, 작성자, 조회수
	No,			Title,	Content, Credte, Uptdte, Writer, Readcnt

*/
CREATE TABLE BOARD(
No NUMBER PRIMARY KEY,
PARENTNO NUMBER,
Title VARCHAR2(50),
Content VARCHAR2(1000),
Credte DATE,
Uptdte DATE,
Writer VARCHAR2(50)
);
SELECT * FROM BOARD;
INSERT INTO BOARD VALUES(1, 0, '글 등록시작', '냉무',SYSDATE,SYSDATE,'작가01');
INSERT INTO BOARD VALUES(2,0,'2번째네요^^','냉무',SYSDATE,SYSDATE,'작가02');
-- 첫번째 글에 대한 답글처리
INSERT INTO BOARD VALUES(3,1,'1등놓침','냉무',SYSDATE,SYSDATE,'홍영심');
INSERT INTO BOARD VALUES(4,3,'등록ㄴ빨랏네','냉무',SYSDATE,SYSDATE,'작가01');

 













