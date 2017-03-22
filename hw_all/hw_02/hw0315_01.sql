select * from emp;

/*
	과제1)
	sal을 연봉이라고 할때, 이달 급여분(1/13)을 처리하시오. 단 이달은 보너스가 있는 달입니다.
	출력내용 : 사번, 연봉, 이달급여, 보너스, 총급여액(급여와, 총급여액은 10단위로 반올림 처리한다.)
*/
select 
	empno "사번",
	sal "연봉",
	round(sal/13,-1) "이달급여",
	nvl(comm,0)"보너스",
	round(sal/13+nvl(comm,0),-1) "총급여액"
from EMP;


/*
	과제2)
	sal을 기준으로 
	1000미만		: 10% 보너스
	~2000		: 20% 
	~3000		: 30%
	~4000		: 40%
	~5000		: 50%
	5000이상		: 60%
	지급하기로 했다. 함수를 활용해서 아래내용을 처리하시오. 
	사번, 이름, 연봉, 보너스(%), 보너스
*/
select
	empno "사번",
	ename "이름",
	sal "연봉",
	floor(sal/1000)*10+10 "보너스(정답1)",
	trunc(sal,-3)/100+10 "보너스(정답2)",
	ceil((sal+1)/1000)*10 "보너스(오류있는답)"
from emp;


/*
	과제3) 사원을 부서기준으로 1팀과 2팀으로 나누어서 체육대회를 하기로 햇다.
	부서번호가 10, 30 ==> 1팀
			20, 40 ==> 2팀
	으로 나누고 다음과 같이 출력하세요.
	부서번호 사번 이름 팀명
*/
select
	deptno "부서번호",
	ename "사원번호",
	ename "이름",
	(mod(deptno+10,20)/10)+1||'팀' "팀명"
from emp;


/*
	과제 4)
	함수를 이용하여 다음 내용을 출력하세요..
	@@@님 입사일 @@년 @@월 @@일 이며, 현재 연봉은 @@@만원 받고 있습니다.
	column empinfo
*/
select
	ename||
	'님 입사일 19'||
	substr(hiredate,1,2)||
	'년 '||
	substr(hiredate,4,2)||
	'월 '||
	substr(hiredate,7,2)||
	'일 이며, 현재 연봉은 '||
	sal||
	'만원 받고 있습니다.'
	"column",
	hiredate "empinfo"
from emp;



-- 원본 데이터의 1900년대 기준으로 이 값을 수정하기 위해서는 원본 데이터의 변환이나
-- 추가적인 지식이 필요해보임. 입력정보가 없으므로, 아마 불가능 할것으로 예상!!


/*
과제 5)
	substr을 활용하여 JOB이 MAN으로 끝나는 데이터를 출력하세요!!
	추가)%도 활용해보자~~
*/
select * from emp where substr(job,-3)='MAN';
SELECT * FROM EMP WHERE SUBSTR(JOB,LENGTH(JOB)-2)='MAN';
SELECT * FROM EMP WHERE SUBSTR('##'||JOB,LENGTH(JOB))='MAN';

/*
	과제 6)
	입사일이 12월인 데이터를 이름과 입사일을 출력하세요 instr()를 활용
*/

select ename, hiredate
from emp
where instr(substr(hiredate,4,2),'12')=1;
select
	ename "이름",hiredate "입사일"
from emp
where instr(TO_CHAR(hiredate,'MM'),'12',1, 1)=1;

/*
	과제7)
	입사일이 10월인 데이터를 이름과 입사일을 출력하세요 instr()를 활용
*/
SELECT ENAME "이름", HIREDATE "입사일"
FROM HIREDATE
WHERE instr(TO_CHAR(hiredate,'MM'),'12',1, 1)
