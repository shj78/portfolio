import java.util.Scanner;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Set;
import java.util.Arrays;
import java.util.ListIterator;
import java.util.Iterator;
import java.util.Random;

import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.lang.Thread;
import java.io.IOException;

//==================================================================================================================

/*
	Title	 : Pay
	Function : 티켓 가격 및 할인 적용, 결제수단 입력 및 결제 결과 출력, 로딩 및 광고 출력, 영화표/교환권/영수증 출력  
	author	 : 김서현, 심혜진
*/

//==================================================================================================================


class RsvNumbVO
{
	// 사용자가 예매를 완료하고 선택이 된 정보들에 대한 변수
	public static String rMem;			// 예매번호	
	public static String rMovie;		// 영화 제목	
	public static String cSeat;			// 좌석번호
	public static String lastTimeTable;	// 상영시간
    public static String rmNum;         // 상영관


   //예매번호, 제목, 상영날짜, 좌석번호
   RsvNumbVO(String rMem, String rMovie, String cSeat, String lastTimeTable, String rmNum)
   {
      this.rMem = rMem;
      this.rMovie = rMovie;
      this.cSeat = cSeat;
      this.lastTimeTable = lastTimeTable;
      this.rmNum = rmNum;
   }

   @Override
   public String toString()
   {
	  return "\n\t예매번호 : "+rMem+"\n\t영화 제목 : "+rMovie+"\n\t상영관 : "+rmNum+"1관\n\t좌석 : "+cSeat+"\n\t상영시간 : "+lastTimeTable+            // ★ 변경
         "\n\n\t====================================";   																			
   }	
}

// 결제 클래스 → 1. 할인에 관한 정보 제공, 적용하는 클래스 / 2. 할인 적용된 최종 금액으로 결제 진행하는 클래스 2가지로 분리
// 1. PayDisc 회원/비회원 확인 및 할인 적용, 적립금 사용
class PayDisc extends Record
{
	public static ReserveTiketsVO rt = new ReserveTiketsVO();

	// 결제 진행하기 전 회원/비회원 확인 메소드
	public static void selMem() throws InterruptedException,IOException
	{
		do	// 1, 2 입력 받을 때까지 반복
		{
			Scanner sc = new Scanner(System.in);
			System.out.print("\n\n\n\n\n\t===============================================");
			System.out.print("\n\t\t    *결제 진행 전 회원 확인*  ");
			System.out.print("\n\t-----------------------------------------------");
			System.out.print("\n\t              1. 회원 | 2. 비회원");
			System.out.print("\n\t===============================================");
			System.out.print("\n\t>> 해당하는 번호를 입력해주세요 : ");
			sel = sc.nextInt();

			if (sel>0)
			{
				if (sel==1 || sel==2)
					break;
				System.out.println("\n\t>> 잘못된 번호를 입력했습니다. 다시 입력해주세요.\n");
			}
		}
		while (sel<1 || sel>2);

		recogMem(); // 입력받은 결과에 따라 다음 단계 안내하는 recogMem 메소드 호출
	} // end selMem 회원/비회원 선택 메소드


	// 회원번호(전화번호) 등록되어있는 정보인지 판별
	public static void recogMem() throws InterruptedException,IOException
	{
		if (sel==1) // 회원일 때
		{
			Scanner sc = new Scanner(System.in);

			System.out.println("\n\n\n\n\n\t[ 회원 정보 확인 ]");
			System.out.println("\t===============================================");
			System.out.print("\t전화 번호를 입력해주세요.(xxx-xxxx-xxxx) : ");
			String tel = sc.nextLine();
			search(tel); // 회원인지 확인 위해 입력받은 전화번호 search() 메소드에 넘겨주고
		}
		else if(sel==2)
			noMemAge(); // 비회원 메소드 호출

	} // end recogMem 회원 확인 메소드

