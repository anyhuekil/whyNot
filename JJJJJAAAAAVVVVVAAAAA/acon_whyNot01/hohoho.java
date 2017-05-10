package acon_whyNot01;

public class hohoho {

	   public static void main(String[] args) {
	      // TODO Auto-generated method stub
	      Customer [] list = {new Customer("호날두"), new Customer("메시"), new Customer("루니")};
	      for(Customer name : list){
	         new Thread(name).start();
	      }
	   }
	}

class Customer implements Runnable{
   String name;

   public Customer(String name) {
      this.name = name;
   }

   public void run() {
      String [] phase = {"로그인", "계정확인", "물건구매", "장바구니확인", "결제", "배송처리", "로그아웃"};
      for(int step=0; step<phase.length; step++){
         System.out.println(name+"님. "+(step+1)+"번째 절차 "+phase[step]+" 단계 진행합니다.");
      }
   }
   
}
