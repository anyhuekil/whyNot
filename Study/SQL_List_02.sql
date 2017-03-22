-- 	06 start. a06_function
/*
DECODE () :조건 처리를 위한 함수
	DECODE(데이터, 데이터1, 조건1데이터,
	                  데이터2, 조건2데이터,
				  그외에데이터)
ex)gender이라는 컬럼에 0이면 남자, 1이면 여자, 그외 중성				  
*/
select decode(0,0,'남자',1,'여자','중성') gender01,
		decode(1,0,'남자',1,'여자','중성') gender02,
		decode(2,0,'남자',1,'여자','중성') gender03,
		decode(3,0,'남자',1,'여자','중성') gender04
from dual;
-- 부서번호가 10 회계, 20 감사, 30 영업, 40 운영, 그외는 '미정'
select ename, 
		decode(deptno,  10, '회계',
						20, '감사',
						30, '영업',
						40, '운영',
						'미정') selDept
 from emp;
/*
직책을 한글로 풀이해서 출력처리
 CLERK :점원, SALESMAN : 영업맨, MANAGER :관리자.....
 사원번호, 직책(한글), 급여
 */
select ename, 
DECODE(JOB, 'CLERK','점원',
			'SALESMAN','영업맨',
			'MANAGER','관리자',
			'ANALYST','분석가',
			'PRESIDENT','대표',
			'기타') "직책(한글)"
 from emp;
/* 숙제 
연봉에 따른 등급체계를 나눌려고 한다.
decode를 활용해서,
	 1000 미만 F등급         성과급 3%
	 1000 ~ 2000미만 E등급   성과급 5%
	 2000 ~ 3000 미만 D등급  성과급 7%
	 3000 ~ 4000 미만 C등급  성과급 4%
	 4000 ~ 5000 미만 B등급  성과급 3%
	 5000 ~ 6000 미만 A등급  성과급 2%
이름  부서  연봉  연봉등급  성과급  총액(연봉+성과급)
*/
SELECT ename, deptno, sal, 
	decode(trunc(sal/1000),0,'F등급',
	                       1,'E등급',
						   2,'D등급',
						   3,'C등급',
						   4,'B등급',
						   5,'A등급',
						   '기타등급') "연봉등급",
	decode(trunc(sal/1000),0,round(sal*0.03)||'(3%)',
	                       1,round(sal*0.05)||'(5%)',
						   2,round(sal*0.07)||'(7%)',
						   3,round(sal*0.04)||'(4%)',
						   4,round(sal*0.03)||'(3%)',
						   5,round(sal*0.02)||'(2%)',
						   '기타등급') "성과급"	,
	decode(trunc(sal/1000),0,sal+round(sal*0.03),
	                       1,sal+round(sal*0.05),
						   2,sal+round(sal*0.07),
						   3,sal+round(sal*0.04),
						   4,sal+round(sal*0.03),
						   5,sal+round(sal*0.02),
						   '기타등급') "총액(연봉+성과급)"							   					    
from emp;
/*
case 함수 :조건에 따라 서로 다른 처리가 가능
CASE WHEN 조건1(비교연산자) THEN 처리할데이터
     WHEN 조건2(비교연산자) THEN 처리할데이터
	 WHEN 조건3(비교연산자) THEN 처리할데이터
     ELSE 위조건에 해당하지 않을 때 처리할 데이터..
END
EX) 점수에 따른 학점계산 방법 처리.. 	 
*/
SELECT CASE WHEN 80>=90 THEN 'A'
			WHEN 80>=80 THEN 'B'
			WHEN 80>=70 THEN 'C'
			WHEN 80>=60 THEN 'D'
		ELSE 'F'
	  END GRADE
FROM DUAL;
SELECT * FROM EMP;
-- 	부서번호를 기준으로 신규부서 재배치처리 한다.
SELECT empno, ename,
	case when deptno=10 then '부서이동'
		 when deptno=20 then '인원감축'
		 when deptno=30 then '전원승진'
	     else '현부서배정'
	end  result
