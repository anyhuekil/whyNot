/* subquery?
	하나의 select문장의 절 안에 포함된 또 하나의 select 문장을 말한다.
	서버쿼리를 포함하고 있는 쿼리문을 메인쿼리, 포함된 또 하나의 쿼리를 서브쿼리라고 한다.
	ex) 사원 테이블에서 연봉이 최고로 많은 사람의 이름과 연봉을 list하세요.
*/
 /* 메인쿼리 */	SELECT ENAME, SAL       
				FROM EMP
 /* 서브쿼리*/	WHERE SAL = (SELECT MAX(SAL) FROM EMP );

/* 작성시 주의점 
1. 서브쿼리는 비교연산자(=,>,<...)의 오른쪽에 기술해야 하고 괄호로 둘러사 주는 것이 일반적이다.
2. 서버쿼리는 메인 쿼리가 실행되기 이전에 실행된다.

	서버 쿼리의 유형
1. 조건의 값으로 처리되는 경우.
	SELECT *
	FROM 테이블 
	WHERE 컬럼명 = (SELECT 컬럼 FROM 테이블 WHERE 조건);
	## 단일값 조건: =,>,<,(비교연산자 활용)
		다중값 조건: IN, EXIST, ANY, ALL
2. 테이블 자케로 SUBQUERY 처리하는 경우..
	SELECT 컬럼명1+컬럼명2...
	FROM ( SELECT 컬럼명1, 컬럼명2, 함수(컬럼명3) FROM (테이블명) WHERE 조건)
	WHERE 조건..
3. SELECT (SELECT 컬럼1 FROM 테이블명 WHERE 조건 = 메인조건1),
	컬럼2, 컬럼3
*/
	select max(comm)
	FROM EMP;
-- 	EX 보너스가 있는 사람들중 평균 보너스 보다 높은 출력 하세요.
	SELECT AVG(COMM)
	FROM EMP
	WHERE COMM IS NOT NULL;
-- 	EX 사람들중, 평균 보너스 보다 높은 출력 하세요..
	SELECT AVG(NVL(COMM,0))
	FROM EMP;
--  확인예제
-- 	1. 부서번호가 가장 높은 사람의 이름과 부서를 출력 하세요.
	SELECT ENAME, DEPTNO
	FROM EMP
	WHERE DEPTNO = (SELECT MAX(DEPTNO) FROM EMP);
-- 	2. 가장 최근에 입사한 사람의 이름과 직책, 입사일을 출력하세요.
	SELECT ENAME, JOB, HIREDATE
	FROM EMP
	WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
--  SUBQUERY의 결과값이 2개 이상인 경우..
--	 EX) 부서별로 입사일이 최고인 사람들의 이름과 입사일을 출력하세요.
	SELECT DEPTNO, MAX(HIREDATE)
	FROM EMP
	GROUP BY DEPTNO;
-- 	1)다중조건에 대한 처리..
	SELECT*
	FROM EMP
	WHERE DEPTNO IN (10,20);
	
-- 	WHERE EXISTS(SUBQUERY)
-- 	해당 SUBQUERY에 데이터가 있는지 여부를 체크해서 메인 sql을 처리하고자 할때 활용
-- 	EX)부서번호가 30인 데이터가 있으면 전체 사원 테이블을 LIST하세요..
	
	SELECT * FROM EMP
	WHERE EXISTS(SELECT * FROM EMP WHERE DEPTNO=30);	
	
	CREATE TABLE EMP001
	AS
	SELECT EMPNO NO, ENAME NAME, SAL SALART, DNAME
	FROM EMP A, DEPT B
	WHERE A.DEPTNO=B.DEPTNO
	AND SAL>=2000;
	
	SELECT EMPNO NO, ENAME NAME, SAL SALART, DNAME
	FROM EMP A, DEPT B
	WHERE A.DEPTNO=B.DEPTNO
	AND SAL>=2000;
	
	SELECT * FROM EMP001;
	
	/*확인예제
	다음과 같은 신규 테이블을 구성하세요..
	연봉이 1000이상되는 데이터를 사원명(NAME) 부서번호(PARTNO), 연봉(SALARY), 급여등급(GRADE)
	로된, EMPGRADE테이블을 생성하세요*/
	SELECT ENAME NAME, DEPTNO PARTNO, SAL SALARY, GRADE FROM EMP, SALGRADE
	WHERE SAL BETWEEN H
	AND SAL >= 1000;
	
	SELECT * FROM SALGRADE;
	
	
	
	/*
	조별과제
	다음과 같은 형태의 테이블을 구성하세요.
	이름(NAME) 번호(NO) 입사일(CREADATE)-문자열      올해기준근무연수(WORKYEARS)
					  @@@@년 @@@월 @@@일		 @@@@
	NEW_EMP로 구성하세요.
	*/
	
	
