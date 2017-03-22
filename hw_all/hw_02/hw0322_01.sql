-- 확인예제
-- 1. JOB(직책별)로 가장 낮은 연봉을 받는 사람의 이름, 직책, 연봉을 출력하세요..
-- 숙제(조별과제)
-- 1. 입사일 분기별로 가장 높은 연봉을 받는 사람을 출력하세요.
	 SELECT TRUNC(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4) SESONHI , ENAME, SAL
	 FROM EMP
	 WHERE (SELECT MAX(SAL) FROM EMP)
	 GROUP BY SESONHI ;
	
	 
-- 2. 연봉이 3000인 사람 중에, 등급(테이블활용도 가능)을 나누어서
-- 	해당 등급별  V최고 연봉을 받는 사람을 이름, 등급, 연봉을 출력하세요.

  
  
    SELECT TRUNC(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4,)+1 SESONHI , ENAME, SAL
    FROM EMP
    WHERE SAL = (SELECT MAX(SAL) FROM EMP)
    GROUP BY TRUNC(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4,)+1;
	
	SELECT TRUNC(TO_NUMBER(TO_CHAR(HIREDATE,'MM'))/4)+1 FROM EMP;
	
	
-- 	확인예제
-- 	1. 연봉이 3000미만인 사람중에, 최근에 입사한 사람의 사원번호와 연봉 입사일을 출력하세요.
	SELECT EMPNO, SAL, HIREDATE
	FROM EMP
	WHERE HIREDATE >=
	ALL(SELECT HIREDATE FROM EMP WHERE SAL <3000);
	
	
-- 	과제3.
--  1. 부서번호가 30인 사람중에, 가장 나중에 입사한 사람보다 연봉이 많으면 출력하세요.
--  2. 직급이 SALESMAN인 사원이 받는 급여들의 최소 급여보다 많이 받는 살원들의 이름과 급여를 출력하되 부서번호 20번인
-- 		사원은 제외한다.(ANY연산자 이용)


select ename, sal from emp
      where (sal,floor(to_number(to_char(hiredate,'mm'))/4 + 1)) in (select max(sal), floor(to_number(to_char(hiredate,'mm'))/4 + 1) 
                  from emp
                  group by floor(to_number(to_char(hiredate,'mm'))/4 + 1)
   );













