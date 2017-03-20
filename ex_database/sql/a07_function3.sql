/*
LPAD/RPAD function
특정 문자열에 해당하는 문자열로 채우는 것을 말한다.
LPAD : 왼쪽에 문자로 채우세요. 
syntax) LPAD(데이터, 반복한 문자갯수, '반복할 문자열')

#himan 이라는 문자열 오른쪽에 '#'dmfh 20번 채워서 출력
전체크기를 만들고, 해당 크기가 되지 않으면 무낮로 채움
실무 migration varchar: 가변문자형, char: 고정문자형
가변문자형의 데이터를 고정문자형으로 전환하여 이동시킬때 활용
*/
select lpad('himan', 20, '#') from emp;
/*
RPAD: 오른쪽에 해당 크기가 될 때까지 특정무자로 채움
ex) good job에서 문자가 20개가 될 때까지 @으로 오른쪽에 채움.
*/
select rpad('good job', 20, '@') from dual;
select * from emp;

-- 확인예제 ename과 job을 크기와 지정된 문자열만큼 오른쪽과 왼쪽에 해당 문자열을
-- 아래 형식으로 넣으세요.
-- 1.  ENAME과 JOB에서 데이터 크기를 확인한다.  --
-- 2. 데이터 중에 가장 큰 데이터의 크기를 확인해서
-- 3. ENAME에는 오른쪽에, JOB에는 왼쪽에 ^를 추가해서 나타나게 한다.
-- 4. 다음과 같은 순서로 출력
-- 사원번호	이름(@)	직책(^)	입사일
select
	empno		사원번호,
	rpad(ename, MAX(length(ename)), '@')		이름,
	lpad(job, MAX(length(job)), '^')		직책,
	hiredate	입사일
from emp;

select RPAD(ENAME,MAX(length(ename)), '@') from emp group by ename;

/*
LTRIM(), RTRIM()
공백의 문자를 삭제하는 함수.
LTRIM: 왼쪽에 공백문자를 삭제하는 처리
RTRIM: 오른쪽에 공백문자를 삭제하는 처리
ex) [공백]This is the best day of my life.

*/
select 
	ltrim('     this is the best day of my life.')	showData,
	length('     this is the best day of my life.')	beforeLen,
	length(ltrim('     this is the best day of my life.'))	afterLen
from dual;
-- 오른쪽에 공백문자열을 제거하는 처리
select 
	rtrim('this is the best day of my life.     ')	showData,
	length('this is the best day of my life.     ')	beforeLen,
	length(rtrim('this is the best day of my life.     '))	afterLen
from dual;
/*
TRIM
	오른쪽, 왼쪽에 있는 공백을 비롯해서 특정 문자열을 삭제 처리하는 함수.
	TRIM('삭제할 문자열' FROM 데이터)
	ex) 'aaaaaaaGood morning!!aaaaaaa' 에서 오른쪽과 왼쪽에 a문자열을 삭제처리
*/
select trim('a' from 'aaaaaaGood moarning!!aaaaaaa') showData from dual;
select * from emp;
-- 확인예제 job에 'N'이나 'R' 'T'가 있으면 삭제된 내용으로 다음과 같이 출력하세요.

select 
	ename,
	job,
	trim('N' from trim('R' from trim('T' from job))) changeJob
from emp;

/*
날짜 함수
sysdate: 오라클 내장된 현재 날짜와 시간으 ㄹ출력하는 객체
*/
select sysdate from dual;
select sysdate+1 from dual;
select sysdate-1 from dual;
select
	sysdate today,
	sysdate-1 yesterday,
	sysdate+1 tomorrow
from dual;

select 
	ename					이름,
	hiredate				고용일, 
	sysdate					현재일, 
	floor(sysdate-hiredate)	근무일
from emp;
/*
months_between : 두개의 날짜 데이터 사이의 개월 수를 구하는 내용
	months_between(비교날짜데이터1, 비교날짜데이터2)
	ex) 각 직원들의 근무한 개월 수를 구하세요.
*/
select
	ename,
	hiredate,
	trunc(months_between(sysdate,hiredate)) workingMonths
from emp;
/*
add_months : 미래시점을 나타내는 함수로 개월수를 더해서 해당날짜가 나타나게 한다.
	add_months(기준데이터, 이후 개월수)
	ex) 입사 날짜에서 6개월을 추가한 날짜를 출력하세요.
*/
select
	ename,
	hiredate,
	add_months(hiredate, 6) after6Months
