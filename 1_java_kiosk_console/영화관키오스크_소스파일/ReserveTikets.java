
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.*;

//
//====================================================================================================

/*
  Title  : ReserveTikets
  Function : 영화 예매 기능
  author   : 김아별, 김서현
*/

//====================================================================================================


class ReserveTiketsVO // 김아별, 김서현
{
   // 상영관 열
   private static char[] mr0 = {'A','B','C','D','E','F','G','H','I','K'}; 
   // 1관 10x5 배열 생성
   private static char[] mr1 = new char[50];
   // 2관 10x5 배열 생성
   private static char[] mr2 = new char[50];
   // 3관  8x4 배열 생성
   private static char[] mr3 = new char[32];
   // 입력한 좌석번호 인덱스 담는 배열
   int[] seat = new int[4];


   


   // 예매확인을 위한 변수들
   // 영화제목, 상영관, 영화시간, 좌석번호


   // 인원수
   static int inwon;
   // 좌석번호 저장하는 문자열 배열
   static String[] rSeat = {"", "", "", ""};
   
   //-------------------------예매확인 변수----------------------------//

   // ★★★★★★★추가★★★★★★★★
   // 상영관
   //public static String cRoom="";

   // 좌석번호 (ex. A1 B2)로 후에 입력이 됨
   public static String cSeat ="";
   // 영화제목
   //public static String rMovie;
   public static String rMovie="";
   // 예매날짜
   public static String rDate=""; //2021-03-20

   // 예매번호 (ex. 03-201)로 후에 입력이 됨
   public static String rMem="";

   // 예매번호 끝자리
   static int i=0;

   // 예매번호 초기화블럭  
   
   /*
   {
      rMem += rDate.substring(5);  
      rMem += String.valueOf(i);
   }
   */
   
   
   // 사용자 정의 생성자 
   ReserveTiketsVO()
   {
      // 1관 좌석 입력
      for (int i=0; i<mr1.length; i++)
      {
         mr1[i] = '□'; // 빈좌석
         if(i%3==0)
            mr1[i] = '▩'; // 거리두기로 못앉는 좌석
      }
      
      // 2관 좌석 입력 (1관 배열 복사)
      mr2 = (char[])mr1.clone(); // 깊은 의미의 배열 복사수행
      
      // 3관 좌석 입력
      for (int i=0; i<mr3.length; i++)
      {
         mr3[i] = '□'; 
         if(i%3==0)
            mr3[i] = '▩'; 
      }
      

   }

   // getter, setter
   public char[] getZero()
   {  return mr0; }

   public void setZero(char[] mr0)
   {  ReserveTiketsVO.mr0 = mr0;}


   public char[] getOne()
   {  return mr1; }

   public void setOne(char[] mr1)
   {  ReserveTiketsVO.mr1 = mr1; }

   public char[] getTwo()
   { return mr2; }

   public void setTwo(char[] mr2)
   { ReserveTiketsVO.mr2 = mr2; }

   public char[] getThree()
   { return mr3; }

   public void setThree(char[] mr3)
   { ReserveTiketsVO.mr3 = mr3; }

   public int getInwon()
   { return inwon; }

   public void setInwon(int inwon)
   { this.inwon = inwon; }


}//ReserveTiketsVO


class ReserveTikets extends Record
{ 
  //ht4 : <정렬된 번호, 제목> 키, 벨류 구성을 갖는 자료구조 
  public static Hashtable<Integer, String> ht4 = new Hashtable<>();
  //ht5 : <상영시간, 제목> 키, 벨류 구성을 갖는 자료구조 
  public static Hashtable<String, String> ht5 = new Hashtable<>();
  //valueTitleStar : 평점순으로 정렬 필터시 사용될 자료구조
  public static Hashtable<String, String> valueTitleStar = new Hashtable<>();
  //valueTitle : 가나다순 정렬 필터시 사용될 자료구조
  public static Hashtable<String, String> valueTitle = new Hashtable<>();
  //htLast: <선택한 영화의 인덱스 번호, 상영시간> 키, 벨류 구성을 갖는 자료구조
  public static Hashtable<Integer, String> htLast = new Hashtable<>();
  //arrLast: <날짜 + 상영시간 + 줄거리> 요소값을 갖는 자료구조
  public static ArrayList<String> arrLast = new ArrayList<String>(); 