FROM EMP;
/*
숙제) 입사 분기 기준 표시(1/4,2/4,3/4,4/4) 입사 분기를 표기
 사원번호, 이름, 입사(년/월), 입사분기

*/
SELECT empno, ename, to_char(hiredate,'YY/MM') "입사", 
	trunc(to_number(to_char(hiredate,'MM'))/4)+1||'/4' "입사분기"
  FROM EMP;
select * from emp;
-- 	07 start. a07_group_function
select * from emp;
/*
그룹함수: 데이터를 그룹별로 통계치를 처리할 때 활용된다.
sum() : 총합산.
avg() : 평균
count() : 갯수
max() :최대값
min() :최소값

*/
select sum(sal) tot, avg(sal) avg01, count(sal) cnt,
       max(sal) max01, min(sal) min01
from emp;
/*
그룹별로 데이터의 통계치 처리하기..
select 처리할그룹컬럼, 그룹함수
from 테이블명
where 조건..  (그룹을 처리하기 전 조건)
group by 처리할그룹커럼
having 그룹에 대한 조건처리(그룹이 된 후에 조건)
부서번호별로 총합산 연봉액을 출력하세요..
*/
select deptno, sum(sal),avg(sal) avg01, count(sal) cnt,
       max(sal) max01, min(sal) min01
from emp
group by deptno;
-- 전체 데이터 건수를 확인하세요.
-- COUNT(컬럼,전체(*))
-- 특정컬럼에 데이터가 있는 건수만 출력 처리
SELECT COUNT(*) CNT, COUNT(COMM) BONUS_CNT-- 
FROM EMP;
SELECT COUNT(COMM) FROM EMP;
-- 중복되는 데이터에 대한 갯수 확인 처리..
SELECT DISTINCT JOB FROM EMP;
SELECT COUNT(JOB) FROM EMP;
-- 중복된 데이터를 제외한 건수 처리 COUNT(DISTINCT 컬럼명)
SELECT COUNT(DISTINCT JOB) FROM EMP;
SELECT * FROM EMP;
-- 그룹함수와 조건문 처리..
-- 연봉이 3000이상인 사람중에 직책별(JOB)로 인원수를 구하세요.
SELECT JOB, COUNT(JOB)
FROM EMP
WHERE SAL>=3000
GROUP BY JOB;
SELECT * FROM EMP;
-- 확인예제
-- 입사일이 1~3월 인사람의 부서별로 인원수를 체크하세요..
SELECT DEPTNO, COUNT(DEPTNO), TO_CHAR(HIREDATE,'MM')
FROM EMP;
SELECT DEPTNO, COUNT(DEPTNO) CNT
FROM EMP
WHERE TO_NUMBER(TO_CHAR(HIREDATE,'MM')) BETWEEN 1 AND 3
GROUP BY DEPTNO;
-- 입사한 분기별로 데이터를 건수를 처리하는 내용.
SELECT FLOOR(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4)+1, COUNT(*) 
FROM EMP
GROUP BY FLOOR(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4)+1;
--  TO_CHAR(HIREDATE,'MM') : HIREDATE날짜형 데이터를 월단위 문자로 출력.
SELECT HIREDATE, TO_CHAR(HIREDATE,'MM') FROM EMP;
-- TO_NUMBER() : 연산을 위해서 문자를 숫자형으로 변환처리..
SELECT HIREDATE, TO_NUMBER(TO_CHAR(HIREDATE,'MM')) FROM EMP;
-- /4로하면 1~3, 4~6....
SELECT HIREDATE, TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4 FROM EMP;
-- FLOOR() 소숫점이하 삭제 내림처리..
SELECT HIREDATE, FLOOR(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4) 
FROM EMP;
-- 특정 함수가 처리된 데이터를 그룹별로 통계치를 내게할 때, 활용된다.
SELECT FLOOR(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4)+1 PART, 
       COUNT(*)