	// 회원으로 확인된 후 할인 및 적립금 사용 안내 메소드
	public static void search(String tel) throws InterruptedException,IOException
	{
		Scanner sc = new Scanner(System.in);

		Members.oldMem(); // Members에 등록되어있는 회원 정보 기반으로 확인하기 위해 호출
						  // Members.mData는 회원들의 정보를 담고있는 ArrayList > 사이즈 확인(회원 수만큼 반복)
		for (int i = 0; i < (Members.mData).size() ; i++) 
        {
			// ArrayList에 저장되어있는 값들 중 전화번호 불러오기
			String str = (Members.mData).get(i).getTel();
	 
			// ArrayList의 Tel과 입력한 Tel이 같으면
			// 그 Tel을 가진 회원 정보를 모두 출력
			if (tel.equals(str)) 
			{
				String name = (Members.mData).get(i).getName(); // 인사말에 넣기 위한 이름 get해오기
				System.out.printf("\t%s 회원님 안녕하세요!\n\t", name);

				culDisc(); // 회원이 확인되어 문화의 날 안내 메소드 호출

				// 해당 회원이 가지고 있는 포인트(getPoint)가 2000원이 넘는다면 사용 가능하다는 조건 설정
				if ((Members.mData).get(i).getPoint()>=2000)
				{
					// 적립금 사용할 시 차감하고 다시 반여할 수 있는 usePoint 변수
					int usePoint = (Members.mData).get(i).getPoint(); // getPoint로 알아온 포인트를 usePoint에 저장
					System.out.println("\n\n\n\n\n\t[ 적립금 사용 확인 ]");
					System.out.println("\t===============================================");
					System.out.printf("\t현재 적립금 [%d원] 남아있습니다. \n\t사용하시겠습니까? (Y/N) : ", usePoint);
					answer = (char)System.in.read();
					System.in.skip(2);

					if (answer=='y' || answer=='Y')
					{
						System.out.print("\n\t>> 사용할 적립금을 입력해주세요. : ");
						su = sc.nextInt();
						usePoint -= su; // 적립금에서 사용 적립금 빼기
						(Members.mData).get(i).setPoint(usePoint); // 적립금 차감한 금액 다시 set 해주기
						//System.out.print("적립금 확인 : " + usePoint);
						System.out.printf("\t>> [%d]원 사용 완료했습니다. (남은 적립금 : %d)\n", su, usePoint);

						// 문화의 날 할인 > 스낵 추가 구매로
						Pay.selSnack();
					}	Pay.selSnack();
				}
				else // 적립금 2000원보다 적으면 사용불가라서 바로 스낵 추가구매로 넘어감
					Pay.selSnack(); 
			}
			else // 적립금이 2000원이 이상이 아니라면
			{
				System.out.println("\n\n\t존재하지 않는 회원입니다. 다시 선택해주세요.");
				break; // 여길 빠져나가면 다시 회원/비회원 선택하는 recogMem() 메소드로
			}
	    }	
	} // end search

	// 비회원 연령 확인 메소드
	public static void noMemAge() throws InterruptedException,IOException
	{
		Scanner sc = new Scanner(System.in);
		Set<String> keys = AdminMovie.ht.keySet(); // key값(영화 제목) 가져오기
		Iterator<String> it = keys.iterator();	   // 해당 영화의 정보 확인하기 위해 Iterator 생성
		String temp="";							   // 유효성 확인할 때 담아두는 임시 변수
		boolean flag = false;
		
		if (AdminMovie.ht.get(ReserveTikets.checkMovie).getmAge()==19) // 사용자가 선택한 영화가 19세 관람 불가라면
		{
			do // 유효성 검사를 위한 반복문
			{
				System.out.printf("\n\n\n\n\n\t[%s] 영화는 주민번호 확인이 필요합니다.",
				AdminMovie.ht.get(ReserveTikets.checkMovie).getmTitle()); // 주민번호 확인 안내멘트에 들어갈 영화이름 가져오기
				System.out.print("\n\t주민등록번호를 입력하세요(xxxxxx-xxxxxxx) : ");
				temp = sc.next();

				// 주민번호 유효성 검사 시작
				int[] chk = {2, 3, 4, 5, 6, 7, 0, 8, 9, 2, 3, 4, 5}; 
				int tot = 0;

				for (int i=0 ; i<13 ; i++) // i → 0 1 2 3 4 5 6 7 8 9 10 11 12
					{
						if (i==6)
							continue;			
						tot += chk[i] * Integer.parseInt(temp.substring(i,i+1));
					}
				
				int su = 11 - tot % 11;
				su = su % 10;
				// 주민번호 유효성 검사 끝
				int nowYear = Calendar.getInstance().get(Calendar.YEAR);

				if (su == Integer.parseInt(temp.substring(13))) // 유효한 주민번호라면
				{
					int birYear20 = Integer.parseInt("20" + temp.substring(0,2));
					
					if (nowYear-birYear20<19)
					{
						System.out.print("\n\t>> 죄송합니다. 해당 영화는 청소년 관람 불가로 예매를 진행할 수 없습니다.\n\t예매 초기화면으로 돌아갑니다.\n");
						User.startUser(); // 예매 초기화면으로
					}	
					else // 연산이 19이상 나오면 관람 가능하니까 문화의 날 할인 > 스낵 추가 구매로
					{
						culDisc();
						Pay.selSnack();
					}
				}
				else
				{	// 존재하지 않는 주민번호 입력, flag는 true로 다시 반복문 실행
					flag=true;
					System.out.println("\n\t존재하지 않는 주민번호입니다. 다시 입력하세요.\n\n");
				}
			} 
			while (flag);				
		} 
		else // 19세 관련 영화 아니면 문화의 날 할인 > 스낵 추가 구매로
		{
			culDisc();
			Pay.selSnack();
		}
	}


