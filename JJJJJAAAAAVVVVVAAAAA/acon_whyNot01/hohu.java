package acon_whyNot01;

public class hohu {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Customer [] list = {new Customer("호날두"), new Customer("메시"), new Customer("루니")};
		for(Customer name : list){
		   new Thread(name).start();
		}
	}

}

class Customer implements Runnable{
	   private String name;
	   
	   public Customer(String name) {
	      this.name = name;
	   }
	   public void run() {
		  String [] list = {"로그인","계정확인","물건선택","장바구니확인",
			         "결재","배송처리","로그아웃"};
	      for(int cnt=0; cnt<=6; cnt++){
	         System.out.println(name+"님 "+(cnt+1)+"단계 ["+list[cnt]+"]입니다");
	      }
	   }
}


	      