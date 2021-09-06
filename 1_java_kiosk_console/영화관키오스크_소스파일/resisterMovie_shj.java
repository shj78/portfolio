class  
{
  // 영화정보 등록 메소드 
  public static void registerMovie() 
  {
	 Scanner sc = new Scanner(System.in);

	 String title="";	// 영화 제목 변수 
	 String genre;		// 영화 장르
	 String openDate;	// 영화 개봉일자
	 String endDate;	// 영화 종영일자
	 String story;		// 영화 줄거리
	 int age;			// 영화 관람가능연령
	 int time;			// 영화 총 상영시간
	 int star;			// 영화 평점
	 String answer="";
	 int t=0;					//do while을 처음 돌 때 기본 값 
	 //String yy, mm, dd;				// 개봉, 종영일자 유효성 검사를 위한 변수
	 int yy, mm, dd;
	 int oyy, omm, odd, emm, edd;    // 개봉, 종영일자 유효성 검사를 위한 변수
	 boolean flag;				 // do while문을 빠져나가기 위한 
	 
	 System.out.println("\n\n");
	 System.out.println("\t영화 등록                                   -1. 영화 관리 메뉴");
	 System.out.println("\t==============================================================");
	
	 // 영화 제목은 중복 불가능
	 do
	 {	
		 if (t>0)
			System.out.println("\t" + title + "은 이미 등록되어있습니다.");

		 System.out.print("\t>> 등록할 영화 제목을 입력하세요 : ");
		 title = sc.nextLine();
		 
		 // 영화 관리 메뉴로 돌아가기 위해
		 if (title.equals("-1"))
			 return; 

		 t++;
	 }
	 while (ht.containsKey(title));
		  
	 // 장르는 중복 가능 
	 System.out.println();
	 System.out.print("\t>> 등록할 영화 장르를 입력하세요 : ");
	 genre = sc.next();
	 
	 //언제든지 초기화면으로 돌아갈 수 있다. 
	 if (genre.equals("-1"))
			 return; 
	
	 t = 0;			// do while문을 돌기 위해 t 초기화 
	 
	 do
	{
		 //flag = false;	// do while문을 돌기 위해 flag 값 초기화

		 if (t>0)
			 System.out.println("\n\t>> 입력한 일자가 유효하지 않습니다.");
		
		while (false)		// 예외처리를 하기 위한 반복문 
		{
			 flag = true;	// do while문을 돌기 위해 flag 값 초기화
			 
			 System.out.println();
			 System.out.print("\t>> 등록할 영화 개봉 일자를 입력하세요 (YY-MM-DD) : ");
			 
			 openDate = sc.next();	
			 //ex String openDate = "21-06-13"; 형태로 입력될 예정임;
			 
			 // 영화 관리로 돌아가기 위해
			 if (openDate.equals("-1"))
				 return; 

			 //포맷에 대한 유효성 검사
			 SimpleDateFormat dateFormatParser = new SimpleDateFormat("yyyy/MM/dd"); //검증할 날짜 포맷 설정

			 try
			 {

				/*
				// 입력한 개봉일 가져오기 
				 yy = openDate.substring(0,2);		// 사용자가 입력한 년도만 잘라서 yy 변수에 저장
				 mm = openDate.substring(3,5);		// 사용자가 입력한 월만 잘라서 mm 변수에 저장
				 dd = openDate.substring(6,8);		// 사용자가 입력한 일만 잘라서 dd 변수에 저장
				

				 String hi = openDate.substring(4,5);
				 String hell = openDate.substring(7,8);

				 // 영화 관리 메뉴로 이동, 반복문 종료겠지
				 if (!hi.equals("-")) // a != "-" or b != "-" 이런 조건은 뒤에 조건이 아예 무시된 채로 앞 조건만 만족해도 true 반환이다. 쓰지 말것. 
				 {	
					flag = true;
					break;
				 }

				if(!hell.equals("-"))
				 {
					flag = true;
					break;									 
				}
         

				// 정수형으로 변경
				 omm = Integer.parseInt(mm);		// 월만 잘랐던 변수 정수형으로 변환 (Open month)
				 odd = Integer.parseInt(dd);		// 일만 잘랐던 변수 정수형으로 변환 (Open day)	
				 oyy = Integer.parseInt(yy);		// 년만 잘랐던 변수 정수형으로 변환 (Open year)

				 //break; 
				 */
				 flag = checkDate(openDate); // false 아니면 true를 반환 - 아래 catch문이 필요없어짐
				 
				 //날짜 포맷에 맞지 않을 경우
				 //- 날짜 포맷에 맞다면 if문 Jump
				 if(flag==false)
					 break;
 
				//년, 월, 일 추출을 위해서 String > Date > Calendar 변경
				Date date = dateFormatParser.parse(opendate);
				Calendar cal = Calendar.getInstance();
				cal.setTime(date); 

				//cal.getTime() - openDate의 Calendar 형태
				yy = cal.get(Calendar.YEAR);
				mm = cal.get(Calendar.MONTH) + 1;
				dd = cal.get(Calendar.DAY_OF_MONTH);
				



			 }
			 catch (NumberFormatException e) // 문자열을 숫자로 변환시 문자열의 값이 숫자가 아니라면 
			 {
				 //System.out.println("\n\t>> 잘못 입력하셨습니다. 입력 형식에 맞춰 입력해주세요.");
			 }
			 catch (StringIndexOutOfBoundsException so)	// 문자열의 substring 중 글자수가 부족하다면
			 {
				 //System.out.println("\n\t>> 잘못 입력하셨습니다. 입력 형식에 맞춰 입력해주세요.");
			 }

		}
		  // 입력 받은 개봉일 유효성 검사

		 // 평년과 윤년 구별
		 String result = (oyy%4==0&&oyy%100!=0||oyy%400==0? "윤년": "평년");


		 if (mm<1 || mm>12)				// 월이 1~12가 아니라면 
			 flag = true;

		 if (dd>31)						// 일이 31일이 넘으면
			 flag = true;
		 else if (result=="평년" && mm==2 && dd>28)			// 평년 2월일 시 28일이 넘으면   
			 flag = true;
		 else if (result=="윤년" && mm==2 && dd>29)			// 윤년 2월일 시 29일이 넘으면     
			 flag = true;
		 else if ((mm==4 || mm==6 || mm==9 || mm==11) && dd>30)	// 4, 6, 9. 11월일시 30일이 넘으면 
			 flag = true;

		 t++;
	 }
	 while (flag);
	
	   
	 t = 0;			// do while문을 돌기 위해 t 초기화 

	 do
	 {
		 // flag = false;	// do while문을 돌기 위해 flag 값 초기화

		 if (t>0)
			 System.out.println("\n\t>> 입력한 일자가 유효하지 않습니다.");

		 while (true)		// 예외처리를 하기 위한 반복문 
		 {
			 flag = false;

			 try
			 {
				 System.out.println();
				 System.out.print("\t>> 등록할 영화 종영 일자를 입력하세요 (YY-MM-DD) : ");
				 endDate = sc.next();

				 // 영화 관리 메뉴로 이동, 메소드 종료
				 if (endDate.equals("-1"))
					 return; 

				 // 입력한 종영일자 가져오기 
				 yy = endDate.substring(0,2);		// 사용자가 입력한 년도만 잘라서 yy 변수에 저장
				 mm = endDate.substring(3,5);		// 사용자가 입력한 월만 잘라서 mm 변수에 저장
				 dd = endDate.substring(6,8);		// 사용자가 입력한 일만 잘라서 dd 변수에 저장
				 
				 //System.out.println("\t"+mm+"-"+dd);
				 // 정수형으로 변경
				 emm = Integer.parseInt(mm);		// 월만 잘랐던 변수 정수형으로 변환 (end month)
				 edd = Integer.parseInt(dd);		// 일만 잘랐던 변수 정수형으로 변환	(end day)

				 String hi = endDate.substring(2,3);	// 사용자가 입력한 문자열 잘라서 저장 (하이픈, 양식이 맞나 검사하기 위해) 
				
				 // 입력 받은 종영일 유효성 검사
				 if (!hi.equals("-"))				// 하이픈이 아니라면
				  flag = true;

				  break;
			 }
			 catch (NumberFormatException e) // 문자열을 숫자로 변환시 문자열의 값이 숫자가 아니라면 
			 {
				 System.out.println("\n\t>> 잘못 입력하셨습니다. 입력 형식에 맞춰 입력해주세요.");
			 }
			 catch (StringIndexOutOfBoundsException so)	// 문자열의 substring 중 글자수가 부족하다면
			 {
				 System.out.println("\n\t>> 잘못 입력하셨습니다. 입력 형식에 맞춰 입력해주세요.");
			 }
		 }
		

		 if (emm<1 || emm>12)				// 월이 1~12가 아니라면
			 flag = true;

		 if (edd>31)						// 일이 31일이 넘는다면 
			 flag = true;
		 else if (emm==2 && edd>28)			// 2월일시 28일이 넘으면
			 flag = true;
		 else if ((emm==4 || emm==6 || emm==9 || emm==11) && edd>30)	// 4, 6, 9. 11월일시 30일이 넘으면 
			 flag = true;
		 
		 if (omm>emm)						// 개봉 달이 종영 달보다 크다면
			 flag = true;

		 if (omm==emm && odd>edd)			// 개봉 달과 종영 달이 같은데 개봉일이 종영일보다 크다면
			 flag = true;

		 t++;
	 }
	 while (flag);

	 sc.nextLine();
	 System.out.println();
	 System.out.print("\t>> 등록할 영화 줄거리를 입력하세요 : ");
	 story = sc.nextLine();
	 // 영화 관리 메뉴로 이동, 메소드 종료
	 if (story.equals("-1"))
		 return;
	 
	 while (true)
	 {
		 System.out.println();
		 System.out.print("\t>> 등록할 영화 관람 가능 연령을 입력하세요 : ");
		 try
		 {
		    age = sc.nextInt();

			break;
		 }
		 catch (InputMismatchException e)
		 {
			 sc = new Scanner(System.in);
			System.out.println("\t>> 잘못 입력하셨습니다. 정수만 입력해 주세요.\n");
		 }
	 }
	 
	 // 영화 관리 메뉴로 이동, 메소드 종료
	 if (age == -1)
		 return;
	 
	 while (true)
	 {
		 System.out.println();
		 System.out.print("\t>> 등록할 영화 총 상영시간을 입력하세요 (MM) : ");

		 try
		 {
			time = sc.nextInt();

			break;
		 }
		 catch (InputMismatchException e)
		 {
			 sc = new Scanner(System.in);
			System.out.println("\t>> 잘못 입력하셨습니다. 정수만 입력해 주세요.\n");
		 }
	 }
	
	 // 영화 관리 메뉴로 이동, 메소드 종료
	 if (time == -1)
		 return;
	 
	 while (true)
	 {
		 System.out.println();
		 System.out.print("\t>> 등록할 영화 평점을 입력하세요. : ");

		 try
		 {
			star = sc.nextInt();

			break;
		 }
		 catch (InputMismatchException e)
		 {
			 sc = new Scanner(System.in);
			System.out.println("\t>> 잘못 입력하셨습니다. 정수만 입력해 주세요.\n");
		 }
	 }
	 
	 // 영화 관리 메뉴로 이동, 메소드 종료
	 if (star == -1)
		 return;
	 
	 // 입력받은 영화 정보 hashtable에 넣기 
	 ht.put(title,(new MovieVO(title, genre, openDate, endDate, story, age, time, star)));		// Hashtable<영화제목, 영화정보>
	 //ht.put("미나리",(new MovieVO("미나리", "가족", "02-19", "04-01", "재미교포 이야기", 12, 115, 8)));
	 //ht.put("소울",(new MovieVO("소울", "애니", "02-27", "03-27", "음악 영화", 15, 100, 9)));

	 System.out.println();
	 System.out.println("\t>> 영화『"+title+"』이(가) 정상적으로 등록 완료되었습니다.");
	 

  } // end registerMovie() 영화 등록 메소드 

	public static void main(String[] args) 
	{
		System.out.println("Hello World!");
	}
}
