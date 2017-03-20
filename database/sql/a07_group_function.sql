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
where 조건..
group by 처리할그룹커럼
부서번호별로 총합산 연봉액을 출력하세요..
*/
select deptno, sum(sal),avg(sal) avg01, count(sal) cnt,
       max(sal) max01, min(sal) min01
from emp
group by deptno;
   