FROM EMP
GROUP BY FLOOR(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4);
/*
숙제  
연봉단위별로 인원수를 체크하세요..
 범위               사원수(최고치,최저치,평균치)
1000미만       @@      
~2000미만     @@@
~3000미만     @@
~4000미만    
~5000미만
~6000미만
*/
SELECT * FROM EMP;
/*
HAVING 조건
group by안에 주어진 그룹의 데이터에 대한 조건을 처리하고잘 할 때, 활용된다.

ex) 부서별로 평균연봉을 처리하고,
	그 그룹별 평균연봉에서 2000 이상 인 데이터를 로딩하세요..
*/
select deptno, avg(sal)
from emp
where sal>=2000 -- 평균을 그룹별로 내기전에 조건처리..
group by deptno
having avg(sal)>=2000;
-- 그룹내에서 조건처리..
/*
ex) 부서의 최대값과 최소값을 구하되 최대 급여가 2900이상인 부서만 출력 처리..
*/
select deptno, max(sal), min(sal)
from emp
group by deptno
having max(sal)>=2900;
-- 	08 start. a08_join
/*a08_join.sql*/
select count(*)
from emp, dept;
-- (emp테이블)  X  (dept테이블)
-- 크로스 조인
select count(*)
from emp;
/
select count(*) from dept;
select * from emp;
select * from dept;
/*
equal join : 두개이상 테이블에서 각테이블에 소속되어 있는 컬럼의 데이터가 같은 값이 있을 때,
연관하여 처리할 수 있는 join을 말한다.
형식  
	select 표현할컬럼
	from 테이블1, 테이블2
	where 테이블1.공통컬럼 = 테이블2.공통컬럼
	공통컬럼 : 같은 데이터가 있는 컬럼..
*/
select * 
from emp, dept
where emp.deptno = dept.deptno;
-- 사원이 이름과 직책, 소속부서명을 출력하세요..
select ename, job, dname
from emp, dept
where emp.DEPTNO = dept.DEPTNO;
select * from emp;
-- ex) dept를 조건하여 사원명, 부서위치(loc)를 출력
select * from dept;
select ename, loc
from emp, dept
where emp.DEPTNO = dept.DEPTNO;
-- 확인예제) 보너스가 있는 사원의 이름과 부서명을 출력하세요!!
select * from emp;
select ename, dname
from emp a, dept b
where a.DEPTNO = b.DEPTNO
and a.comm is not null;
/*과제
	부서위치별 사원의 수를 아래 형식으로 출력하세요..
	부서위치   사원 수..
*/
select loc, count(*)
from emp e, dept d
where e.deptno = d.deptno
group by loc;
select * from emp;
/*
non-equi join
테이블 사이에 컬럼의 값이 직접적으로 일치하지 않을 시 사용하는 조인으로 '='를 제외한 연산자를 사용한다.
*/
select * from salgrade;
-- 급여 등급을 5개로 나누고 이 등급을 표시하시오..
--  where sal between [losal] and [hisal]
-- 이름과 연봉 연봉등급을 출력하세요..
--  테이블 alias 사용하기 :테이블의 컬럼에 같은 이름이 없으면 의미가 없지만
-- 	   같은 이름이 있으면 구분하기위해 테이블명[공백]alias를 활용한다.
--    테이블alias.컬럼명
--    또한, 데이터 컬럼의 명이 많아, 가독성을 위해 기술하는 경우도 있다.
select e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal BETWEEN s.LOSAL and s.HISAL;
/* 숙제
student10  아이디, 이름 
studentPoint 아이디, 과목, 점수
gradeCheck 최저점수lopoint, 최고점수hipoint, 학점등급(A~F)
1) 아이디를 조인해서(equal join)
	이름 과목 점수  출력
2) 	점수를 조인해서(not equal join)
    과목  점수 학점등급
3) 	student10 studentPoint gradeCheck 조인을 하여..
   이름  과목  학점등급
*/
CREATE TABLE student_main
(
   ID VARCHAR2(20) PRIMARY KEY,
   PASS VARCHAR2(20),
   NAME  VARCHAR2 (50)
);
CREATE TABLE STUDENT_POINT(
	ID VARCHAR2(20) REFERENCES STUDENT_MAIN(ID),
	subject VARCHAR2(50),
	POINT NUMBER
);
drop table gradecheck;
create table gradecheck(
   ptGRADE   varchar2(10),
   lopt   NUMBER,
   hipt   NUMBER	
);
insert into gradecheck values('A학점',90,100);
insert into gradecheck values('B학점',80,89);
insert into gradecheck values('C학점',70,79);
insert into gradecheck values('D학점',60,69);
insert into gradecheck values('F학점',0,59);
SELECT * FROM STUDENT_MAIN;
SELECT * FROM STUDENT_POINT;
INSERT INTO STUDENT_MAIN VALUES('C001001','7777','홍길동');
INSERT INTO STUDENT_MAIN VALUES('C001002','7777','신길동');
INSERT INTO STUDENT_MAIN VALUES('C001003','7777','마길동');
/*
outer join
두개의 조인 관계에 있는 테이블에 있서, 한쪽 또는 양쪽다 
조건이 만족하지 않아도 데이터 결과를 출력해야 하는 경우에 활용되는 조인이다.
where 데이터가 없는 테이블.컬럼명(+) = 데이터가 있는 테이블.컬럼명
*/
select * from dept;
select distinct deptno from emp;
-- 부서번호별로 매칭되는 사원이름을 출력하되,
--    이름이 없으면 없다는 표시가 필요
--
--부서번호, 부서명,  이름
select d.deptno, d.dname, nvl(e.ename,'인원없음') ename
from emp e, dept d
where e.deptno(+) = d.deptno
order by e.deptno;
/*
숙제) outer join, group을 활용하여 
	  부서명별  인원을 확인할려고 한다.
	  아래의 형식으로 출력하세요  인원이 없는 곳은 0으로 표시
	  부서명  인원
*/
/*
self join : 말 그대로 자기 자신과 조인을 맺는 것을 말한다.
from절에 같은 이름을 테이블을 나열하여, 다른 테이블인 것처럼 인식해서
조인하여 그 결과물을 출력하는 것을 말한다.
select *
from 테이블명 alias01, 동일테이블명 alias02
where alias01.연관컬럼 = alias2.연관컬럼
ex) 사원테이블(emp)에서  사원명  관리자명을 출력하세요..
*/
select work.ename, work.mgr,manager.ename 
from emp work, emp manager
where work.mgr = manager.empno;
/*
계층형 join관계 정보 테이블 만들기(self join)
1. 구조를 정리한다..
	id와 상위id를 입력하는 key를 만든다.
	numid, parentnumid, role01, name
	아이디, 상위아이디, 역할, 이름
2. 테이블을 생성한다.
	create table family(
		numid number,
		parentnumid number,
		role01 varchar2(100),
		name varcahr2(500)
	);	
3. 데이터를 입력한다.(위에 세워놓은 계층형 구조에 의한 데이터 입력처리)
	insert into family values(1,0,'할아버지','홍길동');
	insert into family values(2,1,'아버지','홍정길');
	insert into family values(3,2,'아들','홍현호');
	insert into family values(4,1,'삼촌','홍정호');
	
	
4. 입력된 데이터 내용이 정상적으로 되어 있는지 확인한다.
	- 조회 처리..
*/
create table family(
		numid number,
		parentnumid number,
		role01 varchar2(100),
		name varchar2(500)
	);