  static int temp;
  static int n;
  static char a;
  static String t="";
  static int iLast=1;
  public static String data3;
  static String checkMovie;
  static String checkTime;
  public static String lastTimeTable;
  public static String rday="";
  public static String strDate;


  public static ReserveTiketsVO rtv = new ReserveTiketsVO();

  //영화 예매 메소드 시작
  public static void selReserve() throws IOException, InterruptedException
  { 
    //상영리스트 출력 메소드 호출
    printMenuList();
	//상영시간 출력 메소드 호출
	printMenuTime();

  }

  //상영리스트 출력 메소드
  public static void printMenuList() 
  {
    Scanner sc = new Scanner(System.in);

		//- do/while 문에 의한 필터 선택이 가능
        do
        {
          System.out.print("\n\n\n\t===============================================");
          System.out.print("\n\t     *영화 목록 필터링 방법을 입력해주세요*  ");
          System.out.print("\n\t-----------------------------------------------");
          System.out.print("\n\t 1. 가나다순 | 2. 평점순");
          System.out.print("\n\t===============================================");
          System.out.print("\n\t>> 입력 : ");

          sel = sc.nextInt();

          if (sel>0)
          {
            if (sel==1 || sel==2)
              break;
            System.out.println("\n\t잘못입력하셨습니다. 다시 입력해주세요.");
          }
                }
        while (sel<1 || sel>2);

		  //- 영화 리스트업 정렬기준을 위한 자료구조 생성 

		  //E = 타이틀 + 줄거리
          ArrayList<String> nameAndStry = new ArrayList<String>();
		  //K = 평점, V = 타이틀 + 줄거리
          TreeMap<Integer, String> starNameAndStry = new TreeMap<Integer, String>();

		  //- AdminMovie의 해쉬테이블 자료구조 ht의 key값을 이용해 key값을 출력 
		  //- ht<타이틀, 상영시간>
          Set<String> keys = AdminMovie.ht.keySet();
          Iterator<String> it = keys.iterator();

		  //while문안에서 사용될 값을 위한 담아두기용 변수
          String data;

		  //it에 요소가 있으면 1 or 0 을 반환
          while (it.hasNext())
          { 
			//data는 타이틀
            data = it.next();

			//*
			//<타이틀>
			//	줄거리

			//nameAndStry에 위와 *요소를 추가
            nameAndStry.add("<"+data+">"+"\n\t"+AdminMovie.ht.get(data).getmStory());
      
	  		//starNameAndStry에 평점을 키값으로 *요소를 벨류값으로 추가
            starNameAndStry.put(AdminMovie.ht.get(data).getmStar(),"<"+data+">"+"\n\t"+AdminMovie.ht.get(data).getmStory());
            
            //가나다순 정렬 필터시 사용, valueTitle에 *요소를 키값으로, 타이틀을 벨류값으로 추가 
            valueTitle.put("<"+data+">"+"\n\t"+AdminMovie.ht.get(data).getmStory(),data);

			//평점순으로 정렬 필터시 사용, valueTitleStar *요소를 키값으로, 타이틀을 벨류값으로 추가 
            valueTitleStar.put("<"+data+">"+"\n\t"+AdminMovie.ht.get(data).getmStory(),data);//

          }

			//가나다순 필터링 선택시
			if (sel==1)
			{
				//System.out.println("\n\t가나다순 필터링 목록 호출");

				//nameAndStry 오름차순 정렬
				Collections.sort(nameAndStry);

				//영화 제목만 담는 변수
				String onlyName;

				//증감에 사용될 정수 
				iLast=1;

				//nameAndStry의 요소인 타이틀+줄거리를 출력하는 for each문
				for (String data2:nameAndStry)
				{
					//1. <타이틀>
					//	줄거리
					//출력
					System.out.println("\t"+iLast+". "+data2);

					//1. <타이틀>
					//	줄거리
					//를 키값으로 갖는 valueTitle의 벨류값을 onlyName의 값으로 초기화
					onlyName=valueTitle.get(data2);

					//ht4에 <평점높은 순서, 제목>의 키와 벨류값 투입 
					ht4.put(iLast, onlyName);

					iLast++;
				}   

				System.out.print("\t선택할 영화의 번호를 입력해주세요: ");

				sel = sc.nextInt();

				System.out.println();

				//사용자가 선택한 영화의 번호를 temp에 초기화
				temp=sel;

			}
			// 평점순 필터링 시 
			else if (sel == 2)
			{
				System.out.println("\n\t평점순 필터링 목록 호출");

				//참고)
				//Map을 정렬하기 위해서는 TreeMap을 사용해야한다.
				//entrySet() : Map에 들어있는 전체 데이터를 출력하기 위해서 사용

				//starNameAndStry라는 참조명을 가진
				//TreeMap구조를 내림차순 정렬하기 위해서는 descendingMap()을 이용해야한다 
				//
				//① 참조명 keys21인 NavigableMap을 이용하여 키값 기준 내림차순 정렬
				NavigableMap<Integer, String> keys21 = starNameAndStry.descendingMap();//starNameAndStry를 역순으로 가져온다
				//② Set을 용하여 keys21의 값을 가져올 준비
				Set<Map.Entry<Integer, String>> keys22 = keys21.entrySet();//keys21의 데이터 가져올 준비

				//증감될 정수 1로 초기화
				iLast=1;

				//내림차순 정렬된 keys22의 벨류값 출력
				for (Map.Entry<Integer,String> entry1:keys22)
				{
				  		 
				  System.out.println("\t"+iLast+". "+entry1.getValue()+"\n");
				  //starNameAndStry의 값 = entry1.getValue() : 제목, 줄거리
				  
				  ht4.put(iLast,valueTitleStar.get(entry1.getValue()));
				  //ht4 = (정렬된 번호, 제목+줄거리 )
				  iLast++;	  

				  
				}

				//증감될 정수 1로 초기화
				iLast=1;

				System.out.print("\t"+"예매할 영화의 번호를 입력해주세요: ");

				sel = sc.nextInt();

				System.out.println();

				//사용자가 선택한 영화의 번호를 temp에 초기화
				temp=sel;

			}



    }//end printMlist()

