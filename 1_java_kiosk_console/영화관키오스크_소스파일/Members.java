
import java.util.Scanner;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Iterator;
import java.util.Random;

/*
	Title	 : Members
	Function : 회원 관련 정보 관리
	author	 : 조은선, 김아별
*/

// 수정사항 : startMem() while 반복문으로 수정
//-------------------------------------------------사용자 : 회원 가입 클래스 <완성>

class MembersVO
{
   // 이름, 핸드폰번호, 주민등록번호, 포인트
   private String name; 
   private String tel;
   private String id;
   private int point;

   // 생성자
   public MembersVO()
   {
   }

   // 기존회원 생성을 위해 사용자 정의 생성자 생성(이름, 핸드폰번호, 주민등록번호, 포인트)
   public MembersVO(String name, String tel, String id, int point)
   {
      this.name = name;
      this.tel = tel;
      this.id = id;
      this.point = point;
   }

   // getter, setter
   // 이름 
   public String getName()
   {
      return this.name;
   }

   public void setName(String name)
   {
      this.name = name;
   }
   
   // 핸드폰번호
   public String getTel()
   {
      return this.tel;
   }

   public void setTel(String tel)
   {
      this.tel = tel;
   }

   //주민등록번호
   public String getId()
   {
      return this.id;
   }

   public void setId(String id)
   {
      this.id = id;
   }
   
   // 적립금
   public int getPoint()
   {
      return this.point;
   }

   public void setPoint(int point)
   {
      this.point = point;
   }


}// end MembersVO

// 회원관리 메뉴 선택값만 담는 클래스
class memMenuSel
{
  // 상수화된 변수들(메뉴)
  final static int SIGN_IN = 1;        // 회원 가입
  final static int CONFIRM_MEMBER = 2; // 회원 정보 확인
  final static int MAIN_MENU = 3;      // 사용자 메인메뉴
}

class Members extends Record
{
   //  MemebersVO 기반으로 생성된 객체만 ArrayList에 담는다.
   static ArrayList<MembersVO> mData = new ArrayList<MembersVO>();

   // 다른 클래스에서 User 메인메뉴 호출시 startMem() 사용
   public void startMem() throws IOException, InterruptedException
   {
      while (true)
      {
         mMenuDisp();
         User.menuSelect();
         mMenuRun(); 
      }
   }

   // 회원관리 메뉴
   public void mMenuDisp()
   {
      System.out.println("\n");
      System.out.println("\t=========회원 등록 메뉴=========");
      System.out.println("\t1.  회원      가입     ");
      System.out.println("\t2.  회원 정보 조회   ");
      System.out.println("\t3.    메인 메뉴   ");
      System.out.println("\t================================");
      System.out.print("\t>> 메뉴 선택(1~3) : "); 
   }// end memMenuDisp()

   // 선택된 메뉴 실행에 따른 기능 호출 메소드
   public void mMenuRun() throws IOException, InterruptedException
   { 

      switch (sel)
      {
      //회원가입 메소드 1번
      case memMenuSel.SIGN_IN :  signIn(); break;
      // 회원정보조회 메소드 2번
      case memMenuSel.CONFIRM_MEMBER : recogMem(); break;
      // 사용자 메인메뉴 메소드 3번
      case memMenuSel.MAIN_MENU : User.startUser();  break;
      
      default: System.out.println("\t1~3번을 선택해주세요."); break;
      }
   }// end memMenuRun()


   // 기존 회원 정보 추가 메소드
   public static void oldMem()
   {
      //성인 회원
      mData.add(new MembersVO("김아별","010-1111-1111","760411-2575452",2500));
      //mData.add(new MembersVO("김서현","010-2222-2222","651126-2127984",5000)); // 회원가입시 주민번호 사용...
      mData.add(new MembersVO("조은선","010-3333-3333","610125-2066131",10000));
      mData.add(new MembersVO("심혜진","010-4444-4444","641014-2211410",500));
      //청소년 회원
      mData.add(new MembersVO("청소년","010-5555-5555","071022-1639841",2000));
      mData.add(new MembersVO("소서현","010-1212-1212","080118-2250820",6000));

   }//end oldMem() 