insert into family values(1,0,'할아버지','홍길동');
insert into family values(2,1,'아버지','홍정길');
insert into family values(3,2,'아들','홍현호');
insert into family values(4,1,'삼촌','홍정호');
select * from family;
/* 이름  role 상위이름
*/
select cur.name, cur.role01, par.name pname
from family cur, family par
where cur.parentnumid=par.numid;
-- 	09 start. a09_subQuery
/*
subquery?
하나의 select문장의 절 안에 포함된 또 하나의 select 문장을 말한다.
서버쿼리를 포함하고 있는 쿼리문을 메인쿼리(main query), 포함된 또 하나의
쿼리를 서브 쿼리(subquery)라고 한다.
ex) 사원테이블에서 연봉이 최고로 많은 사람의 이름과 연봉을 list하세요..
SELECT ENAME, SAL   --> MAIN QUERY
FROM EMP
WHERE SAL = ( SELECT MAX(SAL)
              FROM EMP )  --> SUBQUERY
SELECT MAX(@@), ENAM, JOB			   
작성시 주의점
1. 서버쿼리는 비교 연산자(=,>,<...)의 오른쪽에 기술해야 하고  괄호로
   둘러싸 주는 것이 일반적이다.
2. 서버쿼리는 메인 쿼리가 실행되기 이전에 실행된다.

서버쿼리의 유형
1. 조건의 값으로 처리되는 경우.
   SELECT *
   FROM 테이블
   WHERE 컬럼명 = (SELECT 컬럼 FROM 테이블 WHERE 조건);
   ## 단일값 조건: =,>,< (비교연산자 활용)
      다중값 조건: IN, EXIST, ANY, ALL

2. 테이블로 자체로 SUBQUERY 처리하는 경우..
   SELECT 컬럼명1+컬럼명2, ....
   FROM ( SELECT 컬럼명1, 컬럼명2, 함수(컬럼명3)
            FROM 테이블명
			WHER 조건  )
   WHERE 조건..			

3. SELECT (SELECT 컬럼1 FROM 테이블명 WHERE 조건=메인테이블 조건1 ),
          컬럼2, 컬럼3
    FROM 테이블
	WHERE 조건...		     
			  
*/
-- 1. 조건값으로 SUBQUERY가 사용되는 경우.
--   EX) 평균연봉보다 많은 사람들의 이름과 연봉을 출력하세요.
SELECT ENAME, SAL
FROM EMP
WHERE SAL>( SELECT AVG(SAL)
             FROM EMP );