	//06-21 AdminMovie의 영화 삭제 메서드에 따라 해당 영화 시간표... 하 미친... dao.lists() 너무 간절한데 ㅠㅠ ?
	//일단, 이 상태에서 고쳐보려면 h3,h4,h5가 뭔지 정확히 파악
	//후 ht에서 지우려고 할 시,  h2,h3,h4,h5에서 모두 지워져야 한다는게 포인트
	//해보자~!! 

    //상영시간 출력 메소드
    public static void printMenuTime()
    { 

      Scanner sc = new Scanner(System.in);
	  
	  //ht3 : <날짜 + 상영시간, 제목> 키, 벨류 구성을 갖는 자료구조 
      Set<String> keys3 = AdminMovie.ht3.keySet();
      Iterator<String> it3 = keys3.iterator();

	  //ht4 : <정렬번호, 제목+줄거리> 키, 벨류 구성을 갖는 자료구조
      Set<Integer> keys4 = ht4.keySet();
	  Iterator<Integer> it4= keys4.iterator();

		  //data: 상영시간
          String data;
		  //data2: 제목
          String data2;
		  //증감에 사용될 정수 1로 초기화
		  int numb=1;

		  //data3 : 사용자가 선택한 영화의 제목  
          data3=ht4.get(temp);

          while (it3.hasNext())
          {
            
            data = it3.next(); //data: 상영시간 2021-03-22 12:00~14:00

            data2 = AdminMovie.ht3.get(data); //data2: 제목
            
			//전체 영화중, 사용자가 선택한 영화와 같은 이름의 영화가있다면? 
            if (data2.equals(data3)) 
            {
				//제목은 한번만 출력해주며,
				if(numb == 1)
					System.out.println("\t        <<"+data2+">>");//제목
				
				//제목을 한번만 출력하기 위함
				numb++;

				// ht5 : <상영시간, 제목> 키, 벨류 구성을 갖는 자료구조 
				// ht자료구조에 그 제목을 벨류에, 날짜 + 상영시간을 키에 넣어준다
				ht5.put(data, data3); 
            }  
              
          }
		  //증감에 사용될 정수 1로 초기화
          numb=1;

		  //ht5의 데이터를 가져올 준비
          Set<String> keys5 = ht5.keySet();
          Iterator<String> it5= keys5.iterator();
        
		 //날짜 + 상영시간이 담길 변수선언
		  String lastNext;

          while (it5.hasNext())
          {
		    //날짜 + 상영시간을 넣어준다
            lastNext=it5.next();
            arrLast.add(lastNext);  
          }

		  //인덱스 번호에 사용될 정수 1로 초기화		  
          int sss = 1;
		  //인덱스 번호에 사용될 정수 1로 초기화
          int bbb = 1;

		  //오름차순으로 정렬
          Collections.sort(arrLast);

		  //선택한 영화의 인덱스 번호와 상영시간 출력
          for (String last: arrLast)
          {
            System.out.println("\t"+bbb+". "+last+"\n");
            bbb++;
			
			//htLast: <선택한 영화의 인덱스 번호, 상영시간> 키, 벨류 구성을 갖는 자료구조
            htLast.put(sss, last);//번호와 제목
            sss++;
          }


          

          System.out.print("\t"+"예매할 상영시간의 번호를 입력해주세요: ");

		  //사용자가 선택한 상영시간의 번호를
          sel = sc.nextInt();

          System.out.println();

		 //선택한 상영시간을 lastTimeTable에 초기화
         lastTimeTable = htLast.get(sel);  //
		 //ex) lastTimeTable = 2021-03-21 16:00~18:05

		  //ht3 : <날짜 + 상영시간, 제목> 키, 벨류 구성을 갖는 자료구조  
		  //사용자가 선택한 영화의 제목을 lastTitle에 초기화
          String lastTitle = AdminMovie.ht3.get(lastTimeTable);

		  //다른 메소드 담당 팀원이 사용
		  checkMovie = lastTitle;
		  checkTime = lastTimeTable;

		  //최종 출력
          System.out.println("\t선택하신 영화의 제목은 "+lastTitle+",");
          System.out.println("\t선택하신 영화의 상영관은 "+AdminMovie.rm1.get(lastTimeTable) + "관,");					
          System.out.println("\t선택하신 영화의 시간표는 "+lastTimeTable+"입니다");
			
			//예매번호에 들어갈 변수설정

			//①strDate: 상영날짜로 초기화 
			strDate = lastTimeTable.substring(0,10);//2021-03-21
           

			//②ReserveTiketsVO.rMem변수에 strDate의 '년도'와 '-'를 제외한 문자 추출
			ReserveTiketsVO.rMem += strDate.substring(5);  

			//③ReserveTiketsVO.rMem변수에 증감될 정수를 추가하여 문자열로 변환 
			ReserveTiketsVO.rMem += String.valueOf(ReserveTiketsVO.i);

			//ArrayList는 크기를 자동으로 늘려주기 때문에 데이터 누적을 방지하고자 비워줌
			arrLast.clear();

    }//end printMtime()


