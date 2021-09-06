import java.util.Scanner;
import java.io.IOException;
import java.util.InputMismatchException;

/*
	Title	 : AdminCash
	Function : 관리자 메뉴에서 실행하고 시재/판매금액을 관리
	author	 : 김서현, 소서현
*/

//-------------------------[ 시재/판매금액 관리 클래스 ]-------------------------

class AdminCashVO extends Record
{
	// 영화/스낵별 현금/카드의 판매금액 변수 → 나중에 판매 정산할 때 구분해서 돈을 넣기 위해
	private static int cardMovie, cardSnacks, cashMovie, cashSnacks;

	// 현금 변수
	private static int omanwon, manwon, ocheonwon, cheonwon;
	
	// 생성자
	AdminCashVO() 
	{
		
	}
	
	// 판매금액의 getter, setter 생성 
	public int getCardMovie()
	{ return cardMovie;}

	public void setCardMovie(int cardMovie)  
	{ this.cardMovie += cardMovie; }

	public int getCardSnacks()
	{ return cardSnacks;}

	public void setCardSnacks(int cardSnacks)  
	{ this.cardSnacks += cardSnacks; }

	public int getCashMovie()
	{ return cashMovie;}

	public void setCashMovie(int cashMovie)  
	{ this.cashMovie += cashMovie; }

	public int getCashSnacks()
	{ return cashSnacks;}

	public void setCashSnacks(int cashSnacks)  
	{ this.cashSnacks += cashSnacks; }

	// 현금의 getter, setter 생성
	public int getOmanwon()
	{ return omanwon;}

	public void setOmanwon(int omanwon)  
	{ this.omanwon += omanwon; }

	public int getManwon()
	{ return manwon;}

	public void setManwon(int manwon)  
	{ this.manwon += manwon; }

	public int getOcheonwon()
	{ return ocheonwon;}

	public void setOcheonwon(int ocheonwon)  
	{ this.ocheonwon += ocheonwon; }

	public int getCheonwon()
	{ return cheonwon;}

	public void setCheonwon(int cheonwon)  
	{ this.cheonwon += cheonwon; }
}

class AdminCash extends Record
{
	static AdminCashVO ac = new AdminCashVO();
	
	// 메뉴 선택
	public static void menuCash() throws InterruptedException, IOException
	{
		Scanner sc = new Scanner(System.in);

		do
		{	
			System.out.println("\n\n\t메뉴 선택            ");
			System.out.println("\t====================================");
			System.out.println("\n\t1. 시재 세팅하기");
			System.out.println("\t2. 금액 정산하기\n");

			while (true)
			{
				try
				{
					System.out.println();
					System.out.print("\t번호를 선택하세요 : ");
					sel = sc.nextInt();
					
					break;
				}
				catch (InputMismatchException e)
				{
					sc = new Scanner(System.in);
					System.out.println("\t>> 잘못 입력하셨습니다. 정수만 입력해 주세요.");
				}
			}
			
			if (sel>0)
			{
				if (sel==1 || sel==2)
					break;
				System.out.println("\n\t>> 잘못된 번호를 입력했습니다. 다시 입력해주세요.");
			}
		}
		while (sel>2 || sel<1);

		if (sel == 1)
			setCash();

		if (sel == 2)
			calCash();
	}
	
	// 시재 세팅 및 충전
	public static void setCash() throws InterruptedException, IOException
	{
		Scanner sc = new Scanner(System.in);   
		
		//int a, b, c;		// 만원, 오천원, 천원권의 장수를 담을 변수
		
		System.out.println("\n\n\t시재 세팅");
		System.out.println("\t====================================");

		while (true)
		{
			try
			{
				System.out.print("\t50000원권의 장수 : ");
				ac.setOmanwon(sc.nextInt());

				break;
			}
			catch (InputMismatchException e)
			{
				sc = new Scanner(System.in);
				System.out.println("\t>> 잘못 입력하셨습니다. 정수만 입력해 주세요.");
			}
		}
			
		while (true)
		{
			try
			{
				System.out.print("\t10000원권의 장수 : ");
				ac.setManwon(sc.nextInt());

				break;
			}
			catch (InputMismatchException e)
			{
				sc = new Scanner(System.in);
				System.out.println("\t>> 잘못 입력하셨습니다. 정수만 입력해 주세요.");
			}
		}
		
		//ac.setManwon(a);
		
		while (true)
		{
			try
			{
				System.out.println();
				System.out.print("\t5000원권의 장수 : ");
				ac.setOcheonwon(sc.nextInt());

				break;
			}
			catch (InputMismatchException e)
			{
				sc = new Scanner(System.in);
				System.out.println("\t>> 잘못 입력하셨습니다. 정수만 입력해 주세요.");
			}
		}

		//ac.setOcheonwon(b);
		
		while (true)
		{
			try
			{
				System.out.println();
				System.out.print("\t1000원권의 장수 : ");
				ac.setCheonwon(sc.nextInt());

				break;
			}
			catch (InputMismatchException e)
			{
				sc = new Scanner(System.in);
				System.out.println("\t>> 잘못 입력하셨습니다. 정수만 입력해 주세요.");
			}
		}
		
		//ac.setCheonwon(c);

		payHap = ac.getOmanwon()*50000 + ac.getManwon()*10000 + ac.getOcheonwon()*5000 + ac.getCheonwon()*1000;

      // 시재 출력
	  System.out.println("\t====================================");
      System.out.printf("\n\t현재 50000원권 %d장, 10000원권 %d장, 5000원권 %d장, 1000원권 %d장\n", ac.getOmanwon(), ac.getManwon(), ac.getOcheonwon(), ac.getCheonwon());
      System.out.printf("\t총 [%d]원 있습니다.\n\n\n", payHap);
	}


