
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.*;

//
//====================================================================================================

/*
  Title  : ReserveTikets
  Function : ��ȭ ���� ���
  author   : ��ƺ�, �輭��
*/

//====================================================================================================


class ReserveTiketsVO // ��ƺ�, �輭��
{
   // �󿵰� ��
   private static char[] mr0 = {'A','B','C','D','E','F','G','H','I','K'}; 
   // 1�� 10x5 �迭 ����
   private static char[] mr1 = new char[50];
   // 2�� 10x5 �迭 ����
   private static char[] mr2 = new char[50];
   // 3��  8x4 �迭 ����
   private static char[] mr3 = new char[32];
   // �Է��� �¼���ȣ �ε��� ��� �迭
   int[] seat = new int[4];


   


   // ����Ȯ���� ���� ������
   // ��ȭ����, �󿵰�, ��ȭ�ð�, �¼���ȣ


   // �ο���
   static int inwon;
   // �¼���ȣ �����ϴ� ���ڿ� �迭
   static String[] rSeat = {"", "", "", ""};
   
   //-------------------------����Ȯ�� ����----------------------------//

   // �ڡڡڡڡڡڡ��߰��ڡڡڡڡڡڡڡ�
   // �󿵰�
   //public static String cRoom="";

   // �¼���ȣ (ex. A1 B2)�� �Ŀ� �Է��� ��
   public static String cSeat ="";
   // ��ȭ����
   //public static String rMovie;
   public static String rMovie="";
   // ���ų�¥
   public static String rDate=""; //2021-03-20

   // ���Ź�ȣ (ex. 03-201)�� �Ŀ� �Է��� ��
   public static String rMem="";

   // ���Ź�ȣ ���ڸ�
   static int i=0;

   // ���Ź�ȣ �ʱ�ȭ��  
   