  /////////////////////////////////////////////////////////////////////////////////////////////////////////////[★좌석선택]


    // 거리두기 안내사항 출력 메소드
    public static void printMal()
    {
      System.out.println("\n");
      System.out.println("\tCGV는 사회적 거리두기를 준수합니다.");
      System.out.println("\t사회적 거리두기 좌석(▩)은 비워주시길 바랍니다.\n");
    }//end printMal()

   // 상영관 1관 좌석화면(10x5) 출력 메소드
   public static void printOne()
   {  
      System.out.println("\n");
      System.out.println("\t  --------Screen--------  \n\n");
      for (int i=0 ; i<5; i++)             // i : 5개의 줄(A~E)
      {
         System.out.print("\t" + rtv.getZero()[i] + "│ "); // mr0: A ~ E 열 출력
         for (int j=10*i; j<10*(i+1); j++) // j: 자리 인덱스 값 i = 0(첫번째 줄) → j : 0 ~ 9 (10개)
         {                                 //                   i = 1(두번째 줄) → j : 10~18  ... 
            System.out.print(rtv.getOne()[j]);
            if (j%10==1 || j%10==7)        // 왼쪽, 오른쪽 통로   1 2   3 4 5 6 7 8   9 10
               System.out.print(" ");
            if (j%10 == 9)                 // 한줄(좌석 10개) 생성되면 개행
            {
               System.out.println();
               for (int k=0; k<1; k++)      // 한줄씩 나올때마다 좌석 번호 하단에 출력
                  System.out.println("\t   1 2  3 4 5 6 7 8  9 10");   
            }
         }
      }
      printMal();
   }//end printOne()

   
   // 상영관 2관 좌석화면(10x5) 출력 메소드 
   public static void printTwo()
   {
      
      System.out.println("\n");
      System.out.println("\t  --------Screen--------  \n\n");
      for (int i=0 ; i<5; i++)
      {
         System.out.print("\t" + rtv.getZero()[i] + "│ ");
         for (int j=10*i; j<10*(i+1); j++) // i=0 → j : 0 ~ 9 , i = 1 → j : 10~18  
         {
            System.out.print(rtv.getTwo()[j]);
            if (j%10==1 || j%10==7)
               System.out.print(" ");
            if (j%10 == 9)
            {
               System.out.println();
               for (int k=0; k<1; k++)
                  System.out.println("\t   1 2  3 4 5 6 7 8  9 10");
            }
         }
      }
      printMal();
   }//end printTwo()


