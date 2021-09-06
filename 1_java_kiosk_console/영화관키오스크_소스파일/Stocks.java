// import
import java.util.Scanner;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Iterator;
import java.util.Random;
import java.util.InputMismatchException;


/*
	Title	 : Stocks
	Function : ��� ����
	author	 : ��ƺ�, ������
*/


// �������� : menrRun() switch�� case 5 ���� 
//			: �ʱ�ȭ �� ���� (3/20)

//-----------------------------------------------------������ : ������ ���� Ŭ����
class StocksVO
{
   
   // ����, ���� ������
   private static int coke, cida, popcorn, paper;

   // getter, setter �޼ҵ�
   public static int getCoke()
   { return coke; }
   
   public static void setCoke(int coke)
   { StocksVO.coke += coke; }

   public static int getCida()
   { return cida; }

   public static void setCida(int cida)
   { StocksVO.cida += cida; }

   public static int getPop()
   { return popcorn; }

   public static void setPop(int popcorn)
   { StocksVO.popcorn += popcorn; }

   public static int getPaper()
   { return paper; }

   public static void setPaper(int paper)
   { StocksVO.paper += paper; }
  
}//end class StockVO

//--------------------------------------------------������ : ������ Ŭ���� <�ϼ�>

class Stocks extends Record
{
   
    // �ܡ� (�ٸ� Ŭ�������� Stocks ���θ޴� ȣ��� startStocks() ����Ͻø� �˴ϴ�!)
   public static void startStocks() throws InterruptedException, IOException
   {
         menuStocks();
         User.menuSelect();
         menuRun();
   }   
   
   static StocksVO asv = new StocksVO();

   // ������ ���� �޴� ��� �޼ҵ�
   public static void menuStocks() 
   {
      System.out.println();
      System.out.println("\t===========================");
      System.out.println("\t1. �ݶ� ��� Ȯ��/����");
      System.out.println("\t2. ���̴� ���Ȯ��/����");
      System.out.println("\t3. ���� ��� Ȯ��/����");
      System.out.println("\t4. ���� ��� Ȯ��/����");
      System.out.println("\t5. ������ �޴��� ���ư���");
      System.out.println("\t===========================");
      System.out.print("\t>> �޴� ����(1~5) : ");
   }
  
   // ������ �޴� ȣ�� �޼ҵ�
   public static void menuRun() throws InterruptedException, IOException
   {

      // Admin Ŭ���� �ν��Ͻ� ����(�޴� �̵�)
      Admin ad = new Admin();

      switch (sel)
      {
		  case 1: addCoke(); break;
		  case 2: addCida(); break;
		  case 3: addPop(); break;
		  case 4: addPaper(); break;
		  case 5: 
		 // ���� 
		  {  ad.AdminMenuDisp();
			 ad.menuSelect();
			 ad.AdminMenuRun(); break;
		  }
      default: System.out.println("�Է� �����Դϴ�."); break;
      }
   }
   
   // �ݶ� ���Ȯ�� �� ���� �޼ҵ�
   public static void addCoke() throws InterruptedException, IOException
   {
      sc = new Scanner(System.in);
      int n;

      System.out.println();
      System.out.printf("\t���� �ݶ�ĵ�� ���� %d���Դϴ�.\n", StocksVO.getCoke());
      System.out.print("\t��� �����Ͻðڽ��ϱ�?(Y/N): ");
      char sel;
      sel = (char)System.in.read();
	  System.in.skip(2);

      if (sel=='y' || sel =='Y')
      {
         while (true)
         {
			 try
			 {
				System.out.print("\t������ ������ �Է��ϼ��� : ");
			    n = sc.nextInt();

				break;
			 }
			 catch (InputMismatchException e)
			 {
				sc = new Scanner(System.in);
				System.out.println("\t>> �߸� �Է��ϼ̽��ϴ�. ������ �Է��� �ּ���.\n");
			 }
         }
        
         if (n+StocksVO.getCoke()>300)
            System.out.println("\t���� ����� 300���� �ʰ��Ҽ� �����ϴ�.");
         else
         {
            StocksVO.setCoke(n);
            System.out.println("\t������ �Ϸ�Ǿ����ϴ�.");
            System.out.printf("\t���� �ݶ��� ���� %d�Դϴ�.\n", StocksVO.getCoke());
            System.out.println();
         }
         startStocks();
      }
   }//end addCoke()