	// 문화의 날 할인 메소드
	public static void culDisc()
	{
		Calendar cal = Calendar.getInstance();
		w = cal.get(Calendar.DAY_OF_WEEK);

		if (w==3) // 발표하는 요일로 맞추면 될듯
		{
			System.out.println("\n\n\n\n\n\t ◆◆[ 문화의 날 안내 ]◆◆");
			System.out.println("\t===============================================");
			System.out.println("\t오늘은 문화의 날!\n\t영화를 반값에 즐기세요!");
			System.out.println("\t-----------------------------------------------");
			System.out.println("\t할인 적용된 금액 : [" + moviePayTot/2 + "원]");
		}
	} // end culDisc 문화의 날 할인 메소드
} // end PayDisc class 




// 2. 할인 적용된 금액 + 스낵 추가구매 확인 및 최종금액 결제 클래스
class Pay extends AdminCashVO
{
	// key값으로 예매번호를 담고 value값으로 RsvNumbVO형을 담는 nRsv 해시테이블 생성 
    public static Hashtable<String, RsvNumbVO> nRsv;

    static ReserveTiketsVO rt = new ReserveTiketsVO();
	static AdminCashVO ac = new AdminCashVO();

	static Date payToday = new Date();		//-- 결제시간 확인용
	static SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
	static SimpleDateFormat time = new SimpleDateFormat("hh:mm:ss a");
	static String payDate = date.format(payToday); //-- 결제한 날짜 담기
	static String payTime = time.format(payToday); //-- 결제한 시간 담기

	static int payTot; //-- 영화+스낵 합산 가격
	static int a, b, c, d, inputTot, chaCash; // 지폐를 입력받아 시재에 반영하기 위한 a,b,c,d 변수
											  // 입력한 값 총합, 거스름돈(changeCash)

	public static boolean flag = false;

   static 
   {
	   nRsv = new Hashtable<>();
   }

	// 스낵 추가 구매 확인 및 결제
	static void selSnack() throws InterruptedException,IOException
	{
		BuySnacks bst = new BuySnacks(); // 스낵 관련 VO 인스턴스 생성
		Scanner sc = new Scanner(System.in);

		System.out.print("\n\n\n\t>> 팝콘/음료 추가 구매 하시겠습니까?(Y/N) : ");
		answer = (char)System.in.read();
		
		if (answer=='Y' || answer=='y')
		{
			bst.snackMenuDisp(); // 스낵 구매 메소드 호출
		}
		else
			selPay(); // 결제 수단 선택 메소드 호출
	}