   //상영관 3관 좌석화면(8x4) 출력 메소드
   public static void printThree()
   {

      System.out.println("\n");
      System.out.println("\t----------Screen-----------\n\n");
      for (int i=0 ; i<4; i++)
      {
         System.out.print("\t  "+ rtv.getZero()[i] + "│ ");
         for (int j=8*i; j<8*(i+1); j++) // i=0 → j :  
         {
            System.out.print(rtv.getThree()[j]);
            if (j%8==3)
               System.out.print("  ");
            if (j%8 == 7)
            {
               System.out.println();
               for (int k=0; k<1; k++)
                  System.out.println("\t     1 2 3 4   5 6 7 8");
            }
         }
      }
      printMal();
   }//end printThree()
   

   // 영화 예매 진행하는 메소드 (room : 1~3 상영관) 
   public static void selRoom(int r) throws IOException, InterruptedException
   {
      switch (r)
      {
         case 1: 
         {   printOne();   // 좌석화면 출력 
             selInwon();   // 인원 선택
             selOne();     // 상영관 1관 좌석 예매
             break;
         }
         case 2: 
         {   printTwo();
             selInwon();
             selTwo();
             break;
         }
         case 3:
         {
            printThree();
            selInwon();
            selThree();
            break;
         }
         
      }
   }// end selRoom()


   // 사용자에게 인원수 입력받는 메소드
   public static void selInwon()
   {
      sc = new Scanner(System.in);
      do
      {
        System.out.print("\t관람할 인원을 입력하세요(1~4) : ");
         rtv.setInwon(sc.nextInt());
       // 예매가능 인원수: 최대 4명
       if (rtv.getInwon() <1 || rtv.getInwon() >4)
          System.out.println("\n\t>> 1~4사이의 수를 입력하세요.");
      }
      while (rtv.getInwon() <1 || rtv.getInwon() >4);
  }//end selInwon()