   // ���̴� ���Ȯ�� �� ���� �޼ҵ�
   public static void addCida() throws InterruptedException, IOException
   {
      sc = new Scanner(System.in);
      int n;

      System.out.println();
      System.out.printf("\t���� ���̴�ĵ�� ���� %d���Դϴ�.\n", StocksVO.getCida());
      System.out.print("\t��� �����Ͻðڽ��ϱ�?(Y/N): ");
      char sel;
      sel = (char)System.in.read();
	  System.in.skip(2);

      if (sel=='y' || sel =='Y')
      {
         
         while (true)
         {
			 try
			 {
				System.out.print("\t������ ������ �Է��ϼ��� : ");
			    n = sc.nextInt();

				break;
			 }
			 catch (InputMismatchException e)
			 {
				sc = new Scanner(System.in);
				System.out.println("\t>> �߸� �Է��ϼ̽��ϴ�. ������ �Է��� �ּ���.\n");
			 }
         }

         if (n+StocksVO.getCida()>300)
            System.out.println("\t���� ����� 300���� �ʰ��Ҽ� �����ϴ�.");
         else
         {
            StocksVO.setCida(n);
            System.out.println("\t������ �Ϸ�Ǿ����ϴ�.");
            System.out.printf("\t���� ���̴�ĵ�� ���� %d�Դϴ�.\n", StocksVO.getCida());
            System.out.println();
         }   
      }

      startStocks();

   }//end addCida()


   // ���� ���Ȯ�� �� ���� �޼ҵ�
   public static void addPop() throws InterruptedException, IOException
   {
      sc = new Scanner(System.in);
      int n;
      System.out.println();
      System.out.printf("\t���� ������ ���� %d���Դϴ�.\n", StocksVO.getPop());
      System.out.print("\t��� �����Ͻðڽ��ϱ�?(Y/N): ");
      char sel;
      sel = (char)System.in.read();
	  System.in.skip(2);

      if (sel=='y' || sel =='Y')
      {
         
         while (true)
         {
			 try
			 {
				System.out.print("\t������ ������ �Է��ϼ��� : ");
			    n = sc.nextInt();

				break;
			 }
			 catch (InputMismatchException e)
			 {
				sc = new Scanner(System.in);
				System.out.println("\t>> �߸� �Է��ϼ̽��ϴ�. ������ �Է��� �ּ���.\n");
			 }
         }

         if (n+StocksVO.getPop()>300)
            System.out.println("\t���� ����� 300���� �ʰ��Ҽ� �����ϴ�.");
         else
         {
            StocksVO.setPop(n);
            System.out.println("\t������ �Ϸ�Ǿ����ϴ�.");
            System.out.printf("\t���� ������ ���� %d���Դϴ�.\n", StocksVO.getPop());
            System.out.println();
         }
      startStocks();
      }
   }//end addPop()

   // ���� ���� �� ���� �޼ҵ�
   public static void addPaper() throws InterruptedException, IOException
   {
      sc = new Scanner(System.in);
	  int n;

      System.out.printf("\t���� ������ ����� %d���Դϴ�.\n", StocksVO.getPaper());
      System.out.print("\t��� �����Ͻðڽ��ϱ�?(Y/N): ");
      char sel;
      sel = (char)System.in.read();
 	  System.in.skip(2);

      if (sel=='y' || sel =='Y')
      {
         
         while (true)
         {
			 try
			 {
				System.out.print("\t������ ������ �Է��ϼ��� : ");
			    n = sc.nextInt();

				break;
			 }
			 catch (InputMismatchException e)
			 {
				sc = new Scanner(System.in);
				System.out.println("\t>> �߸� �Է��ϼ̽��ϴ�. ������ �Է��� �ּ���.\n");
			 }
         }

         if (n+StocksVO.getPaper()>1000)
            System.out.println("\t���� ����� 1000���� �ʰ��Ҽ� �����ϴ�.");
         else
         {
            StocksVO.setPaper(n);
            System.out.println("\t������ �Ϸ�Ǿ����ϴ�.");
            System.out.printf("\t���� ������ ����� %d���Դϴ�.\n", StocksVO.getPaper());
            System.out.println();
         }    
      }
      startStocks();
   }//end addPaper()

}//end class Stocks


