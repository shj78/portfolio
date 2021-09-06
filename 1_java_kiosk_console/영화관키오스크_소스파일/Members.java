
import java.util.Scanner;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Iterator;
import java.util.Random;

/*
	Title	 : Members
	Function : ȸ�� ���� ���� ����
	author	 : ������, ��ƺ�
*/

// �������� : startMem() while �ݺ������� ����
//-------------------------------------------------����� : ȸ�� ���� Ŭ���� <�ϼ�>

class MembersVO
{
   // �̸�, �ڵ�����ȣ, �ֹε�Ϲ�ȣ, ����Ʈ
   private String name; 
   private String tel;
   private String id;
   private int point;

   // ������
   public MembersVO()
   {
   }

   // ����ȸ�� ������ ���� ����� ���� ������ ����(�̸�, �ڵ�����ȣ, �ֹε�Ϲ�ȣ, ����Ʈ)
   public MembersVO(String name, String tel, String id, int point)
   {
      this.name = name;
      this.tel = tel;
      this.id = id;
      this.point = point;
   }

   // getter, setter
   // �̸� 
   public String getName()
   {
      return this.name;
   }

   public void setName(String name)
   {
      this.name = name;
   }
   
   // �ڵ�����ȣ
   public String getTel()
   {
      return this.tel;
   }

   public void setTel(String tel)
   {
      this.tel = tel;
   }

   //�ֹε�Ϲ�ȣ
   public String getId()
   {
      return this.id;
   }

   public void setId(String id)
   {
      this.id = id;
   }
   
   // ������
   public int getPoint()
   {
      return this.point;
   }

   public void setPoint(int point)
   {
      this.point = point;
   }


}// end MembersVO

// ȸ������ �޴� ���ð��� ��� Ŭ����
class memMenuSel
{
  // ���ȭ�� ������(�޴�)
  final static int SIGN_IN = 1;        // ȸ�� ����
  final static int CONFIRM_MEMBER = 2; // ȸ�� ���� Ȯ��
  final static int MAIN_MENU = 3;      // ����� ���θ޴�
}

class Members extends Record
{
   //  MemebersVO ������� ������ ��ü�� ArrayList�� ��´�.
   static ArrayList<MembersVO> mData = new ArrayList<MembersVO>();

   // �ٸ� Ŭ�������� User ���θ޴� ȣ��� startMem() ���
   public void startMem() throws IOException, InterruptedException
   {
      while (true)
      {
         mMenuDisp();
         User.menuSelect();
         mMenuRun(); 
      }
   }

   // ȸ������ �޴�
   public void mMenuDisp()
   {
      System.out.println("\n");
      System.out.println("\t=========ȸ�� ��� �޴�=========");
      System.out.println("\t1.  ȸ��      ����     ");
      System.out.println("\t2.  ȸ�� ���� ��ȸ   ");
      System.out.println("\t3.    ���� �޴�   ");
      System.out.println("\t================================");
      System.out.print("\t>> �޴� ����(1~3) : "); 
   }// end memMenuDisp()

   // ���õ� �޴� ���࿡ ���� ��� ȣ�� �޼ҵ�
   public void mMenuRun() throws IOException, InterruptedException
   { 

      switch (sel)
      {
      //ȸ������ �޼ҵ� 1��
      case memMenuSel.SIGN_IN :  signIn(); break;
      // ȸ��������ȸ �޼ҵ� 2��
      case memMenuSel.CONFIRM_MEMBER : recogMem(); break;
      // ����� ���θ޴� �޼ҵ� 3��
      case memMenuSel.MAIN_MENU : User.startUser();  break;
      
      default: System.out.println("\t1~3���� �������ּ���."); break;
      }
   }// end memMenuRun()


   // ���� ȸ�� ���� �߰� �޼ҵ�
   public static void oldMem()
   {
      //���� ȸ��
      mData.add(new MembersVO("��ƺ�","010-1111-1111","760411-2575452",2500));
      //mData.add(new MembersVO("�輭��","010-2222-2222","651126-2127984",5000)); // ȸ�����Խ� �ֹι�ȣ ���...
      mData.add(new MembersVO("������","010-3333-3333","610125-2066131",10000));
      mData.add(new MembersVO("������","010-4444-4444","641014-2211410",500));
      //û�ҳ� ȸ��
      mData.add(new MembersVO("û�ҳ�","010-5555-5555","071022-1639841",2000));
      mData.add(new MembersVO("�Ҽ���","010-1212-1212","080118-2250820",6000));

   }//end oldMem() 