   // 1관 좌석선택 메소드 (예매 좌석 □→■ 변경, 좌석번호 저장)
   public static void selOne() throws IOException, InterruptedException
   {
	   rtv.cSeat ="";
       sc = new Scanner(System.in);

     for (int i=0 ; i<rtv.getInwon() ; i++)  // 인원수만큼 반복
     {
        // ★ 추가
        //rtv.rSeat[i] = "";

        do
        {
           t = "";       // 좌석번호 담을 임시 문자열 변수 초기화
           temp = 0;     // 좌석의 인덱스값 담을 임시 정수 변수 초기화
           System.out.printf("\t%d번째 좌석의 열을 입력하세요(A~E) : ", (i+1));
           char a = (char)System.in.read();
           switch (a)
           {
              case 'A': case 'a': {temp += 0;  t += "A"; break;}  // a or A 입력시...
              case 'B': case 'b': {temp += 10; t += "B"; break;} 
              case 'C': case 'c': {temp += 20; t += "C"; break;} 
              case 'D': case 'd': {temp += 30; t += "D"; break;} 
              case 'E': case 'e': {temp += 40; t += "E"; break;} 
              default : System.out.println("\t>> 잘못입력하셨습니다.\n"); break;
           }
           System.in.skip(2);
           do
           {
              n = 0;      // 좌석번호(1~10) 담을 임시 변수
              System.out.print("\t좌석 번호를 입력하세요(1~10) : ");
              n = sc.nextInt();
              if (n < 1 || n > 10)
                 System.out.println("\t>> 잘못입력하셨습니다.\n");
           }
           while (n < 1 || n > 10);
          
           
           temp += (n-1); // temp에 좌석번호(1~10) 담기

           if (temp%3==0) // 사회적 거리두기 좌석일시...
           {
              System.out.println();
              System.out.println("\t>> 선택하신 좌석은 사회적 거리두기 좌석입니다.");
              System.out.println("\t>> 비어있는 좌석을 선택하세요.\n");
              t="";       //  좌석의 열번호 초기화
           }

        }
        while (temp%3 ==0);
        //-- 여기까지 좌석의 열번호(A~E)은 t에 임시저장되고 1~10 번호는 n에 임시저장된 상태!
        
        // 좌석번호 인덱스 담는 배열에 임시저장한 값(열) 대입
        rtv.seat[i] += temp;

        // 예매된 좌석 담는 배열에 임시저장한 좌석번호 (A~E)열값 대입
        rtv.rSeat[i] += t; 

        switch(temp%10) // 한 줄에 좌석이 10개이므로 10으로 나눈 몫이...
        {
            // 1 2 3 통로 4 5 6 7 통로 8 9 10
            case 0 : rtv.rSeat[i] += "1"; break; // 0 이면 좌석번호 "1" 부여... "A" + "1" → "A1"
            case 1 : rtv.rSeat[i] += "2"; break;
            case 2 : rtv.rSeat[i] += "3"; break;
            case 3 : rtv.rSeat[i] += "4"; break;
            case 4 : rtv.rSeat[i] += "5"; break;
            case 5 : rtv.rSeat[i] += "6"; break;
            case 6 : rtv.rSeat[i] += "7"; break;
            case 7 : rtv.rSeat[i] += "8"; break;
            case 8 : rtv.rSeat[i] += "9"; break;
            case 9 : rtv.rSeat[i] += "10"; break;
            default : System.out.println("\t>> 잘못입력하셨습니다.\n"); break;
        }   
        // 예매된 좌석 1관 좌석 ■ 로 바꾸기
        //mr1[인덱스값] = '■';
        rtv.getOne()[rtv.seat[i]] = '■';
     }// 인원수만큼 반복 완료
     // 예매 정보 확인에서 쓸 문자열 변수에 좌석번호 담기 → "A1 A2 A3 A4"
     for (int i=0 ; i<rtv.getInwon(); i++)
        rtv.cSeat += rtv.rSeat[i] +" ";

    // 예매 정보 확인 메소드 호출
    checkSel();
   }// end selOne()

   
   // 예매 정보 확인 메소드 
   public static void checkSel() throws IOException, InterruptedException
   {
      System.out.print("\n\n\n\t===============================================");
        System.out.print("\n\t                *예매 정보 확인*  ");
        System.out.print("\n\t-----------------------------------------------");
        System.out.println("\n\t선택한 영화 : " + checkMovie);
      System.out.printf("\n\t%s의 상영 시간 : %s", checkMovie, checkTime);
      System.out.printf("\n\t%s의 상영관    : 1관", checkMovie);
      System.out.print("\n\t선택한 좌석 : " + rtv.cSeat);
        System.out.print("\n\t===============================================");
        System.out.print("\n\t 상단 내용으로 결제를 진행하겠습니다.\n");
      
      moviePayTot = rtv.inwon * 10000;
      PayDisc.selMem();
      // 테스트
      //System.out.println("영화가격 :" + moviePayTot);
   }


