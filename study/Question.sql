/*
	Question

00. �� �κ� ��Ī ex)�÷� ���̺� ��..
01. ���� = ���� (*)�� �ǹ� �ϴ°���?
02. �÷����� ��ҹ��� ����X, �����ʹ� ��ҹ��� ����. �׷� ������??����?
03. sql�� �빮�ڷ� �ۼ��ϴ°��� ������??(������ ���Ŀ� ���� ����)
04. select * from EMP where EMP.HIREDATE between '81/12/01' and '81/12/31';
	�� ������ �Դ� ������?? ��¥�� ���� 81/12/01 �̷������� �Ǿ����� �ʾҳ�? Q10����.
05. LIKE�����ڸ� �ܵ����� ���� �ִ°�?
06. DUAL�� ���ٷθ� ��µǳ�?
07. INITCAP�� ����Ҷ�, �����;ȿ� ���⸦ �����ϸ� ��� �Ǵ°�?
	ex) 'hello? my name is whyNOT' ��ü�� ������ �� ĭ�϶�.
08. '����Ŭ WhyNot'�� ���ڿ� ������?
09. �Ʒ����� 'a��A��B'���?==> ,1,9?? // 'A��B'�� ���?==> ,4,6??
	SELECT SUBSTRB('a��A��BCŬ WhyNot?!',1,1) "SUBSTRB" FROM DUAL;
10. substr(hiredate,1,length(hiredate)) �� �̿��ϸ� �÷���ü�� �ҷ������ִ�?!
11. SUBSTR(ENAME, -2, 3) ������ ��ġ�� ������ ���� �ڿ������Ͷ�� ���̵ȴ�!
12. TRIM�� �� �ѱ��ڸ� �Ǵ°�?
13. NEXT_DAY�� ���ϸ����� �ȵǴ°�?
14. HIREDATE�� � ������ �������ΰ�?? 
15. LENGTH(to_char(8080,'99000000')) ���ΰ�??
17. demo�� emp�� ���̴�??
18. TO_NUMBER�� �꿡����..
		ex) ���������� ,�� ������ �ʾƵ� �˾Ƽ� ����.
			�������� ,�� ������, �������� ,ǥ���ϸ� ��� �ȵ�. ���
		���� ���غ��ߵ�!!
19. TO_NUMBER�� ������ �� �Ҽ��� 2��° �ڸ������� �Ǵ°�?
	
	
	
*/






/* 0320
01.	�� �߰��� null���� ���ִ°�?
	insert into dept01 values(99,,'����');
02. ������ �����Ҷ�, ������ �����ʹ� ��� �����Ǵ°�?? (���� �п����� ��������������..)


*/
/* ���� Q

4. ex) rs.getString("��Ī/�÷���") �̰��� ���� �ǹ�:var1:var2
7. distinct�� ���� ������ ó�� ����̴�!!
19. emp.hiredate ������:var1:var2:var3
23. hiredate�� ��� �����Ǿ��ֳ�:var1
select * from emp where job not like '%ER' and hiredate between 1981/01/01~ 1981/12/31 like '%81%';
���� ����:var1
24. ����ó���� ���� ������, �Ǵ� �����͸� �Է��� ���� ������� ����ϴ� ���:var1:var2
ex)�迭�� �༭ �����Ϳ� �ٽ� ��ȣ�� �ִ� ���:var1:var2(�����Ѱ�:var3)
26. �ҹ��� �빮�ڸ� ���� �ٲٴ� �Լ�:var1 ex) Hello -> hELLO
28. instr�� ����Ҷ� ���ĺ������� ����:var1:var2 �ܾ� �����δ� ��� :var3:var4:var5


0316
4. trim�� ��Ȯ�� ����:var1 �� 1�ܾ�� �Ǵµ� 2���̻�ȵǴ°�:var2:var3
5.




*/





SELECT * FROM EMP;





/*
����
	�ٹ��������� ���� ���� ���ʽ� ����
	���� ������ ����~���� �ֱٿ� �Ի��� ������
	1/3 = 30%, 1/3 = 20%, 1/3 = 10% (��������)
	���, �Ի���, ���糯¥(@@/@@/@@ AM @@�� @@�� @@ ��), �ٹ�������, ���ʽ�
*/	

SELECT MONTHS_BETWEEN(SYSDATE, HIREDATE) 
FROM EMP ORDER BY MONTHS_BETWEEN(SYSDATE, HIREDATE) DESC;

SELECT MOD(MONTHS_BETWEEN(HIREDATE, ),��ü�����ͼ�/3)+1)*0.1||'%' FROM EMP;
	SELECT substr(hiredate,1,length(hiredate)) FROM EMP;
	SELECT mod((HIREDATE ORDER by asc),()/3)*3 FROM EMP;
	


	 
	
	
	
	
	