--   EX) 보너스가 있는 사람들의 중, 최고인 사람의 이름과 연봉과 보너스를
--        출력하세요..
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM =(
SELECT MAX(COMM)
FROM EMP);
--   EX) 보너스가 있는 사람들의 중, 평균 보너스보다 높은  출력하세요..
SELECT AVG(COMM)
FROM EMP
WHERE COMM IS NOT NULL;
--   EX) 사람들의 중, 평균 보너스보다 높은  출력하세요..
SELECT AVG(NVL(COMM,0))
FROM EMP;
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM >(SELECT AVG(COMM)
				FROM EMP
			WHERE COMM IS NOT NULL);
SELECT * FROM EMP;
-- 확인예제
-- 1. 부서번호가 가장 높은 사람의 이름과 부서를 출력하세요..
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = (SELECT MAX(DEPTNO) FROM EMP);
-- 2. 가장 최근에 입사한 사람의 이름과 직책, 입사일을 출력하세요.
-- ==> MAX(HIREDATE):최근에 입사일
-- ==> MIN(HIREDATE):가장 먼저 입사한 입사일
SELECT ENAME, JOB, HIREDATE
FROM EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
SELECT * FROM EMP;
-- SUBQUERY의 결과값이 2개 이상인 경우..
-- EX) 부서별로 입사일이 최고인 사람들의 이름과 입사일을 출력하세요.
SELECT DEPTNO, MAX(HIREDATE)
FROM EMP
GROUP BY DEPTNO;
-- 1) 다중 조건에 대한 처리..
SELECT *
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE DEPTNO<30);
-- IN 구분에 QUERY을 넣어서 해당하는 다중의 데이터 내용을 처리할 수 있다.
-- SAL가 3000, DEPTNO 20
-- DEPTNO, HIREDATE의 조건을 둘다 QUERY에 의해서 처리할 때..
SELECT ENAME, HIREDATE, DEPTNO
FROM EMP
WHERE (DEPTNO, HIREDATE) IN ( SELECT DEPTNO, MAX(HIREDATE)
	                        FROM EMP
							 GROUP BY DEPTNO);
