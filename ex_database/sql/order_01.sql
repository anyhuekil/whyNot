

-- 	0316 ORDER
	
-- 글자 채우기
	select lpad('himan', 7, '#') from dual;
	select rpad('good job', 20, '@') from dual;
-- 빈공간 지우기
	select ltrim('      GOOD JOB!!!     GOOD!! JOB!'   ) from dual;
	select rtrim('      GOOD JOB!!!     GOOD!! JOB!'   ) from dual;
--특정 글자 지우기
	SELECT TRIM('A' FROM ENAME) FROM EMP;
-- 	오라클 내장된 현재 날짜와 시간
	SELECT SYSDATE FROM DUAL; 
-- 두개의 날짜 데이터 사이의 개월 수를 구하는 내용..
	SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))	FROM EMP; --???
	SELECT MONTHS_BETWEEN(SYSDATE, HIREDATE) FROM EMP;
-- 특정 기간에 월을 더하는 함수
	SELECT HIREDATE, ADD_MONTHS(HIREDATE, 6) FROM EMP;
--가장 가까운요일의 날짜 확인
	SELECT SYSDATE, NEXT_DAY(SYSDATE, '수요일') FROM DUAL;
--해당달의 마지막 날짜
	SELECT LAST_DAY(SYSDATE) FROM DUAL;
	SELECT LAST_DAY(SYSDATE)+1 FROM DUAL;
/*	형변환함수
	TO_CHAR(날짜데이터, '표현할 문자형태') : 
	TO_DATE() : 문자형을 날짜형으로 변환
	TO_NUMBER() : 문자형을 숫자로 변환
	
	각 형태에 따른 사용법 강의내용 확인
*/


/* DECODE
	조건에 따른 결과물 도출,
	함수 형태 :
*/
SELECT DECODE(job, 'CLERK','점원',
	'SALESMAN','영업맨',
	'등등') FROM EMP;
 /*
 
	
	