  // 2관 좌석선택 메소드 (예매 좌석 ■으로 변경, 좌석번호 저장)
  public static void selTwo() throws IOException
   {
     sc = new Scanner(System.in);

     for (int i=0 ; i<rtv.getInwon() ; i++)
     {
        do
        {
           t = "";
           temp = 0;
           System.out.printf("\t%d번째 좌석의 열을 입력하세요(A~E) : ", (i+1));
           char a = (char)System.in.read();
           switch (a)
           {
              case 'A': case 'a': {temp += 0;  t += "A"; break;} 
              case 'B': case 'b': {temp += 10; t += "B"; break;} 
              case 'C': case 'c': {temp += 20; t += "C"; break;}  
              case 'D': case 'd': {temp += 30; t += "D"; break;} 
              case 'E': case 'e': {temp += 40; t += "E"; break;} 
              default : System.out.println("\t>> 잘못입력하셨습니다.\n"); break;
           }

           System.in.skip(2);

           do
           {
              n = 0;
              System.out.print("\t좌석 번호를 입력하세요(1~10) : ");
              n = sc.nextInt();
              if (n < 1 || n > 10)
                 System.out.println("\t>> 잘못입력하셨습니다.\n");
           }
           while (n < 1 || n > 10);
          
           // temp에 좌석번호(1~10) 담기
           temp += (n-1);

           if (temp%3==0)
           {
              System.out.println();
              System.out.println("\t>> 선택하신 좌석은 사회적 거리두기 좌석입니다.");
              System.out.println("\t>> 비어있는 좌석을 선택하세요.\n");
              t="";
           }

        }
        while (temp%3 ==0);
        
        // 임시저장한 값 담기(좌석번호 인덱스 담는 배열)
        rtv.seat[i] += temp;

        // 사용자에게 안내해줄 좌석번호 (A~E)열값 담김
        rtv.rSeat[i] += t;

        switch(temp%10)
        {
            case 0 : rtv.rSeat[i] += "1"; break;
            case 1 : rtv.rSeat[i] += "2"; break;
            case 2 : rtv.rSeat[i] += "3"; break;
            case 3 : rtv.rSeat[i] += "4"; break;
            case 4 : rtv.rSeat[i] += "5"; break;
            case 5 : rtv.rSeat[i] += "6"; break;
            case 6 : rtv.rSeat[i] += "7"; break;
            case 7 : rtv.rSeat[i] += "8"; break;
            case 8 : rtv.rSeat[i] += "9"; break;
            case 9 : rtv.rSeat[i] += "10"; break;
            default : System.out.println("\t>> 잘못입력하셨습니다.\n"); break;
        }
        
        
        // 테스트(좌석의 인덱스번호 seat 배열 입력)
        //System.out.printf("rtv.seat[%d]안의 값 : %d\n", i, rtv.seat[i]);
         
        // 예매한 좌석 ▩ 로 바꾸기
        rtv.getTwo()[rtv.seat[i]] = '■';
        //char[] mr1[10] = '▩';
     }
     
     // 테스트(예매한 좌석번호 출력) → rtv.rSeat[i]
     //System.out.printf("예매한 좌석번호 : %s\n", rtv.rSeat[i]);

     
     for (int i=0 ; i<rtv.getInwon(); i++)
     {
        System.out.printf("%d번째 좌석번호 : %s\n", i+1, rtv.rSeat[i]);
        rtv.cSeat += rtv.rSeat[i] +" ";
     }
     
     
  }// end selTwo()