	// 결제 수단 선택 메소드
	static void selPay() throws InterruptedException,IOException
	{
		payTot = snackPayTot + moviePayTot; // 영화+스낵 구매 가격
		cul = moviePayTot/2;			// 문화의 날 할인가격 담아놓기

		if (moviePayTot>0 && snackPayTot>0) // 영화, 스낵 모두 결제 금액이 있다면
		{
			if (w==3) // 문화의 날이라면
			{
				System.out.print("\n\n\n\t===============================================");
				System.out.printf("\n\t최종 결제 금액은 %d입니다.", cul+snackPayTot-su);
				System.out.print("\n\t===============================================");
			}
			else if (w!=3)
			{
				System.out.print("\n\n\n\t===============================================");
				System.out.printf("\n\t최종 결제 금액은 %d입니다.", payTot-su);
				System.out.print("\n\t===============================================");
			}
		}

		if (moviePayTot<=0 && snackPayTot>0)
		{
			System.out.print("\n\n\n\t===============================================");
			System.out.printf("\n\t최종 결제 금액은 %d입니다.", snackPayTot);
			System.out.print("\n\t===============================================");
		}

		if (moviePayTot>0 && snackPayTot<=0)
		{
			if (w==3) // 문화의 날이라면
			{
				System.out.print("\n\n\n\t===============================================");
				System.out.printf("\n\t최종 결제 금액은 %d입니다.", cul+snackPayTot-su);
				System.out.print("\n\t===============================================");
			}
			else if (w!=3)
			{
				System.out.print("\n\n\n\t===============================================");
				System.out.printf("\n\t최종 결제 금액은 %d입니다.", moviePayTot-su);
				System.out.print("\n\t===============================================");
			}
		}

		do
		{
			Scanner sc = new Scanner(System.in);

			System.out.println("\n\t1. 현금");
			System.out.println("\t2. 카드");
			System.out.print("\t결제 방법을 입력해주세요 : ");

			sel = sc.nextInt();

			if (sel>0)
			{
				if (sel==1 || sel==2)
					break;
				System.out.println("\t>> 잘못된 번호를 입력했습니다. 다시 입력해주세요.\n");
			}
		}
		while (sel<1 || sel>2);

		if (sel==1)
		{
			if (moviePayTot>0 && snackPayTot>0) // 영화, 스낵 모두 결제 금액이 있다면
			{
				payCash();
				printAd();
				receipt();
				coupon();
				User.startUser();
			}
			if (moviePayTot<=0 && snackPayTot>0) // 스낵만 결제 금액이 있다면
			{
				payCash();
				coupon();
				User.startUser();
			}
			if (moviePayTot>0 && snackPayTot<=0) // 영화만 결제 금액이 있다면
			{
				payCash();
				printAd();
				receipt();
				User.startUser();
			}
		}
		else if(sel==2)
		{
			if (moviePayTot>0 && snackPayTot>0) // 영화, 스낵 모두 결제 금액이 있다면
			{
				payCard();
				printAd();
				receipt();
				coupon();
				User.startUser();
			}
			if (moviePayTot<=0 && snackPayTot>0) // 스낵만 결제 금액이 있다면
			{
				payCard();
				coupon();
				User.startUser();
			}
			if (moviePayTot>0 && snackPayTot<=0) // 영화만 결제 금액이 있다면
			{
				payCard();
				printAd();
				receipt();
				User.startUser();
			}
		}

	} // end selPay() 결제 수단 선택 메소드


	// 현금 결제
	static void payCash() throws InterruptedException,IOException
	{
		payTot = snackPayTot + moviePayTot;

		Scanner sc = new Scanner(System.in);
		System.out.print("\n\n\n\t결제할 금액을 지폐별로 입력해주세요.");

		do // 적게 투입하면 다시 입력 요청하는 반복 실행
		{
			flag = false;
			System.out.print("\n\t>> 50000원권 : ");
			a = sc.nextInt();
			System.out.print("\t>> 10000원권 : ");
			b = sc.nextInt();
			System.out.print("\t>> 5000원권  : ");
			c = sc.nextInt();
			System.out.print("\t>> 1000원권  : ");
			d = sc.nextInt();

			inputTot = 50000*a + 10000*b + 5000*c + 1000*d;

			System.out.printf("\n\t50000원권 %d장, 10000원권 %d장, 5000원권 %d장, 1000원권 %d장 \n\t총 [%d원] 투입했습니다.\n", a, b, c, d, inputTot);

			if (payTot>inputTot)
			{
				flag = true;
				System.out.printf("\n\t[총 결제 금액(%d)]보다 [%d원]적게 투입했습니다. 다시 입력해주세요.\n", payTot, payTot-inputTot);
			}
		}
		while (flag);

		if (payTot<inputTot) // 총 금액보다 많이 투입했을 때 → 거스름돈
		{
			payi = 2; 
			//----------------- 시재에 입력받은 값 반영
			ac.setOmanwon(a);
			ac.setManwon(b);
			ac.setOcheonwon(c);
			ac.setCheonwon(d);

			//----------------- 거스름돈 계산
			chaCash = inputTot-payTot;

			int oman = chaCash / 50000;
			int man = chaCash % 50000 / 10000;
			int ocheon = chaCash % 50000 % 10000 / 5000;
			int cheon = chaCash % 50000 % 10000 % 5000 / 1000;

			if (chaCash>payHap) // 거스름돈이 현재 돈통에 있는 금액보다 많을 때(=거슬러줄 수 없음)
			{
				payi = 1; // 거슬러줄 수 없을 때 1로 변경해놓으면 초기메뉴 실행 메소드에 있는 if문으로 들어가서 카드결제 안내 공지 추가됨
				System.out.print("\n\n\n\t죄송합니다. 현재 기계에 현금 부족으로 잔돈 반환이 불가하여 결제를 진행할 수 없습니다.");
				System.out.print("\n\t===============================================");
				System.out.print("\n\t1.카드로 결제하기 | 2. 예매 진행하지 않기");
				System.out.print("\n\t===============================================");
				System.out.print("\n\t>> 다른 방법을 입력해주세요 : ");
				sel = sc.nextInt();

				if (sel==1)
					payCard();
				else if (sel==2)
					Admin.adminSalesON();
				else
					System.out.println("\t>> 잘못된 번호를 입력했습니다. 다시 입력해주세요.\n");
	
			}
			else
			{
				payi = 2; 
				System.out.printf("\n\t자판기 하단에 거스름돈 [50000원권 %d장, 10000원권 %d장, 5000원권 %d장, 1000원권 %d장]", oman, man, ocheon, cheon);
				System.out.printf("\n\t>> 총 [%d원] 받아가세요.",chaCash);
			}

			//----------------- 돌려준 거스름돈 시재에 반영(빼기)
			ac.setOmanwon(-(oman));
			ac.setManwon(-(man));
			ac.setOcheonwon(-(ocheon));
			ac.setCheonwon(-(cheon));
			ac.setCashMovie(moviePayTot);
			ac.setCashSnacks(snackPayTot);
		}
		else if (payTot==inputTot)
		{
			//----------------- 시재에 입력받은 값 반영
			ac.setOmanwon(a);
			ac.setManwon(b);
			ac.setOcheonwon(c);
			ac.setCheonwon(d);
			ac.setCashMovie(moviePayTot);
			ac.setCashSnacks(snackPayTot);

			System.out.printf("\n\t>> %d원 결제 완료됐습니다.\n", inputTot);
			System.out.println("\t(결제 시간 : " + payDate + " " + payTime + ")");
		}

		snackPayTot = 0;
		moviePayTot = 0;

	}// end payCash() 현금 결제 메소드
	
