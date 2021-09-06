import java.util.*;
import java.lang.*;
import java.text.SimpleDateFormat;

class  RM_shj
{
  // 영화정보 등록 메소드 
	public static void registerMovie() 
	{

	 Scanner sc = new Scanner(System.in);

	 String openDate;	// 영화 개봉일자
	 String endDate;	// 영화 종영일자
	 int age;			// 영화 관람가능연령
	 int time;			// 영화 총 상영시간
	 int star;			// 영화 평점
	 String answer="";
	 int t=0;					//do while을 처음 돌 때 기본 값 

	 int yy, mm, dd;
	 yy=mm=dd=0;

	 boolean flag;				 // do while문을 빠져나가기 위한 
	 
	 System.out.println("\n\n");
	 System.out.println("\t영화 등록                                   -1. 영화 관리 메뉴");
	 System.out.println("\t==============================================================");

	 t = 0;			// do while문을 돌기 위해 t 초기화 
	 
		do
		{
			flag = false;	// do while문을 돌기 위해 flag 값 초기화
			
			while (flag==false)		// 예외처리를 하기 위한 반복문 
			{
				 flag = true;	// do while문을 돌기 위해 flag 값 초기화
				 
				 System.out.println();
				 System.out.print("\t>> 등록할 영화 개봉 일자를 입력하세요 (YY-MM-DD) : ");
				 
				 openDate = sc.next();	
				 //ex String openDate = "21-06-13"; 형태로 입력될 예정임;

				 try
				 {
					//포맷에 대한 유효성 검사
					SimpleDateFormat dateFormatParser = new SimpleDateFormat("yyyy-MM-dd"); //검증할 날짜 포맷 설정
					dateFormatParser.setLenient(false); //false일경우 처리시 입력한 값이 잘못된 형식일 시 오류가 발생
					dateFormatParser.parse(openDate); //대상 값 포맷에 적용되는지 확인
					
					 //break; 
					
					 //날짜 포맷에 맞을 경우 예외를 던지지 않음
					 flag = true; 
					 
					 //날짜 포맷에 맞지 않을 경우 예외를 던짐				 

					//- 날짜 포맷에 맞다면 if문 Jump
					
					//년, 월, 일 추출을 위해서 String > Date > Calendar 변경
					Date date = dateFormatParser.parse(openDate);
					Calendar cal = Calendar.getInstance();
					cal.setTime(date); 

					//cal.getTime() - openDate의 Calendar 형태
					yy = cal.get(Calendar.YEAR);
					mm = cal.get(Calendar.MONTH) + 1;
					dd = cal.get(Calendar.DAY_OF_MONTH);

				 }
				 catch (Exception e) 
				 {
					 flag = false;
					 System.out.println("\n\t>> 잘못 입력하셨습니다. 입력 형식에 맞춰 입력해주세요.");
				 }

			}
			  // 입력 받은 개봉일 유효성 검사

			 // 평년과 윤년 구별
			 String result = (yy%4==0&&yy%100!=0||yy%400==0? "윤년": "평년");


			 if (mm<1 || mm>12)				// 월이 1~12가 아니라면 
				 flag = false;

			 if (dd>31)						// 일이 31일이 넘으면
				 flag = false;
			 else if (result=="평년" && mm==2 && dd>28)			// 평년 2월일 시 28일이 넘으면   
				 flag = false;
			 else if (result=="윤년" && mm==2 && dd>29)			// 윤년 2월일 시 29일이 넘으면     
				 flag = false;
			 else if ((mm==4 || mm==6 || mm==9 || mm==11) && dd>30)	// 4, 6, 9. 11월일시 30일이 넘으면 
				 flag = false;

			 t++;
		 }
		 while (flag==false);
	 
	 t = 0;			// do while문을 돌기 위해 t 초기화 


	} // end registerMovie() 영화 등록 메소드 

	public static void main(String[] args) 
	{
		registerMovie();
	}
}