   // 회원 가입 메소드 
   public void signIn() throws IOException 
   { 
      sc = new Scanner(System.in);
      String name, tel, id, temp;
      int point;
      System.out.println();
      System.out.println("\t\t[회원 가입]");
      System.out.println("\t하단의 정보를 입력하세요.");
      System.out.print("\t이름을 입력하세요 : ");
      name = sc.next();
      tel = "";
     
      // 중복되지 않은 전화받호 받기
      System.out.print("\t전화번호를 입력하세요(xxx-xxxx-xxxx) : ");
      temp = sc.next();
      for (int i=0 ; i<mData.size() ; i++)
      {
         if (temp.equals(mData.get(i).getTel()))
         {
            System.out.println("\t중복된 전화번호입니다.");
            System.out.print("\t전화번호를 입력하세요(xxx-xxxx-xxxx) : ");
            temp = sc.next();
         }
         else
            tel = temp;
      }

      // 중복되지 않은 주민등록번호 받고 유효성 검사후 회원가입
      System.out.print("\t주민등록번호를 입력하세요(xxxxxx-xxxxxxx) : ");
      temp = sc.next();
      for (int i=0 ; i<mData.size() ; i++)
      {
         if (temp.equals(mData.get(i).getId()))
         {
            System.out.println("\t중복된 주민등록번호입니다.");
            System.out.print("\t주민등록번호를 입력하세요(xxxxxx-xxxxxxx) : ");
            temp = sc.next();
         }
      }

      int[] chk = {2, 3, 4, 5, 6, 7, 0, 8, 9, 2, 3, 4, 5}; 
      int tot = 0;

      for (int i=0 ; i<13 ; i++) // i → 0 1 2 3 4 5 6 7 8 9 10 11 12
	  {
         if (i==6)
         {
             continue;			
         }
         tot += chk[i] * Integer.parseInt(temp.substring(i,i+1));
	  }
	
	  int su = 11 - tot % 11;
      su = su % 10;		

      // 최종 결과 출력

      if (su == Integer.parseInt(temp.substring(13)))
      {
          id = temp;
          // 가입 적립금 500원 지급
          point = 500;

          // 회원 추가
          mData.add(new MembersVO(name,tel,id,point));

          // 테스트
          //for (int i=0 ; i < mData.size(); i++)
          //  System.out.println(mData.get(i).getName());
         
          System.out.println("\t===================================");
          System.out.println("\t     가입해주셔서 감사합니다.");
          System.out.println("\t가입 적립금 500원이 적립되었습니다.");
          System.out.println("\t===================================");
          
      }  
      else
      {
          System.out.println("\t유효하지않은 주민등록번호입니다.");
      }


   }//end signIn()

   // 회원정보조회 메소드 2번
   public void recogMem() throws IOException 
   { 
      sc = new Scanner(System.in);
      System.out.println("\t[회원 정보 조회]");
      System.out.print("\t주민등록번호를 입력하세요(xxxxxx-xxxxxxx) : ");
      String temp = sc.next();
      String id, name, tel;
      tel = "";
      id = name = tel;
      boolean flag=false;

      // 주민등록번호 유효성검사 시행
      int[] chk = {2, 3, 4, 5, 6, 7, 0, 8, 9, 2, 3, 4, 5}; 
      int tot = 0;

      for (int i=0 ; i<13 ; i++) // i → 0 1 2 3 4 5 6 7 8 9 10 11 12
	  {
         if (i==6)
         {
             continue;			
         }
         tot += chk[i] * Integer.parseInt(temp.substring(i,i+1));
	  }
	
	  int su = 11 - tot % 11;
      su = su % 10;		

      if (su == Integer.parseInt(temp.substring(13)))
      {
          id = temp;
      }  
      else
      {  
          System.out.println();
          System.out.println("\t유효하지않은 주민등록번호입니다.");
      }

      for (int i=0 ; i<mData.size() ; i++)
      {  // 기존 회원정보의 주민등록번호와 일치할시...
         if (id.equals(mData.get(i).getId()))
         {
           flag = true;
           name = mData.get(i).getName();
           break;
         }     
      }
      // 기존 회원정보의 주민등록번호와 일치할시...
      if (flag)
      {
         System.out.println();
         System.out.println("\t회원정보가 확인되었습니다.");
         System.out.println();
         System.out.printf("\t 이  름  : %4s\n", name);
         System.out.println();
      }
      
      else
      {
         System.out.println();
         System.out.println("\t입력하신 주민등록번호는 회원가입 이력이 없습니다.");
      }
   }// recogMem()

}// end class Members
