-- 0314~0316 SQL Class Memo

-- 	01. 기본
		SELECT * FROM EMP;
-- 	02. 테이블명, 컬럼명, ???
-- 	03. 기본연산: +, -, *, /
-- 	04. 문자열 연결처리 : || (javascript +와 같음)
-- 	05. nvl() : null처리 연산자?
		select nvl(comm,0) from emp;
-- 	06. 컬럼명 별칭: as 또는 띄어쓰기(' ')활용,
--		별칭에 한글이나 공백을 넣을경우는 ""(큰따옴표)를 활용
-- 	07. 비교연산자 : = , >, <, >=, <=, <>,!=(다를때)
-- 	08. 컬럼명은 대소문자 구분하지 않지만, 데이터는 대소문자 구분한다.
--  00. + distinct : 중복값 처리 
		select distinct job, deptno from emp;
	-- 	09. OR연산자 : 둘중하나 만족시 결과값 출력
-- 	10. IN연산자 : IN(A, B, C) == A OR B OR C
--	11. NOT연산자 : 아닐때,라고 해석하면될듯.
-- 	12. BETEWEEN AND 연산자: 특정 조건 사이의 데이터 출력
		SELECT * FROM EMP WHERE SAL BETWEEN 3000 AND 4000;
-- 	13. like연산자 : ?
--	14. 와일드카드(%,_) :
		SELECT ENAME "13,14번 예" FROM EMP WHERE ENAME LIKE '_A%';
-- 	15. 오름차순, 내림차순 : OREDER BY 컬럼 ASC/DESC
--	 	오름차순 A~, 1~, 시간순~
		SELECT DEPTNO, SAL, ENAME FROM EMP ORDER BY DEPTNO ASC, SAL DESC;
-- 	16. DUAL : 데이터 테스트를 위한 오라클 내장객체 한행으로 출력
-- 	17. 숫자함수
/*		17-1: ABS	: 절대값
		17-2: CEIL	: 올림
		17-3: ROUND	: 반올림,
			ROUND('데이터',-2) ==> 100의자리부터 표현됨
		17-4: TRUNC	: 내림,
			TRUNC('데이터',-2) ==> 100의자리부터 표현됨
		17-5: FLOOR	: 내림, 소수점 아래 버림
		17-6: MOD('데이터',나눌수)	: 나머지 함수
*/
		SELECT 175.278, ROUND(175.278,-1) FROM DUAL;
		SELECT 175.278, TRUNC(175.278,-1) FROM DUAL;
-- 	18. 문저처리 함수
/*		18-1:UPPER	: 대문자처리
		18-2:LOWER	: 소문자처리
		18-3:INITCAP: 첫문자 대문자 나머지 소문자 처리(띄어쓰기 기준)
		18-4:LENGTH	: 한글영문 상관없이 문자열 갯수(한글1자로인식)
		18-5:LENGTHB: Byte크기 출력(한글2Byte)
		18-6:SUBSTR	: 데이터, 1부터count하여 시작할 위치지정, 추출한 문자열의 갯수
		18-7:SUBSTRB: ??? 한글과 구분 힘듬..
*/
		SELECT LENGTH('a오라클 WhyNot?') "LENGTH",  			--'12'
				LENGTHB('a오라클 WhyNot?') "LENGTHB",			--'18'
				SUBSTR('a오라클 WhyNot?!',3,4) "SUBSTR",		--'라클 W'
				SUBSTR('a오라클 WhyNot?!',4,4) "SUBSTR2",		--'클 Wh'
				SUBSTRB('a오A라클 WhyNot?!',1,9) "SUBSTRB",	--'a오A라'
				SUBSTRB('a오A라bc클 WhyNot?!',4,6) "SUBSTRB",	--'A라b'
				SUBSTRB('a오A라bc클 WhyNot?!',4,7) "SUBSTRB2"	--'A라bc'
		FROM DUAL;
-- 	19. INSTR(데이터,'검색할문자',시작위치,검색된횟수) : 검색된 위치 나타냄(문자단위)
		SELECT INSTR('W오w라WW클 WhyNot:var1!','W',1,4) FROM DUAL;		
-- 	20. 특정 함수?를 사용할때 주지 않아도 자동으로 되는 디폴트값이 있다!!
--	21. LPAD(), RPAD() : 문자열로 빈공간을 채움
-- 			LPAD(데이터, 문자크기수, '반복할문자열')
		SELECT LPAD('Why Not',12,'Hi^^') FROM EMP; -- : Hi^^HWhy Not 
-- 	22.	MAX(데이터) : 최대값
-- 	23.	LTRIM(), RTRIM() : 공백의 문자를 삭제함
-- 		LTRIM(데이터)
		SELECT LTRIM('     Why  Not!!      ') "DEL"FROM EMP;
-- 	24. TRIM() : 양쪽의 특정 문자열을 삭제
-- 		TRIM('삭제할문자열' FROM '데이터')
		SELECT TRIM('W' FROM 'WWWhy  Not!WW') FROM EMP;
-- 	25.	SYSDATE : 오라클 내장된 현재 날짜와 시간을 출력하는 객체.
-- 	26.	MONTHS_BETWEEN() : 두 날짜사이의 개월수 출력
-- 		MONTHS_BETWEEN('데이터1','데이터2')
		SELECT MONTHS_BETWEEN('1988/03/27','1989/06/18') FROM DUAL;	
		-- '-14.71'
-- 	27.	ADD_MONTHS() : 개월수 추가
-- 		ADD_MONTHS('날짜데이터',이후추가개월수)
-- 	28.	NEXT_DAY() : 가장 가까운 날짜 출력
-- 		NEXT_DAY('날짜데이터', '요일')
		SELECT SYSDATE, NEXT_DAY(SYSDATE,'화요일') FROM DUAL;
-- 	29.	LAST_DAY('날짜데이터') : 해당달의 마지막 날짜를 출력
--  형변환 함수
-- 	30.	TO_CHAR(데이터, '형식') :날짜나 숫자형을 문자형으로 변환
/*		30-1: 날짜,시간형
			날짜 YYYY, YY, MM, DD, DAY(DY)
			오전,오후 AM(AM.), PM(PM.)
			시간 HH(HH12), HH24, MI, SS
		30-2: 숫자형
			0 : 빈자릿수 0으로 채움
			9 : 빈자릿수 빈공간으로 채움
			L : 지역별 현금 단위 표시($,원등..)
			. : 소수점 표시(부족한자리는 반올림처리)
			, : ,표시
*/
-- 	31. TO_DATE(데이터, '형식') : 문자를 날짜형데이터로 변환
--  32. TO_NUMBER(데이터, '형식')
--  33. NVL(데이터,'넣을문자')


select to_number('12345.1','9,999.9') calcu 
from dual;

SELECT substr(hiredate,1,length(hiredate)) FROM EMP;