	//시재 수정하기
	/*
	public void addCash() throws InterruptedException, IOException
	{
		Scanner sc = new Scanner(System.in);   
		
		int a, b, c;		// 만원, 오천원, 천원권의 장수를 담을 변수
		
		System.out.println("\n\n\t시재 세팅");
		System.out.println("\t====================================");		
		while (true)
		{
			try
			{
				System.out.print("\t추가할 10000원권의 장수 : ");
				a = sc.nextInt();

				break;
			}
			catch (InputMismatchException e)
			{
				sc = new Scanner(System.in);
				System.out.println("\t>> 잘못 입력하셨습니다. 정수만 입력해 주세요.");
			}
		}
		
		ac.setManwon(a);
		
		while (true)
		{
			try
			{
				System.out.println();
				System.out.print("\t추가할 5000원권의 장수 : ");
				b = sc.nextInt();

				break;
			}
			catch (InputMismatchException e)
			{
				sc = new Scanner(System.in);
				System.out.println("\t>> 잘못 입력하셨습니다. 정수만 입력해 주세요.");
			}
		}

		ac.setOcheonwon(b);
		
		while (true)
		{
			try
			{
				System.out.println();
				System.out.print("\t추가할 1000원권의 장수 : ");
				c = sc.nextInt();

				break;
			}
			catch (InputMismatchException e)
			{
				sc = new Scanner(System.in);
				System.out.println("\t>> 잘못 입력하셨습니다. 정수만 입력해 주세요.");
			}
		}
		
		ac.setCheonwon(c);

		payHap += a*10000 + b*5000 + c*1000;

      // 시재 출력
	  System.out.println("\t====================================");
      System.out.printf("\n\t현재 50000원권 %d장, 10000원권 %d장, 5000원권 %d장, 1000원권 %d장\n", ac.getOmanwon(), ac.getManwon(), ac.getOcheonwon(), ac.getCheonwon());
      System.out.printf("\t총 [%d]원 있습니다.\n\n\n", payHap);
	}*/

	// 판매 정산 결과 출력
	public static void calCash() throws InterruptedException, IOException
	{	
		System.out.println("\n\n\t\t\t  [ 판매 정산 결과 ]\n "); 
		System.out.println("\t ┌────────────────────────────────────────────────┐");
		System.out.println("\t │     │     영화    │     간식     │     합계    │");
		System.out.println("\t │────────────────────────────────────────────────│");
		System.out.printf("\t │ 현금│%10d   │%10d    │%10d   │\n", ac.getCashMovie(), ac.getCashSnacks(), ac.getCashMovie()+ac.getCashSnacks());
		System.out.println("\t │────────────────────────────────────────────────│"); 
		System.out.printf("\t │ 카드│%10d   │%10d    │%10d   │\n", ac.getCardMovie(), ac.getCardSnacks(), ac.getCardMovie()+ac.getCardSnacks());
		System.out.println("\t │────────────────────────────────────────────────│"); 
		System.out.printf("\t │ 합계│%10d   │%10d    │%10d   │\n", ac.getCashMovie()+ac.getCardMovie(), ac.getCashSnacks()+ac.getCardSnacks(), ac.getCashMovie()+ac.getCardMovie()+ac.getCashSnacks()+ac.getCardSnacks());
		System.out.println("\t └────────────────────────────────────────────────┘");
		System.out.println();
	}
}
