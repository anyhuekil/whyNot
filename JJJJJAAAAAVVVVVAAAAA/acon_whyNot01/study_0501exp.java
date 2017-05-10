package acon_whyNot01;

/*
확인예제.
1) 사용예외 클래스 처리
- XXXException    ex)ShoppingException
     super를 통해 예외내용을 입력하여 getMessage()가져올 수 있도록 처리
  
2) 프로그램 throw XXXException     
- Market
   goShopping(쇼핑할 때 보유할 현금)
   buyProduct(쇼핑시, 물건을 구매후 지불금액)
      - 보유할 현금과 지불금액을 비교해서 금액이 적을 때 사용자 정의 예외 클래스 호출

3) Main에서 호출처리
*/
package a09_exception;

class UserException02 extends Exception{
  
  public UserException02() {
     super();
     // TODO Auto-generated constructor stub
  }

  public UserException02(String message) {
     super(message);
     // TODO Auto-generated constructor stub
  }

  @Override
  public String getMessage() {
     // TODO Auto-generated method stub
     return "사용자 정의 메세지: "+super.getMessage();
  }

  @Override
  public String toString() {
     // TODO Auto-generated method stub
     return "사용자 정의 클래스: "+super.toString();
  }
  
}

class Market{
  double haveMoney;
  double bringMoney;
  Market(double haveMoney){
     this.haveMoney = haveMoney;
  }
  void goShopping(double bringMoney){
     this.bringMoney=bringMoney;
  }
  void buyProduct(double payMoney) throws UserException02{
     if(haveMoney<payMoney){
        throw new UserException02("금액 부족 : "+(payMoney-haveMoney)+"원 모자람");
     }
     haveMoney-=payMoney;
  }
}
public class study_0501exp {

  public static void main(String[] args) {
     // TODO Auto-generated method stub
     Market m1 = new Market(20000);
  
     try {
        m1.goShopping(20000);
        m1.buyProduct(10000);
        m1.buyProduct(40000);
        System.out.println(m1.haveMoney);
     } catch (UserException02 e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
     }
  }

}