   // ȸ�� ���� �޼ҵ� 
   public void signIn() throws IOException 
   { 
      sc = new Scanner(System.in);
      String name, tel, id, temp;
      int point;
      System.out.println();
      System.out.println("\t\t[ȸ�� ����]");
      System.out.println("\t�ϴ��� ������ �Է��ϼ���.");
      System.out.print("\t�̸��� �Է��ϼ��� : ");
      name = sc.next();
      tel = "";
     
      // �ߺ����� ���� ��ȭ��ȣ �ޱ�
      System.out.print("\t��ȭ��ȣ�� �Է��ϼ���(xxx-xxxx-xxxx) : ");
      temp = sc.next();
      for (int i=0 ; i<mData.size() ; i++)
      {
         if (temp.equals(mData.get(i).getTel()))
         {
            System.out.println("\t�ߺ��� ��ȭ��ȣ�Դϴ�.");
            System.out.print("\t��ȭ��ȣ�� �Է��ϼ���(xxx-xxxx-xxxx) : ");
            temp = sc.next();
         }
         else
            tel = temp;
      }

      // �ߺ����� ���� �ֹε�Ϲ�ȣ �ް� ��ȿ�� �˻��� ȸ������
      System.out.print("\t�ֹε�Ϲ�ȣ�� �Է��ϼ���(xxxxxx-xxxxxxx) : ");
      temp = sc.next();
      for (int i=0 ; i<mData.size() ; i++)
      {
         if (temp.equals(mData.get(i).getId()))
         {
            System.out.println("\t�ߺ��� �ֹε�Ϲ�ȣ�Դϴ�.");
            System.out.print("\t�ֹε�Ϲ�ȣ�� �Է��ϼ���(xxxxxx-xxxxxxx) : ");
            temp = sc.next();
         }
      }

      int[] chk = {2, 3, 4, 5, 6, 7, 0, 8, 9, 2, 3, 4, 5}; 
      int tot = 0;

      for (int i=0 ; i<13 ; i++) // i �� 0 1 2 3 4 5 6 7 8 9 10 11 12
	  {
         if (i==6)
         {
             continue;			
         }
         tot += chk[i] * Integer.parseInt(temp.substring(i,i+1));
	  }
	
	  int su = 11 - tot % 11;
      su = su % 10;		

      // ���� ��� ���

      if (su == Integer.parseInt(temp.substring(13)))
      {
          id = temp;
          // ���� ������ 500�� ����
          point = 500;

          // ȸ�� �߰�
          mData.add(new MembersVO(name,tel,id,point));

          // �׽�Ʈ
          //for (int i=0 ; i < mData.size(); i++)
          //  System.out.println(mData.get(i).getName());
         
          System.out.println("\t===================================");
          System.out.println("\t     �������ּż� �����մϴ�.");
          System.out.println("\t���� ������ 500���� �����Ǿ����ϴ�.");
          System.out.println("\t===================================");
          
      }  
      else
      {
          System.out.println("\t��ȿ�������� �ֹε�Ϲ�ȣ�Դϴ�.");
      }


   }//end signIn()

   // ȸ��������ȸ �޼ҵ� 2��
   public void recogMem() throws IOException 
   { 
      sc = new Scanner(System.in);
      System.out.println("\t[ȸ�� ���� ��ȸ]");
      System.out.print("\t�ֹε�Ϲ�ȣ�� �Է��ϼ���(xxxxxx-xxxxxxx) : ");
      String temp = sc.next();
      String id, name, tel;
      tel = "";
      id = name = tel;
      boolean flag=false;

      // �ֹε�Ϲ�ȣ ��ȿ���˻� ����
      int[] chk = {2, 3, 4, 5, 6, 7, 0, 8, 9, 2, 3, 4, 5}; 
      int tot = 0;

      for (int i=0 ; i<13 ; i++) // i �� 0 1 2 3 4 5 6 7 8 9 10 11 12
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
          System.out.println("\t��ȿ�������� �ֹε�Ϲ�ȣ�Դϴ�.");
      }

      for (int i=0 ; i<mData.size() ; i++)
      {  // ���� ȸ�������� �ֹε�Ϲ�ȣ�� ��ġ�ҽ�...
         if (id.equals(mData.get(i).getId()))
         {
           flag = true;
           name = mData.get(i).getName();
           break;
         }     
      }
      // ���� ȸ�������� �ֹε�Ϲ�ȣ�� ��ġ�ҽ�...
      if (flag)
      {
         System.out.println();
         System.out.println("\tȸ�������� Ȯ�εǾ����ϴ�.");
         System.out.println();
         System.out.printf("\t ��  ��  : %4s\n", name);
         System.out.println();
      }
      
      else
      {
         System.out.println();
         System.out.println("\t�Է��Ͻ� �ֹε�Ϲ�ȣ�� ȸ������ �̷��� �����ϴ�.");
      }
   }// recogMem()

}// end class Members
