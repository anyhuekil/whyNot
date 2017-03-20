
select lpad('himan', 7, '#') from dual;

-- 실무 migration varchar: 가변문자형, char:고정문자형
-- 가변문자형의 데이터를 고정 문자형으로 전환하여 이동시킬때 활용

select rpad('good job', 20, '@') from dual;

select
	ltrim('      GOOD JOB!!!     GOOD!! JOB!    ') showData,
	length('      GOOD JOB!!!     GOOD!! JOB!    ') beforeLen,
	length(ltrim('      GOOD JOB!!!     GOOD!! JOB!    ')) afterLen
from dual;


select
	rtrim('      GOOD JOB!!!     GOOD!! JOB!    ') showData,
	length('      GOOD JOB!!!     GOOD!! JOB!    ') beforeLen,
	length(rtrim('      GOOD JOB!!!     GOOD!! JOB!    ')) afterLen
from dual;
select * from emp;

select trim('a' from 'aaaaaaase    GOOD JOB!!!     GOOD!! JOB!'   ) "굿잡" from dual;

SELECT ENAME, HIREDATE, SYSDATE, (SYSDATE - HIREDATE) FROM EMP;

SELECT ENAME, HIREDATE, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) "DLFEKS" FROM EMP;

SELECT HIREDATE, ADD_MONTHS(HIREDATE, 1) FROM EMP;
/*
NEXT_DAY : 주간단위로 가장 가까운 날짜를 산출할 때, 활용..
*/
	SELECT LAST_DAY(SYSDATE) FROM DUAL;
	SELECT LAST_DAY(SYSDATE)+1 FROM DUAL;
	
	
/* 급여계산,, 3단계 급여일을 나누어서 출력하세요.
1단계 당월 20일
2단계 당월 마지막날
3단계 다음날 10일
사원 입사일 첫 월급1 첫월급2 첫월급3
*/

SELECT ADD_MONTHS(LAST_DAY(HIREDATE),-1)+20 FROM EMP;
/*
SELECT 
	ENAME "사원",
	HIREDATE "입사일",
	SUBSTR(ADD_MONTHS(LAST_DAY(HIREDATE, -1))||'월'
	||일 뽑아내는 함수(LAST_DAY(SYSDATE)+20)'일',
	LAST_DAY(SYSDATE) "2",
	LAST_DAY(SYSDATE)+10 "3",
FROM EMP;
*/

SELECT
	ENAME,
	TO_CHAR(HIREDATE, 'YYYY-MM.DD') "a",
	TO_CHAR(HIREDATE, 'YY/MM-DD') "b",
	TO_CHAR(HIREDATE, 'YY"년 "MM"월 "DD"일"') "c"
FROM EMP;
	
		SELECT 
	TO_DATE(
		TO_CHAR(ADD_MONTHS(SYSDATE,-1), 'MM"/"')
		TO_CHAR(LAST_DAY(SYSDATE)+20
	)