	// 카드 결제
	static void payCard() throws InterruptedException,IOException
	{
		System.out.print("\n\n\n\n\t단말기에 카드를 삽입해주세요.\n\n\n\t");

        for (int i = 0; i<3; i++) 
		{
            System.out.print("..");
            Thread.sleep(1000);
        }
        System.out.print("결제가 진행중이오니 카드를 제거하지마세요...\n\t");

		for (int i = 0; i<2; i++) 
		{
            System.out.print(".");
            Thread.sleep(1000);
        }
		System.out.println("\n\n\t결제가 완료됐습니다!\n\t카드를 제거해주세요.\n");
		ac.setCardMovie(moviePayTot);
		ac.setCardSnacks(snackPayTot);

		System.out.println("\t(결제 시간 : " + payDate + " " + payTime + ")"); 
	} // end payCard() 카드 결제

	// 광고 및 출력 여부 확인
	public static void printAd() throws IOException, InterruptedException
	{
		Random rd = new Random();
		System.out.println("\n\n\n\n\t===============================================");
		System.out.println("\t고객님! 다음에 이 영화는 어떠세요?         (AD)");
		System.out.println("\t-----------------------------------------------");

		// 등록된 영화 중 랜덤 출력(광고)

		Set<String> key = AdminMovie.ht.keySet(); // 현재 등록된 영화들 가져오기
		Iterator<String> hit = key.iterator();	  // 조회하기 위해 iterator 생성
		int rdsu = rd.nextInt(key.size());		  // 등록된 영화 수만큼 랜덤을 돌리고 숫자 받아놓기
		
		String rdMovie="";
		while (hit.hasNext())
		{
			String[] rdmTit = new String[key.size()]; // 등록된 영화 개수만큼 방 만들기
			//Object keys = hit.next();
			for(int i=0; i<key.size(); i++) // 배열에 등록된 영화 다 담고
				rdmTit[i] = hit.next();
			rdMovie = rdmTit[rdsu];	// 그 중 랜덤수에 있는 영화 빼서 담아내기
		}
		System.out.println(AdminMovie.ht.get(rdMovie)); // 광고 출력 (영화 정보)
		System.out.println("\t===============================================");


		System.out.print("\n\t영화 티켓 출력중입니다");
		for (int i = 0; i<3; i++) 
		{
            System.out.print(".");
            Thread.sleep(2000);
        }
	}