from emp;
select * from emp;
/*
next_day: 주간단위로 가장 가까운 날짜를 산출할 때 활용
next_day(날짜데이터, '요일') : 해당 요일에 가장 가까운 날짜 출력
*/
select sysdate, next_day(sysdate,'수요일') from dual;
/*
확인예제) 사원들의 입사후, 첫번째 토요일을 출력하세요.
*/
select
	ename		사원명,
	hiredate	고용일,
	next_day(hiredate, '토요일')	"첫번째 토요일"
from emp;
/*
	last_day 함수
	해당 달의 마지막 날짜를 반환처리
*/
select last_day(sysdate) 	thisLastDate,
	last_day(sysdate)+1		nextFirestDate from dual;
	
select * from emp;
-- 급여계산 3단계 급여일을 나누어서 출력하세요.
-- 1단계 당월 20일
-- 2단계 당월 마지막날
-- 3단계 다음달 10일
-- 사원		입사일		첫월급1		첫월급2		첫월급3
select
	ename,
	hiredate,
	last_day(hiredate)	pay2,
	last_day(hiredate)+10	pay3
from emp;
/*
형변환 함수
오라클에서 데이터간 형변환을 해서, 필요한 형식이나 type으로 나타내야 한다.
이 때, 활용하는것이 형변환 함수이다.
to_char() : 날짜나 숫자형을 문자형으로 변환
to_date() : 문자형을 날짜형으로 변환
to_number() : 문자형을 숫자형으로 변환

to_char()
1) 날짜형을 문자형으로 변환하기.
	to_char(날짜데이터, '표현할 문자형태')
	표현하는 문자 형태의 종료
	YYYY:  년도 표시,
	YY: 년도 2자리 표시,
	MM: 월 표시,
	MON: 월 영문으로 표시 ex) JAN
	DAY: 요일 표시,
	DY: 요일 약어 표시.

ex) 입사일을 년도-월-일 로 표현하시오.
*/
select 
	to_char(hiredate, 'YYYY-MM-DD (DY)') hiredate1,
	to_char(hiredate, 'YY/MM/DD') hiredate2,
	to_char(hiredate, 'YYYY"년" MM"월" DD"일"') hiredate3
from emp;
	
-- 확인예제
-- 아래형식으로 출력하세요.
-- [사원이름]은 @@년 @@월 @@일에 급여를 @@@받기로 하고 입사했습니다.
select
	'['
	||ename
	||']은(는) '
	|| to_char(hiredate, 'YYYY"년" MM"월" DD"일"')
	|| '에 급여를 '
	|| sal
	|| '만원 받기로 하고 입사했습니다.'
	info
from emp;

/*
2) 시간 출력 형식 to_char(날짜데이터, '날짜출력형식 시간출력형식')
	AM or PM :  오전 오후 표시
	AM. or PM. : 오전. 오후. 표시
	HH or HH12 : 12시간 표시(1~12)
	HH24 : 24시간 표시(0~23)
	MI : minute 분표시
	SS : seconds 초표시
	ex) 현재시간을 날짜와 시간 형식에 의해 표시
	YYYY/MM/DD HH24:MI:SS
*/
select to_char(sysdate, 'YYY/MM/DD HH24:MI:SS') from dual;

/*
숫자형을 문자형 처리
to_char(데이터, '형식')

출력형식
0 : 자릿수가 맞지 않는경우, 지정된 자리수가 실제 데이터의 자리수보다 큰 경우에
	0으로 채줘진다.
9 : 자리수 상관없이 해당데이터 나타남. 채워지지 ㅇ낳는다.
L : 지역별 현금단위 표시
. : 소수점 표시
, : 천단위 표시
*/
select to_char(1000, '000000') from dual; 	-- 해당 자리수 보다 클때 0으로 채워짐.
select to_char(1000, '999999') from dual;	-- 채워지는 처리하지 않음.
select to_char(1000, '999') from dual;		-- 자리수가 적으면 ##으로 표시됨.
select to_char(24333, 'L99999') from dual;	-- 원 단위 표시
select to_char(1000, 'L999,999') from dual;	-- 천단위(,) 표시
select to_char(24333.24, '999,999.999') from dual;	-- 소수점(.) 표시
select * from emp;
-- 확인) 이름과 급여르 표시하되 급여는 소숫점이하는 표시되지 않고, 자리수는 7자리로 표시하되 나타나지 않는 자리는 '0'으로 표시
select ename, to_char(sal, '0000000') sal from emp;












