/*
여러가지 고급 DML query!!
	1. 다중테이블에 다중행 입력하기..
		insert 구분을 여러번 써서 데이터를 입력하는 경우가 많은 데이터를 입력할때 번거러운 경우가 잇따.
		한번은 suberquery를 통해서 여러 동일한 구조의 테이블에 입력할때, insert all 구문을 활용하면 손쉽게 처리할 수 있다.
	1) 형식
	INSERT ALL
	INTO 테이블1명 VALUES (컬럼1, 컬럼2, 컬럼3)
	INTO 테이블2명 VALUES (컬럼1, 컬럼2, 컬럼4)
	SELECT 컬럼1, 컬럼2, 컬럼3, 컬럼4
	FROM 테이블명
	WHEWE 조건
	
	EX) EMP테이블에서 구조 복사테이블 
			EMP_HIR(EMPNO, ENAME, HIREDATE)
			EMP_MGR(EMPNO, ENAME, MGR)
		원본 EMP테이블에서 부서번호가 20인 데이터를 해당 테이블에
		테이터 입력처리...
				
*/

CREATE TABLE EMP_HIR
AS SELECT EMPNO, ENAME, HIREDATE
FROM EMP WHERE 1=0;
SELECT * FROM EMP_HIR;