	public static void receipt() throws IOException, InterruptedException
	{

		System.out.printf("\n\n\n\n\n\t   %20s\n", "===============================");
		System.out.printf("\n\t      %13s\n", "영화 입장권");
		System.out.printf("\t      %14s\n\n", " (영수증 겸용)");
		System.out.printf("\t   %20s\n", "-------------------------------");
		System.out.printf("\t            %s\n", " |결제 시간|");
		System.out.printf("\t      %-1s  %-1s\n", payDate, payTime);
		System.out.printf("\t   %25s\n", "-------------------------------");
		System.out.printf("\t   %24s \n", "");
		System.out.printf("\t      예매번호 : %s \n", rt.rMem);
		System.out.printf("\t      %s(%d세 이상) \n", ReserveTikets.checkMovie, AdminMovie.ht.get(ReserveTikets.checkMovie).getmAge());
		System.out.printf("\t      상영 시간 : %s \n", ReserveTikets.checkTime);
		System.out.printf("\t   %25s\n", "-------------------------------");
		System.out.printf("\t      총 인원  : %d명 \n",rt.inwon);
		System.out.printf("\t      상영관   :%s관\n", AdminMovie.rm1.get(ReserveTikets.checkTime)); 
		System.out.printf("\t      좌석번호 : %s \n",rt.cSeat);
		System.out.printf("\t   %25s\n", "-------------------------------");
		System.out.printf("\t      영화 티켓 : %d \n",rt.inwon * 10000);

		Calendar cal = Calendar.getInstance();
		w = cal.get(Calendar.DAY_OF_WEEK);

		int n=0; // 할인 적용되는 금액 담아두기 위해
		if (w==3) // 발표하는 요일로 맞췄음
		{   
			System.out.printf("\t      >> 문화의 날 할인 : %d \n", moviePayTot/2);
			n = moviePayTot/2;
		}
		System.out.printf("\t      >> 적립금 차감 : %d \n", su); // 적립금 차감 담겨있음

		if (moviePayTot>0 && snackPayTot>0) // 영화, 스낵 모두 결제 금액이 있다면
		{
			System.out.printf("\t     스낵 구매 : %d \n", snackPayTot);	
			System.out.printf("\t   %25s\n", "-------------------------------");
			if (w==3) // 문화의 날이라면
			{
				System.out.printf("\t      총 결제금액 : %d \n", cul+snackPayTot-su);
			}
			else if (w!=3)
			{
				System.out.printf("\t      총 결제금액 : %d \n", payTot-su);
			}
			System.out.printf("\n\t   %20s\n", "===============================");
		}

		if (moviePayTot>0 && snackPayTot<0) // 영화만 결제 금액이 있다면
		{
			System.out.printf("\t   %25s\n", "-------------------------------");
			if (w==3) // 문화의 날이라면
				{
					System.out.printf("\t      총 결제금액 : %d \n", cul+snackPayTot-su);
				}
			else if (w!=3)
				{
					System.out.printf("\t      총 결제금액 : %d \n", moviePayTot-su);
				}
			System.out.printf("\n\t   %20s\n", "===============================");
		}

		snackPayTot = 0;
		moviePayTot = 0;


       // 해시테이블 nRsv의 value값에 예매정보 변수들을 매개값으로 받는 RsvNumbVo 기반의 새로운 인스턴스 생성하여 추가
       nRsv.put(rt.rMem, new RsvNumbVO(rt.rMem, ReserveTikets.checkMovie, ReserveTiketsVO.cSeat, ReserveTikets.lastTimeTable, AdminMovie.rmNum));
	}

	public static void coupon()
	{
		System.out.printf("\n\n\n\n\n\t   %20s\n", "===============================");
		System.out.printf("\n\t           %s\n", "음료/팝콘 교환권");
		System.out.printf("\t        %s\n\n", " (영수증 겸용/고객용)");
		System.out.printf("\t   %20s\n", "-------------------------------");
		System.out.printf("\t            %s\n", " |결제 시간|");
		System.out.printf("\t      %-1s  %-1s\n", payDate, payTime);
		System.out.printf("\t   %25s\n", "-------------------------------");
		System.out.printf("\t   %24s \n", "");
		System.out.printf("\t         ▶ 교환 번호 : %d ◀ \n\n", couponNum+1);
		System.out.print("\t   매점 직원이 교환 번호를");
		System.out.print("\n\t   확인할 수 있도록");
		System.out.println("\n\t   꼭 제시해주세요.");
		System.out.printf("\n\t   %20s\n", "===============================");
		couponNum += 1;
	}

} // end Pay class 