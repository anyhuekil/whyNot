package acon_whyNot01;

//사용자 정의 예외 클래스 만들기
//class 클래스명Exception extends Exception
class UserDefException01 extends Exception{

public UserDefException01() {
   super("기본 에러 메시지");
}
public UserDefException01(String message) {
   super(message);
}
@Override
public String getMessage() {
   return "사용자의 예외메시지:"+super.getMessage();
}
@Override
public String toString() {
   return "사용자의 클래스예외:"+super.toString();
}

}
class Account{
// 총잔액
private long balance;
public Account() {
}
public long getBalance() {
   return balance;
}
public void deposit(int money){ // 입금
   balance += money;
}
// 인출
public void withdraw(int money) throws UserDefException01{
   // 인출금액이 현재 잔고 보다 많다면 사용자 정의 예외 발생
   if(balance < money){
      // 사용자 정의 예외 객체 생성은 강제적으로
      // throw (정의객체) 처리를 하여야 한다.
      throw new UserDefException01("잔고부족:"+(money-balance)
               +" 모자람");
   }
   balance -= money;
}

}

public class study_0501 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
   Account acc01 = new Account();

   try {
      acc01.deposit(100000);
      acc01.deposit(100000);
      // 예외 처리.
      acc01.withdraw(50000);
      acc01.withdraw(200000); // 예외가 던져짐
      
      
   } catch (UserDefException01 e) {
      // 정의된 사용자 정의 메서드 사용.
      // getMessage()에는 정의된 메시지를 호출하는데,
      // 생성자의 통해서 넘겨진 문자열을 가져온다.
      System.out.println(e.getMessage());
      // TODO Auto-generated catch block
      //e.printStackTrace();
   }
}

}