-- SUBQUERY로 결과값이	두개 이상 나올 때는, 해당 컬럼의 갯수에 맞는 컬럼을 선언해주어서
--  결과 처리가 가능하게 한다.  (컬럼1, 컬럼2 ) IN (SELECT 컬럼1, 함수(컬럼2) FROM...
SELECT * FROM EMP;
-- 확인예제
-- 1. JOB(직책별)로 가장 낮은 연봉을 받는 사람의 이름, 직책, 연봉을 출력하세요..
SELECT ENAME, JOB, SAL
FROM EMP
WHERE (SAL, JOB) IN(
					SELECT MIN(SAL), JOB
				FROM EMP
				GROUP BY JOB);
-- 숙제(조별과제)
-- 1. 입사일 분기별로 가장 높은 연봉을 받는 사람을 출력하세요.
-- 2. 연봉이 3000 이상인 사람 중에, 등급(테이블활용도 가능)을 나누어서
-- 	해당 등급별 최고 연봉을 받는 사람을  이름, 등급, 연봉을 출력하세요.
/*
사원 테이블에서 30번 소속 사원들 중에서 급여를 가장 많이 받는 사원 보다
많은 급여를 받은 사람의 이름과 급여를 출력하세요.
##
30번 소속 사원들 중에서 급여를 가장 많이 받는 사원 
==> 1) GROUP 함수이용.
    2) 전체데이터를 SUBQUERY로 로딩해서..
		== ALL, ANY ..(SUBQUERY)
		ALL : subquery에 모든 내용 합치될 때.
		<==> ANY, SOME : SUBQUERY의 결과값이 하나 이상 일치하면 
*/
SELECT ENAME, SAL
FROM EMP
WHERE SAL >= ALL(SELECT SAL FROM EMP WHERE DEPTNO=30);
/**/
SELECT SAL FROM EMP WHERE DEPTNO=30;
SELECT ENAME, SAL
FROM EMP
WHERE SAL >= ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);
SELECT * FROM EMP;
-- 확인예제
-- 1. 연봉이 3000미만인 사람 중에, 최근에 입사한 사람의 사원번호와 연봉 입사일을
-- 	출력하세요
SELECT EMPNO, SAL, HIREDATE
FROM EMP
WHERE HIREDATE >=ALL(
SELECT HIREDATE
FROM EMP
WHERE SAL<3000);
-- 숙제.
-- 1. 부서번호가 30인 사람 중에, 가장 나중에 입사한 사람보다 연봉이 많으면 출력하세요.
-- 2. 직급이 'SALESMAN'인 사원이 받는 급여들의 최소 급여보다 많이 받는 사원들의 이름과
-- 급여를 출력하되 부서번호 20번인 사원은 제외한다. (ANY연산자 이용)
/*
WHERE EXISTS(SUBQUERY)
:해당 SUBQUERY에 데이터가 있는지 여부를 체크해서 메인 SQL을 처리하고자 할때
활용된다.
EX) 부서번호가 30인 데이터가 있으면 전체 사원테이블을 LIST 하세요..
    만약에 부서번호가 30번이 없으면 전체 사원테이블 LIST가 없게 처리하겠다.
*/
SELECT * 
FROM EMP
WHERE EXISTS(SELECT * FROM EMP WHERE DEPTNO=30);
--  특정 조건에 의해서 전체 데이터 로딩 여부를 처리하고자 할 때, 활용된다.
-- 확인예제
-- 관리자번호(MGR)의 데이터중에 NULL값이 있으면, 이름과 관리자번호, 직책
--  을 출력하고자 한다. SQL을 작성하세요..
SELECT ENAME, MGR, JOB
FROM EMP
WHERE EXISTS(SELECT * FROM EMP WHERE MGR IS NULL);
/*
서버쿼리를 활용한 테이블 생성, 데이터 입력, 수정, 삭제..

1. 테이블 생성하기..
	1) 데이터 + 구조
		CREATE TABLE 생성테이블명
		AS SELECT 컬럼1, 컬럼2 FROM 테이블  WHERE 조건..
	EX) 연봉이 2000이상인 데이터 중에  사원번호(no) 사원명(name), 연봉(salary), 
	                         부서이름(dname) 로
	    테이블을 emp001을 만들려고 한다.	
*/
create table emp001
as
SELECT empno no, ename name, sal salary, dname
 FROM EMP A, DEPT B
 where A.DEPTNO=B.DEPTNO
 AND sal>=2000;
SELECT empno no, ename name, sal salary, dname
 FROM EMP A, DEPT B
 where A.DEPTNO=B.DEPTNO
 AND sal>=2000;
/*
 
 */
