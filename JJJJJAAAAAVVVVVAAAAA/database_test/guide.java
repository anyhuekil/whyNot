/*
 # 동기화와 컬렉션
 1) 동기화라는 쓰레드환경에서 특정 데이터의 일관성 보장에 관련된 내용이다. 
    여러 쓰레드가 동시에 컬렉션을 접근하면 의도하지 않게 요소가 변경되어
    데이터가 불안정한 상태가 된다.
    
 2) 컬렉션 객체 중, Vector, HashTable은 동기화 메서드로 구성되어 멀티 쓰레드 환경에서
    안정적으로 요소를 처리할 수 있다.
    
 3) Collections
    - List : synchronizedList(동기화가 필요한 list 객체)
    - Map : synchronizedMap(동기화가 필요한 map 객체)
    - Set : synchronizedSet(동기화가 필요한 set 객체)   
*/

/* # 목표
 1) jdbc의 개념과 자바에서 활용되는 DB처리 프로세스에 대해 명확하게 파악한다.
 
 2) VO(value object), DAO(data access object), DTO(data transfer object)를 구분해서
    DB처리시 활용할 수 있도록 한다.
    
 3) 데이터베이스의 내용을 조회, 등록, 수정, 삭제 시 처리할 모듈을 구성할 수 있다.
*/
/*
 # 생각해봅시다.
 1) java에서 데이터베이스 서버는 어떻게 연결이 될까?
 2) 데이터를 조회할 때 필요로 하는 요소들이 어떤 것이 있을까?
 3) java에서 데이터베이스와 연결 후 자원은 어떻게 관리를 할까? 
 4) DB연결 시 발생한 예외 내용은 어떤 것이 있을까?
 5) SQL을 통해 동적 query는 어떻게 처리해야 할까?
*/

/*
 # JDBC
  - JDBC(Java Database Connectivity)란 자바로 데이터베이스에
    접근할 수 있게 하는 프로그램 API를 말한다. 
    
    Database Client  ---->    Database Server
                         
    Java Program            ↑
                 ---->   JDBC Driver
    Java기반 Util   
    
 # jdbc를 이용해서 DB 접근
 1. driver 다운로드 및 lib에 위치지정
     1) Orcale 서버
    - C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib\ojdbc6.jar   

    2) Web(jsp기반) 프로그램
    - \WebContent\WEB-INF\lib 에 해당 lib파일을 위치
    
 2. 드라이버 로드 
    1) 클래스를 JVM 메모리에 로딩
       - lib에 있는 package명.class
       - orcle.jdbc.driver.Oracle.Driver.class
       - Class.forName( dirver명 )
  
 3. DB와 연결
   - url : jdbc driver(thin):ip정보:port정보:SID
   - jdbc:oracle:thin:@localhost:1521:xe
   - Connection con = DriverManager.getConnection(url, id, pass);
   
   [driver 메모리]── DriverManger ──>[Connection] ──> [Statement, PreparedStatement] ─── sql( select * from emp, insert into XXX )
                                                      │
                                                   ├─────────── 결과값이 있을 경우 ───> [ResultSet] ── 효율적 처리를 위해 ───> [ ArrayList<VO> ] ───> 웹
                                                   └─commit();                                                          │
                                                                                                                      └───────────> 애플리케이션
 
 4. 대화하기(Statement, PreparedStatement)
    1) SQL문 작성
       - select * from emp
    
    2) 연결된 객체(con)과 Statement 연결
       - Statement stmt = con.createStatement();
    
    3) 실제 SQL문 처리. 결과값이 있을 경우 ResultSet
       - ResultSet rs = stmt.executeQuery(SQL문)
 
 5. 결과값 처리(ResultSet)
    - next() : 데이터가 있을 때까지 호출(다음 row에 데이터가 있는지 여부를 boolean값으로)
    - while( rs.next() )
    - getXXX("SQL의 title명");      <--- sql에서 컬럼명에 별명을 붙이면 별명값으로 데이터를 가져옴. ex) select ename [name] from emp. name로 가져옴
      ex) rs.getString("name");
       
 6. 결과값이 없는 SQL문
    - con.commit() 호출 : 등록, 수정, 삭제의 확정
    - con.rollback() 호출 : 에러가 났을 경우
   
 7. ResultSet -> ArrayList<VO> 변환 처리
    - sql의 list와 맞는 VO 객체 생성(java)
    - ArrayList<Emp> list = new ArrayList<Emp>();
    - Emp e = null;
    - while( rs.next() ){         -- rs.next() : row단위로 반복처리
          e = new.Emp();
          e.setEmpno( rs.getInt("empno") );
          ...
          ...
          list.add(e);
      }
 
 # jdbc에서 예외 처리
 1) Database 접속은 외부에 연결하여 데이터 IO(input/out)가 일어나기에
    자바에서는 반드시 예외처리하게끔 강제하고 있다.
    - 드라이버 메모리 설정
    - 데이터베이스 연결, sql 처리, 결과값을 받는 내용 -> SQLException
    try{
       DB처리 관련된 코드
    }catch(Exception e){
    
    }
 
 2) Exception에서의 자원해제
    - close() : 자원해제를 해야 효과적으로 메모리 관리가 된다.
    - finally{}구문에서 수행
    - 수정, 삭제, 입력시 예외가 발생하면 rollback() 호출하여 원복처리
                                                                                                                      
*/

/*
 # 공통 DB모듈 만들기
 1) XXXDB.java 만들기
 
 2) vo 패키지 생성
    - VO 클래스 생성
    
 3) field선언
   Connection con       : 연결객체
   Statement stmt       : 대화
    PreStatement pstmt
   ResultSet rs;       : 결과
 
*/
package z01_database;

import java.sql.*;

public class A01_EmpDB_0510 {
   
//   1. field 선언
//   1) Connection con          : 연결 객체
   private Connection con;
   
//   2) Statement stmt          : 대화
//      PreparedStatement pstmt
   private Statement stmt;
   private PreparedStatement pstmt;
   
//   3) ResultSet rs;          : 결과   
   private ResultSet rs;
   
//   2. 연결처리하는 메서드(예외사항 위임 처리)
   public void setConnection() throws ClassNotFoundException, SQLException{   
//      try {
//         1) driver메모리에 올리기.(Exception 처리)
         Class.forName("oracle.jdbc.driver.OracleDriver");
         
//         DB드라이버종류(thin)@ip:port:sid
         String url = "jdbc:oracle:thin:@localhost:1521:xe";
         
//          2) DriverManager.getConnection(url, id, pass).     (Exception 처리)
         con = DriverManager.getConnection(url, "scott", "tiger");
         System.out.println("정상 접속 성공.");
//      } catch (ClassNotFoundException e) {
//         // TODO Auto-generated catch block
//         e.printStackTrace();
//         System.out.println("드라이버 이상.");
//      } catch (SQLException e) {
//         // TODO Auto-generated catch block
//         e.printStackTrace();
//         System.out.println("접속 이상.");
//      }
   }

   public static void main(String[] args) {
      // TODO Auto-generated method stub
      A01_EmpDB_0510 db = new A01_EmpDB_0510();
      try {
         db.setConnection();
      } catch (ClassNotFoundException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }

}