  // 3관 좌석선택 메소드 (예매 좌석 ■으로 변경, 좌석번호 저장)
  public static void selThree() throws IOException
  {
     sc = new Scanner(System.in);

     for (int i=0 ; i<rtv.getInwon() ; i++)
     {
        do
        {
           t = "";
           temp = 0;
           System.out.printf("\t%d번째 좌석의 열을 입력하세요(A~D) : ", (i+1));
           char a = (char)System.in.read();
           switch (a)
           {
              case 'A': case 'a': {temp += 0;  t += "A"; break;} 
              case 'B': case 'b': {temp += 8; t += "B";  break;}  
              case 'C': case 'c': {temp += 16; t += "C"; break;}  
              case 'D': case 'd': {temp += 24; t += "D"; break;} 

              default : System.out.println("\t>> 잘못입력하셨습니다.\n"); break;
           }

           System.in.skip(2);

           do
           {
              n = 0;
              System.out.print("\t좌석 번호를 입력하세요(1~8) : ");
              n = sc.nextInt();
              if (n < 1 || n > 8)
                 System.out.println("\t>> 잘못입력하셨습니다.\n");
           }
           while (n < 1 || n > 8);
          
           // temp에 좌석번호(1~8) 담기
           temp += (n-1);

           if (temp%3==0)
           {
              System.out.println();
              System.out.println("\t>> 선택하신 좌석은 사회적 거리두기 좌석입니다.");
              System.out.println("\t>> 비어있는 좌석을 선택하세요.\n");
              t="";
           }

        }
        while (temp%3 ==0);
        
        // 임시저장한 값 담기(좌석번호 인덱스 담는 배열)
        rtv.seat[i] += temp;

        // 사용자에게 안내해줄 좌석번호 (A~D)열값 담김
        rtv.rSeat[i] += t;

        switch(temp%8)
        {
            case 0 : rtv.rSeat[i] += "1"; break;
            case 1 : rtv.rSeat[i] += "2"; break;
            case 2 : rtv.rSeat[i] += "3"; break;
            case 3 : rtv.rSeat[i] += "4"; break;
            case 4 : rtv.rSeat[i] += "5"; break;
            case 5 : rtv.rSeat[i] += "6"; break;
            case 6 : rtv.rSeat[i] += "7"; break;
            case 7 : rtv.rSeat[i] += "8"; break;
            default : System.out.println("\t>> 잘못입력하셨습니다.\n"); break;
        }
        
        
        // 테스트(좌석의 인덱스번호 seat 배열 입력)
        //System.out.printf("rtv.seat[%d]안의 값 : %d\n", i, rtv.seat[i]);
         
        // 예매한 좌석 ▩ 로 바꾸기 → 성공
        rtv.getThree()[rtv.seat[i]] = '■';
        //char[] mr1[10] = '▩';
     }
     
     // 테스트(예매한 좌석번호 출력) → rtv.rSeat[i]
     //System.out.printf("예매한 좌석번호 : %s\n", rtv.rSeat[i]);

     
     for (int i=0 ; i<rtv.getInwon(); i++)
     {
        System.out.printf("%d번째 좌석번호 : %s\n", i+1, rtv.rSeat[i]);
        rtv.cSeat += rtv.rSeat[i] +" ";
     }
     //System.out.println(rtv.cSeat);

  }// end selThree()

    // 1-2 영화로 예매하기 메소드 - 날짜 
    public static void selMovie()
    {
      printMlist();
      System.out.println("");
      
    }


}

//===============================================================================================================