select * from emp;
drop table emp001;
-- 확인예제 - emp, salgrade 테이블을 활용하여
-- 다음과 같은 신규테이블을 구성하세요..
-- 연봉이 1000 이상 되는 데이터 를,
-- 사원명(name), 부서번호(partno), 연봉(salary), 급여등급(grade)
-- 로 된, empgrade 테이블을 생성하세요.
create table empgrade
 as
 select ename name, deptno partno, sal salary, grade
 from  emp, salgrade
 where sal between losal and hisal
 and sal>=1000;
select * from empgrade;
-- 조별숙제
-- 다음과 같은 형태의 테이블을 구성하세요.
-- 이름(name) 번호(no) 입사일(credate)-문자열   올해기준근무연수(workyears)
-- 					@@@@ 년 @@@ 월 @@@ 일      @@@@
-- new_emp 로 구성하세요.
/*
데이터의 구조만 복사하고자 할 때..
where 1=0로 처리 해서 테이블을 생성
*/
create table emp_structor
as
select * 
from emp
where 1=0;
select * from emp_structor;
-- 	10 start. a10_subQuery
/*
서브 쿼리를 이용한 데이터 추가.
insert 구문을 select와 혼합해서, 데이터를 입력 처리가 가능.
형식 : INSERT INTO 테이블명
       SELECT * FROM 입력할테이블; 해당 SQL로 여러 라인의 데이터
	   를 한번에 입력할 수 있다..
	   주의할 점) 입력할 테이블의 컬럼과 SELECT [선택컬럼명]의
	   컬럼 갯수와 TYPE이 동일하여야 한다.
	   
*/
select * from emp_structor;
-- EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
INSERT INTO emp_structor
SELECT * FROM EMP
WHERE SAL>=3000;
SELECT * FROM emp_structor;
-- 컬럼 지정 및 변경
/*
	insert into 테이블명(컬럼1, 컬럼2, 컬럼3)
				select 컬럼1, 컬럼1+컬럼2, 함수(컬럼3)
				from 테이블명
				where 조건..
*/
INSERT INTO emp_structor(empno, sal, ename)
	select empno, sal+comm, rpad(ename,7,'^^') from emp;
select * from emp_structor;
select * from emp;
select * from dept;
create table dept_sub
as select deptno, dname, loc, '     ' kname, 0 membercnt 
   from dept
   where 1=0;
select * from dept_sub;
select deptno, dname, loc, 
	      decode(deptno, 10,'회계',20,'감사',30,'영업', 40, '운영','없음') kname, 
	    0 membercnt 
	   from dept;
insert into dept_sub
	select deptno, dname, loc, 
	      decode(deptno, 10,'회계',20,'감사',30,'영업', 
		  			40, '운영','없음') kname, 
	      (select count(*) from emp where deptno=a.deptno ) membercnt 
	   from dept a;
select count(*) from emp where deptno=30;
select a.*,
      decode(deptno, 10,'회계',
                     20,'감사',
		     30,'영업', 
	  	     40,'운영',
		     '없음') kname 
from dept a;
select deptno, dname, loc, 
	      decode(deptno, 10,'회계',20,'감사',30,'영업', 
		  			40, '운영','없음') kname, 
	      (select count(*) from emp 
		  where deptno=a.deptno ) membercnt 
	   from dept a;
select count(*) 
         from emp 
	 where deptno=20;
/*
수정 서버쿼리:
	수정하는 main sql에서도 subquery로 해당 내용의 결과를
	처리하는 것을 말한다..
update 테이블명
  set 컬럼명 = 데이터(데이터부분을 subquery로 처리 
                    select 컬럼명
                    from 테이블 where 조건
					)
 where 조건
 ex) empno가 7369인 사람의 보너스(comm), 
        전체 보너스의 평균을 할당 할려고 한다. 
*/
-- 1. subquery
select avg(comm)
 from emp;
-- 2. mainquery
update emp
   set comm=( select avg(comm)
 			 from emp  )
 where empno=7369;
select * from emp;
--  확인예제.
-- 1. emp_sub77 이라는 emp의 복사테이블을 생성.
-- 2. emp_sub77에서 comm이 null값인 데이터에 sal의 최저값으로 수정하세요.
create table emp_sub77
as select * from emp;
update emp_sub77
  set comm=(select min(sal) from emp_sub77)
  where comm is null;
select * from emp_sub77;