   /*
   {
      rMem += rDate.substring(5);  
      rMem += String.valueOf(i);
   }
   */
   
   
   // ����� ���� ������ 
   ReserveTiketsVO()
   {
      // 1�� �¼� �Է�
      for (int i=0; i<mr1.length; i++)
      {
         mr1[i] = '��'; // ���¼�
         if(i%3==0)
            mr1[i] = '��'; // �Ÿ��α�� ���ɴ� �¼�
      }
      
      // 2�� �¼� �Է� (1�� �迭 ����)
      mr2 = (char[])mr1.clone(); // ���� �ǹ��� �迭 �������
      
      // 3�� �¼� �Է�
      for (int i=0; i<mr3.length; i++)
      {
         mr3[i] = '��'; 
         if(i%3==0)
            mr3[i] = '��'; 
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
  //ht4 : <���ĵ� ��ȣ, ����> Ű, ���� ������ ���� �ڷᱸ�� 
  public static Hashtable<Integer, String> ht4 = new Hashtable<>();
  //ht5 : <�󿵽ð�, ����> Ű, ���� ������ ���� �ڷᱸ�� 
  public static Hashtable<String, String> ht5 = new Hashtable<>();
  //valueTitleStar : ���������� ���� ���ͽ� ���� �ڷᱸ��
  public static Hashtable<String, String> valueTitleStar = new Hashtable<>();
  //valueTitle : �����ټ� ���� ���ͽ� ���� �ڷᱸ��
  public static Hashtable<String, String> valueTitle = new Hashtable<>();
  //htLast: <������ ��ȭ�� �ε��� ��ȣ, �󿵽ð�> Ű, ���� ������ ���� �ڷᱸ��
  public static Hashtable<Integer, String> htLast = new Hashtable<>();
  //arrLast: <��¥ + �󿵽ð� + �ٰŸ�> ��Ұ��� ���� �ڷᱸ��
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

  //��ȭ ���� �޼ҵ� ����
  public static void selReserve() throws IOException, InterruptedException
  { 
    //�󿵸���Ʈ ��� �޼ҵ� ȣ��
    printMenuList();
	//�󿵽ð� ��� �޼ҵ� ȣ��
	printMenuTime();

  }

  //�󿵸���Ʈ ��� �޼ҵ�
  public static void printMenuList() 
  {
    Scanner sc = new Scanner(System.in);

		//- do/while ���� ���� ���� ������ ����
        do
        {
          System.out.print("\n\n\n\t===============================================");
          System.out.print("\n\t     *��ȭ ��� ���͸� ����� �Է����ּ���*  ");
          System.out.print("\n\t-----------------------------------------------");
          System.out.print("\n\t 1. �����ټ� | 2. ������");
          System.out.print("\n\t===============================================");
          System.out.print("\n\t>> �Է� : ");

          sel = sc.nextInt();

          if (sel>0)
          {
            if (sel==1 || sel==2)
              break;
            System.out.println("\n\t�߸��Է��ϼ̽��ϴ�. �ٽ� �Է����ּ���.");
          }
                }
        while (sel<1 || sel>2);

		  //- ��ȭ ����Ʈ�� ���ı����� ���� �ڷᱸ�� ���� 

		  //E = Ÿ��Ʋ + �ٰŸ�
          ArrayList<String> nameAndStry = new ArrayList<String>();
		  //K = ����, V = Ÿ��Ʋ + �ٰŸ�
          TreeMap<Integer, String> starNameAndStry = new TreeMap<Integer, String>();

		  //- AdminMovie�� �ؽ����̺� �ڷᱸ�� ht�� key���� �̿��� key���� ��� 
		  //- ht<Ÿ��Ʋ, �󿵽ð�>
          Set<String> keys = AdminMovie.ht.keySet();
          Iterator<String> it = keys.iterator();

		  //while���ȿ��� ���� ���� ���� ��Ƶα�� ����
          String data;

		  //it�� ��Ұ� ������ 1 or 0 �� ��ȯ
          while (it.hasNext())
          { 
			//data�� Ÿ��Ʋ
            data = it.next();

			//*
			//<Ÿ��Ʋ>
			//	�ٰŸ�

			//nameAndStry�� ���� *��Ҹ� �߰�
            nameAndStry.add("<"+data+">"+"\n\t"+AdminMovie.ht.get(data).getmStory());
      
	  		//starNameAndStry�� ������ Ű������ *��Ҹ� ���������� �߰�
            starNameAndStry.put(AdminMovie.ht.get(data).getmStar(),"<"+data+">"+"\n\t"+AdminMovie.ht.get(data).getmStory());
            
            //�����ټ� ���� ���ͽ� ���, valueTitle�� *��Ҹ� Ű������, Ÿ��Ʋ�� ���������� �߰� 
            valueTitle.put("<"+data+">"+"\n\t"+AdminMovie.ht.get(data).getmStory(),data);

			//���������� ���� ���ͽ� ���, valueTitleStar *��Ҹ� Ű������, Ÿ��Ʋ�� ���������� �߰� 
            valueTitleStar.put("<"+data+">"+"\n\t"+AdminMovie.ht.get(data).getmStory(),data);//

          }

			//�����ټ� ���͸� ���ý�
			if (sel==1)
			{
				//System.out.println("\n\t�����ټ� ���͸� ��� ȣ��");

				//nameAndStry �������� ����
				Collections.sort(nameAndStry);

				//��ȭ ���� ��� ����
				String onlyName;

				//������ ���� ���� 
				iLast=1;

				//nameAndStry�� ����� Ÿ��Ʋ+�ٰŸ��� ����ϴ� for each��
				for (String data2:nameAndStry)
				{
					//1. <Ÿ��Ʋ>
					//	�ٰŸ�
					//���
					System.out.println("\t"+iLast+". "+data2);

					//1. <Ÿ��Ʋ>
					//	�ٰŸ�
					//�� Ű������ ���� valueTitle�� �������� onlyName�� ������ �ʱ�ȭ
					onlyName=valueTitle.get(data2);

					//ht4�� <�������� ����, ����>�� Ű�� ������ ���� 
					ht4.put(iLast, onlyName);

					iLast++;
				}   

				System.out.print("\t������ ��ȭ�� ��ȣ�� �Է����ּ���: ");

				sel = sc.nextInt();

				System.out.println();

				//����ڰ� ������ ��ȭ�� ��ȣ�� temp�� �ʱ�ȭ
				temp=sel;

			}
			// ������ ���͸� �� 
			else if (sel == 2)
			{
				System.out.println("\n\t������ ���͸� ��� ȣ��");

				//����)
				//Map�� �����ϱ� ���ؼ��� TreeMap�� ����ؾ��Ѵ�.
				//entrySet() : Map�� ����ִ� ��ü �����͸� ����ϱ� ���ؼ� ���

				//starNameAndStry��� �������� ����
				//TreeMap������ �������� �����ϱ� ���ؼ��� descendingMap()�� �̿��ؾ��Ѵ� 
				//
				//�� ������ keys21�� NavigableMap�� �̿��Ͽ� Ű�� ���� �������� ����
				NavigableMap<Integer, String> keys21 = starNameAndStry.descendingMap();//starNameAndStry�� �������� �����´�
				//�� Set�� ���Ͽ� keys21�� ���� ������ �غ�
				Set<Map.Entry<Integer, String>> keys22 = keys21.entrySet();//keys21�� ������ ������ �غ�

				//������ ���� 1�� �ʱ�ȭ
				iLast=1;

				//�������� ���ĵ� keys22�� ������ ���
				for (Map.Entry<Integer,String> entry1:keys22)
				{
				  		 
				  System.out.println("\t"+iLast+". "+entry1.getValue()+"\n");
				  //starNameAndStry�� �� = entry1.getValue() : ����, �ٰŸ�
				  
				  ht4.put(iLast,valueTitleStar.get(entry1.getValue()));
				  //ht4 = (���ĵ� ��ȣ, ����+�ٰŸ� )
				  iLast++;	  

				  
				}

				//������ ���� 1�� �ʱ�ȭ
				iLast=1;

				System.out.print("\t"+"������ ��ȭ�� ��ȣ�� �Է����ּ���: ");

				sel = sc.nextInt();

				System.out.println();

				//����ڰ� ������ ��ȭ�� ��ȣ�� temp�� �ʱ�ȭ
				temp=sel;

			}



    }//end printMlist()

	//06-21 AdminMovie�� ��ȭ ���� �޼��忡 ���� �ش� ��ȭ �ð�ǥ... �� ��ģ... dao.lists() �ʹ� �����ѵ� �Ф� ?
	//�ϴ�, �� ���¿��� ���ĺ����� h3,h4,h5�� ���� ��Ȯ�� �ľ�
	//�� ht���� ������� �� ��,  h2,h3,h4,h5���� ��� �������� �Ѵٴ°� ����Ʈ
	//�غ���~!! 

    //�󿵽ð� ��� �޼ҵ�
    public static void printMenuTime()
    { 

      Scanner sc = new Scanner(System.in);
	  
	  //ht3 : <��¥ + �󿵽ð�, ����> Ű, ���� ������ ���� �ڷᱸ�� 
      Set<String> keys3 = AdminMovie.ht3.keySet();
      Iterator<String> it3 = keys3.iterator();

	  //ht4 : <���Ĺ�ȣ, ����+�ٰŸ�> Ű, ���� ������ ���� �ڷᱸ��
      Set<Integer> keys4 = ht4.keySet();
	  Iterator<Integer> it4= keys4.iterator();

		  //data: �󿵽ð�
          String data;
		  //data2: ����
          String data2;
		  //������ ���� ���� 1�� �ʱ�ȭ
		  int numb=1;

		  //data3 : ����ڰ� ������ ��ȭ�� ����  
          data3=ht4.get(temp);

          while (it3.hasNext())
          {
            
            data = it3.next(); //data: �󿵽ð� 2021-03-22 12:00~14:00

            data2 = AdminMovie.ht3.get(data); //data2: ����
            
			//��ü ��ȭ��, ����ڰ� ������ ��ȭ�� ���� �̸��� ��ȭ���ִٸ�? 
            if (data2.equals(data3)) 
            {
				//������ �ѹ��� ������ָ�,
				if(numb == 1)
					System.out.println("\t        <<"+data2+">>");//����
				
				//������ �ѹ��� ����ϱ� ����
				numb++;

				// ht5 : <�󿵽ð�, ����> Ű, ���� ������ ���� �ڷᱸ�� 
				// ht�ڷᱸ���� �� ������ ������, ��¥ + �󿵽ð��� Ű�� �־��ش�
				ht5.put(data, data3); 
            }  
              
          }
		  //������ ���� ���� 1�� �ʱ�ȭ
          numb=1;

		  //ht5�� �����͸� ������ �غ�
          Set<String> keys5 = ht5.keySet();
          Iterator<String> it5= keys5.iterator();
        
		 //��¥ + �󿵽ð��� ��� ��������
		  String lastNext;

          while (it5.hasNext())
          {
		    //��¥ + �󿵽ð��� �־��ش�
            lastNext=it5.next();
            arrLast.add(lastNext);  
          }

		  //�ε��� ��ȣ�� ���� ���� 1�� �ʱ�ȭ		  
          int sss = 1;
		  //�ε��� ��ȣ�� ���� ���� 1�� �ʱ�ȭ
          int bbb = 1;

		  //������������ ����
          Collections.sort(arrLast);

		  //������ ��ȭ�� �ε��� ��ȣ�� �󿵽ð� ���
          for (String last: arrLast)
          {
            System.out.println("\t"+bbb+". "+last+"\n");
            bbb++;
			
			//htLast: <������ ��ȭ�� �ε��� ��ȣ, �󿵽ð�> Ű, ���� ������ ���� �ڷᱸ��
            htLast.put(sss, last);//��ȣ�� ����
            sss++;
          }


          

          System.out.print("\t"+"������ �󿵽ð��� ��ȣ�� �Է����ּ���: ");

		  //����ڰ� ������ �󿵽ð��� ��ȣ��
          sel = sc.nextInt();

          System.out.println();

		 //������ �󿵽ð��� lastTimeTable�� �ʱ�ȭ
         lastTimeTable = htLast.get(sel);  //
		 //ex) lastTimeTable = 2021-03-21 16:00~18:05

		  //ht3 : <��¥ + �󿵽ð�, ����> Ű, ���� ������ ���� �ڷᱸ��  
		  //����ڰ� ������ ��ȭ�� ������ lastTitle�� �ʱ�ȭ
          String lastTitle = AdminMovie.ht3.get(lastTimeTable);

		  //�ٸ� �޼ҵ� ��� ������ ���
		  checkMovie = lastTitle;
		  checkTime = lastTimeTable;

		  //���� ���
          System.out.println("\t�����Ͻ� ��ȭ�� ������ "+lastTitle+",");
          System.out.println("\t�����Ͻ� ��ȭ�� �󿵰��� "+AdminMovie.rm1.get(lastTimeTable) + "��,");					
          System.out.println("\t�����Ͻ� ��ȭ�� �ð�ǥ�� "+lastTimeTable+"�Դϴ�");
			
			//���Ź�ȣ�� �� ��������

			//��strDate: �󿵳�¥�� �ʱ�ȭ 
			strDate = lastTimeTable.substring(0,10);//2021-03-21
           

			//��ReserveTiketsVO.rMem������ strDate�� '�⵵'�� '-'�� ������ ���� ����
			ReserveTiketsVO.rMem += strDate.substring(5);  

			//��ReserveTiketsVO.rMem������ ������ ������ �߰��Ͽ� ���ڿ��� ��ȯ 
			ReserveTiketsVO.rMem += String.valueOf(ReserveTiketsVO.i);

			//ArrayList�� ũ�⸦ �ڵ����� �÷��ֱ� ������ ������ ������ �����ϰ��� �����
			arrLast.clear();

    }//end printMtime()


  /////////////////////////////////////////////////////////////////////////////////////////////////////////////[���¼�����]


    // �Ÿ��α� �ȳ����� ��� �޼ҵ�
    public static void printMal()
    {
      System.out.println("\n");
      System.out.println("\tCGV�� ��ȸ�� �Ÿ��α⸦ �ؼ��մϴ�.");
      System.out.println("\t��ȸ�� �Ÿ��α� �¼�(��)�� ����ֽñ� �ٶ��ϴ�.\n");
    }//end printMal()

   // �󿵰� 1�� �¼�ȭ��(10x5) ��� �޼ҵ�
   public static void printOne()
   {  
      System.out.println("\n");
      System.out.println("\t  --------Screen--------  \n\n");
      for (int i=0 ; i<5; i++)             // i : 5���� ��(A~E)
      {
         System.out.print("\t" + rtv.getZero()[i] + "�� "); // mr0: A ~ E �� ���
         for (int j=10*i; j<10*(i+1); j++) // j: �ڸ� �ε��� �� i = 0(ù��° ��) �� j : 0 ~ 9 (10��)
         {                                 //                   i = 1(�ι�° ��) �� j : 10~18  ... 
            System.out.print(rtv.getOne()[j]);
            if (j%10==1 || j%10==7)        // ����, ������ ���   1 2   3 4 5 6 7 8   9 10
               System.out.print(" ");
            if (j%10 == 9)                 // ����(�¼� 10��) �����Ǹ� ����
            {
               System.out.println();
               for (int k=0; k<1; k++)      // ���پ� ���ö����� �¼� ��ȣ �ϴܿ� ���
                  System.out.println("\t   1 2  3 4 5 6 7 8  9 10");   
            }
         }
      }
      printMal();
   }//end printOne()

   
   // �󿵰� 2�� �¼�ȭ��(10x5) ��� �޼ҵ� 
   public static void printTwo()
   {
      
      System.out.println("\n");
      System.out.println("\t  --------Screen--------  \n\n");
      for (int i=0 ; i<5; i++)
      {
         System.out.print("\t" + rtv.getZero()[i] + "�� ");
         for (int j=10*i; j<10*(i+1); j++) // i=0 �� j : 0 ~ 9 , i = 1 �� j : 10~18  
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


   //�󿵰� 3�� �¼�ȭ��(8x4) ��� �޼ҵ�
   public static void printThree()
   {

      System.out.println("\n");
      System.out.println("\t----------Screen-----------\n\n");
      for (int i=0 ; i<4; i++)
      {
         System.out.print("\t  "+ rtv.getZero()[i] + "�� ");
         for (int j=8*i; j<8*(i+1); j++) // i=0 �� j :  
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
   

   // ��ȭ ���� �����ϴ� �޼ҵ� (room : 1~3 �󿵰�) 
   public static void selRoom(int r) throws IOException, InterruptedException
   {
      switch (r)
      {
         case 1: 
         {   printOne();   // �¼�ȭ�� ��� 
             selInwon();   // �ο� ����
             selOne();     // �󿵰� 1�� �¼� ����
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


   // ����ڿ��� �ο��� �Է¹޴� �޼ҵ�
   public static void selInwon()
   {
      sc = new Scanner(System.in);
      do
      {
        System.out.print("\t������ �ο��� �Է��ϼ���(1~4) : ");
         rtv.setInwon(sc.nextInt());
       // ���Ű��� �ο���: �ִ� 4��
       if (rtv.getInwon() <1 || rtv.getInwon() >4)
          System.out.println("\n\t>> 1~4������ ���� �Է��ϼ���.");
      }
      while (rtv.getInwon() <1 || rtv.getInwon() >4);
  }//end selInwon()



   // 1�� �¼����� �޼ҵ� (���� �¼� ���� ����, �¼���ȣ ����)
   public static void selOne() throws IOException, InterruptedException
   {
	   rtv.cSeat ="";
       sc = new Scanner(System.in);

     for (int i=0 ; i<rtv.getInwon() ; i++)  // �ο�����ŭ �ݺ�
     {
        // �� �߰�
        //rtv.rSeat[i] = "";

        do
        {
           t = "";       // �¼���ȣ ���� �ӽ� ���ڿ� ���� �ʱ�ȭ
           temp = 0;     // �¼��� �ε����� ���� �ӽ� ���� ���� �ʱ�ȭ
           System.out.printf("\t%d��° �¼��� ���� �Է��ϼ���(A~E) : ", (i+1));
           char a = (char)System.in.read();
           switch (a)
           {
              case 'A': case 'a': {temp += 0;  t += "A"; break;}  // a or A �Է½�...
              case 'B': case 'b': {temp += 10; t += "B"; break;} 
              case 'C': case 'c': {temp += 20; t += "C"; break;} 
              case 'D': case 'd': {temp += 30; t += "D"; break;} 
              case 'E': case 'e': {temp += 40; t += "E"; break;} 
              default : System.out.println("\t>> �߸��Է��ϼ̽��ϴ�.\n"); break;
           }
           System.in.skip(2);
           do
           {
              n = 0;      // �¼���ȣ(1~10) ���� �ӽ� ����
              System.out.print("\t�¼� ��ȣ�� �Է��ϼ���(1~10) : ");
              n = sc.nextInt();
              if (n < 1 || n > 10)
                 System.out.println("\t>> �߸��Է��ϼ̽��ϴ�.\n");
           }
           while (n < 1 || n > 10);
          
           
           temp += (n-1); // temp�� �¼���ȣ(1~10) ���

           if (temp%3==0) // ��ȸ�� �Ÿ��α� �¼��Ͻ�...
           {
              System.out.println();
              System.out.println("\t>> �����Ͻ� �¼��� ��ȸ�� �Ÿ��α� �¼��Դϴ�.");
              System.out.println("\t>> ����ִ� �¼��� �����ϼ���.\n");
              t="";       //  �¼��� ����ȣ �ʱ�ȭ
           }

        }
        while (temp%3 ==0);
        //-- ������� �¼��� ����ȣ(A~E)�� t�� �ӽ�����ǰ� 1~10 ��ȣ�� n�� �ӽ������ ����!
        
        // �¼���ȣ �ε��� ��� �迭�� �ӽ������� ��(��) ����
        rtv.seat[i] += temp;

        // ���ŵ� �¼� ��� �迭�� �ӽ������� �¼���ȣ (A~E)���� ����
        rtv.rSeat[i] += t; 

        switch(temp%10) // �� �ٿ� �¼��� 10���̹Ƿ� 10���� ���� ����...
        {
            // 1 2 3 ��� 4 5 6 7 ��� 8 9 10
            case 0 : rtv.rSeat[i] += "1"; break; // 0 �̸� �¼���ȣ "1" �ο�... "A" + "1" �� "A1"
            case 1 : rtv.rSeat[i] += "2"; break;
            case 2 : rtv.rSeat[i] += "3"; break;
            case 3 : rtv.rSeat[i] += "4"; break;
            case 4 : rtv.rSeat[i] += "5"; break;
            case 5 : rtv.rSeat[i] += "6"; break;
            case 6 : rtv.rSeat[i] += "7"; break;
            case 7 : rtv.rSeat[i] += "8"; break;
            case 8 : rtv.rSeat[i] += "9"; break;
            case 9 : rtv.rSeat[i] += "10"; break;
            default : System.out.println("\t>> �߸��Է��ϼ̽��ϴ�.\n"); break;
        }   
        // ���ŵ� �¼� 1�� �¼� �� �� �ٲٱ�
        //mr1[�ε�����] = '��';
        rtv.getOne()[rtv.seat[i]] = '��';
     }// �ο�����ŭ �ݺ� �Ϸ�
     // ���� ���� Ȯ�ο��� �� ���ڿ� ������ �¼���ȣ ��� �� "A1 A2 A3 A4"
     for (int i=0 ; i<rtv.getInwon(); i++)
        rtv.cSeat += rtv.rSeat[i] +" ";

    // ���� ���� Ȯ�� �޼ҵ� ȣ��
    checkSel();
   }// end selOne()

   
   // ���� ���� Ȯ�� �޼ҵ� 
   public static void checkSel() throws IOException, InterruptedException
   {
      System.out.print("\n\n\n\t===============================================");
        System.out.print("\n\t                *���� ���� Ȯ��*  ");
        System.out.print("\n\t-----------------------------------------------");
        System.out.println("\n\t������ ��ȭ : " + checkMovie);
      System.out.printf("\n\t%s�� �� �ð� : %s", checkMovie, checkTime);
      System.out.printf("\n\t%s�� �󿵰�    : 1��", checkMovie);
      System.out.print("\n\t������ �¼� : " + rtv.cSeat);
        System.out.print("\n\t===============================================");
        System.out.print("\n\t ��� �������� ������ �����ϰڽ��ϴ�.\n");
      
      moviePayTot = rtv.inwon * 10000;
      PayDisc.selMem();
      // �׽�Ʈ
      //System.out.println("��ȭ���� :" + moviePayTot);
   }


  // 2�� �¼����� �޼ҵ� (���� �¼� ������ ����, �¼���ȣ ����)
  public static void selTwo() throws IOException
   {
     sc = new Scanner(System.in);

     for (int i=0 ; i<rtv.getInwon() ; i++)
     {
        do
        {
           t = "";
           temp = 0;
           System.out.printf("\t%d��° �¼��� ���� �Է��ϼ���(A~E) : ", (i+1));
           char a = (char)System.in.read();
           switch (a)
           {
              case 'A': case 'a': {temp += 0;  t += "A"; break;} 
              case 'B': case 'b': {temp += 10; t += "B"; break;} 
              case 'C': case 'c': {temp += 20; t += "C"; break;}  
              case 'D': case 'd': {temp += 30; t += "D"; break;} 
              case 'E': case 'e': {temp += 40; t += "E"; break;} 
              default : System.out.println("\t>> �߸��Է��ϼ̽��ϴ�.\n"); break;
           }

           System.in.skip(2);

           do
           {
              n = 0;
              System.out.print("\t�¼� ��ȣ�� �Է��ϼ���(1~10) : ");
              n = sc.nextInt();
              if (n < 1 || n > 10)
                 System.out.println("\t>> �߸��Է��ϼ̽��ϴ�.\n");
           }
           while (n < 1 || n > 10);
          
           // temp�� �¼���ȣ(1~10) ���
           temp += (n-1);

           if (temp%3==0)
           {
              System.out.println();
              System.out.println("\t>> �����Ͻ� �¼��� ��ȸ�� �Ÿ��α� �¼��Դϴ�.");
              System.out.println("\t>> ����ִ� �¼��� �����ϼ���.\n");
              t="";
           }

        }
        while (temp%3 ==0);
        
        // �ӽ������� �� ���(�¼���ȣ �ε��� ��� �迭)
        rtv.seat[i] += temp;

        // ����ڿ��� �ȳ����� �¼���ȣ (A~E)���� ���
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
            default : System.out.println("\t>> �߸��Է��ϼ̽��ϴ�.\n"); break;
        }
        
        
        // �׽�Ʈ(�¼��� �ε�����ȣ seat �迭 �Է�)
        //System.out.printf("rtv.seat[%d]���� �� : %d\n", i, rtv.seat[i]);
         
        // ������ �¼� �� �� �ٲٱ�
        rtv.getTwo()[rtv.seat[i]] = '��';
        //char[] mr1[10] = '��';
     }
     
     // �׽�Ʈ(������ �¼���ȣ ���) �� rtv.rSeat[i]
     //System.out.printf("������ �¼���ȣ : %s\n", rtv.rSeat[i]);

     
     for (int i=0 ; i<rtv.getInwon(); i++)
     {
        System.out.printf("%d��° �¼���ȣ : %s\n", i+1, rtv.rSeat[i]);
        rtv.cSeat += rtv.rSeat[i] +" ";
     }
     
     
  }// end selTwo()


  // 3�� �¼����� �޼ҵ� (���� �¼� ������ ����, �¼���ȣ ����)
  public static void selThree() throws IOException
  {
     sc = new Scanner(System.in);

     for (int i=0 ; i<rtv.getInwon() ; i++)
     {
        do
        {
           t = "";
           temp = 0;
           System.out.printf("\t%d��° �¼��� ���� �Է��ϼ���(A~D) : ", (i+1));
           char a = (char)System.in.read();
           switch (a)
           {
              case 'A': case 'a': {temp += 0;  t += "A"; break;} 
              case 'B': case 'b': {temp += 8; t += "B";  break;}  
              case 'C': case 'c': {temp += 16; t += "C"; break;}  
              case 'D': case 'd': {temp += 24; t += "D"; break;} 

              default : System.out.println("\t>> �߸��Է��ϼ̽��ϴ�.\n"); break;
           }

           System.in.skip(2);

           do
           {
              n = 0;
              System.out.print("\t�¼� ��ȣ�� �Է��ϼ���(1~8) : ");
              n = sc.nextInt();
              if (n < 1 || n > 8)
                 System.out.println("\t>> �߸��Է��ϼ̽��ϴ�.\n");
           }
           while (n < 1 || n > 8);
          
           // temp�� �¼���ȣ(1~8) ���
           temp += (n-1);

           if (temp%3==0)
           {
              System.out.println();
              System.out.println("\t>> �����Ͻ� �¼��� ��ȸ�� �Ÿ��α� �¼��Դϴ�.");
              System.out.println("\t>> ����ִ� �¼��� �����ϼ���.\n");
              t="";
           }

        }
        while (temp%3 ==0);
        
        // �ӽ������� �� ���(�¼���ȣ �ε��� ��� �迭)
        rtv.seat[i] += temp;

        // ����ڿ��� �ȳ����� �¼���ȣ (A~D)���� ���
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
            default : System.out.println("\t>> �߸��Է��ϼ̽��ϴ�.\n"); break;
        }
        
        
        // �׽�Ʈ(�¼��� �ε�����ȣ seat �迭 �Է�)
        //System.out.printf("rtv.seat[%d]���� �� : %d\n", i, rtv.seat[i]);
         
        // ������ �¼� �� �� �ٲٱ� �� ����
        rtv.getThree()[rtv.seat[i]] = '��';
        //char[] mr1[10] = '��';
     }
     
     // �׽�Ʈ(������ �¼���ȣ ���) �� rtv.rSeat[i]
     //System.out.printf("������ �¼���ȣ : %s\n", rtv.rSeat[i]);

     
     for (int i=0 ; i<rtv.getInwon(); i++)
     {
        System.out.printf("%d��° �¼���ȣ : %s\n", i+1, rtv.rSeat[i]);
        rtv.cSeat += rtv.rSeat[i] +" ";
     }
     //System.out.println(rtv.cSeat);

  }// end selThree()

    // 1-2 ��ȭ�� �����ϱ� �޼ҵ� - ��¥ 
    public static void selMovie()
    {
      printMlist();
      System.out.println("");
      
    }


}

//===============================================================================================================