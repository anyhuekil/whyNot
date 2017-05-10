package acon_whyNot01;

import java.util.ArrayList;

public class Study {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		ArrayList<Emp> elist = new ArrayList<Emp>();
		Emp p = new Emp();
		p.setEmpno(7001);
		p.setEname("하이맨");;
		p.setSal(2000);
		p.setDeptno(10);
		elist.add(p);
		
		Emp p2 = new Emp(7002,"홍길동", 3000, 20);
		elist.add(p2);
		
		elist.add(new Emp(7003, "슈퍼맨", 4000, 30));
		
		System.out.println(elist.get(1).getEname()); 
		
		// 출력값 emp.getEmpno() vs elist.get(idx).gtEmpno()
		for(int idx=0; idx<elist.size();idx++){
			System.out.println(emp.get(idx)+"\t");
		}
	}

}
class Emp{
	   private int empno;
	   private String ename;
	   private int sal;
	   private int deptno;
	   
	   public Emp() {
	   }
	   public Emp(int empno, String ename, int sal, int deptno) {
	      this.empno = empno;
	      this.ename = ename;
	      this.sal = sal;
	      this.deptno = deptno;
	   }
	   public int getEmpno() {
	      return empno;
	   }
	   public void setEmpno(int empno) {
	      this.empno = empno;
	   }
	   public String getEname() {
	      return ename;
	   }
	   public void setEname(String ename) {
	      this.ename = ename;
	   }
	   public int getSal() {
	      return sal;
	   }
	   public void setSal(int sal) {
	      this.sal = sal;
	   }
	   public int getDeptno() {
	      return deptno;
	   }
	   public void setDeptno(int deptno) {
	      this.deptno = deptno;
	   }
	   
}
