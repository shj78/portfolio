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
	Function : Ƽ�� ���� �� ���� ����, �������� �Է� �� ���� ��� ���, �ε� �� ���� ���, ��ȭǥ/��ȯ��/������ ���  
	author	 : �輭��, ������
*/

//==================================================================================================================


class RsvNumbVO
{
	// ����ڰ� ���Ÿ� �Ϸ��ϰ� ������ �� �����鿡 ���� ����
	public static String rMem;			// ���Ź�ȣ	
	public static String rMovie;		// ��ȭ ����	
	public static String cSeat;			// �¼���ȣ
	public static String lastTimeTable;	// �󿵽ð�
    public static String rmNum;         // �󿵰�


   //���Ź�ȣ, ����, �󿵳�¥, �¼���ȣ
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
	  return "\n\t���Ź�ȣ : "+rMem+"\n\t��ȭ ���� : "+rMovie+"\n\t�󿵰� : "+rmNum+"1��\n\t�¼� : "+cSeat+"\n\t�󿵽ð� : "+lastTimeTable+            // �� ����
         "\n\n\t====================================";   																			
   }	
}

// ���� Ŭ���� �� 1. ���ο� ���� ���� ����, �����ϴ� Ŭ���� / 2. ���� ����� ���� �ݾ����� ���� �����ϴ� Ŭ���� 2������ �и�
// 1. PayDisc ȸ��/��ȸ�� Ȯ�� �� ���� ����, ������ ���
class PayDisc extends Record
{
	public static ReserveTiketsVO rt = new ReserveTiketsVO();

	// ���� �����ϱ� �� ȸ��/��ȸ�� Ȯ�� �޼ҵ�
	public static void selMem() throws InterruptedException,IOException
	{
		do	// 1, 2 �Է� ���� ������ �ݺ�
		{
			Scanner sc = new Scanner(System.in);
			System.out.print("\n\n\n\n\n\t===============================================");
			System.out.print("\n\t\t    *���� ���� �� ȸ�� Ȯ��*  ");
			System.out.print("\n\t-----------------------------------------------");
			System.out.print("\n\t              1. ȸ�� | 2. ��ȸ��");
			System.out.print("\n\t===============================================");
			System.out.print("\n\t>> �ش��ϴ� ��ȣ�� �Է����ּ��� : ");
			sel = sc.nextInt();

			if (sel>0)
			{
				if (sel==1 || sel==2)
					break;
				System.out.println("\n\t>> �߸��� ��ȣ�� �Է��߽��ϴ�. �ٽ� �Է����ּ���.\n");
			}
		}
		while (sel<1 || sel>2);

		recogMem(); // �Է¹��� ����� ���� ���� �ܰ� �ȳ��ϴ� recogMem �޼ҵ� ȣ��
	} // end selMem ȸ��/��ȸ�� ���� �޼ҵ�


	// ȸ����ȣ(��ȭ��ȣ) ��ϵǾ��ִ� �������� �Ǻ�
	public static void recogMem() throws InterruptedException,IOException
	{
		if (sel==1) // ȸ���� ��
		{
			Scanner sc = new Scanner(System.in);

			System.out.println("\n\n\n\n\n\t[ ȸ�� ���� Ȯ�� ]");
			System.out.println("\t===============================================");
			System.out.print("\t��ȭ ��ȣ�� �Է����ּ���.(xxx-xxxx-xxxx) : ");
			String tel = sc.nextLine();
			search(tel); // ȸ������ Ȯ�� ���� �Է¹��� ��ȭ��ȣ search() �޼ҵ忡 �Ѱ��ְ�
		}
		else if(sel==2)
			noMemAge(); // ��ȸ�� �޼ҵ� ȣ��

	} // end recogMem ȸ�� Ȯ�� �޼ҵ�

	// ȸ������ Ȯ�ε� �� ���� �� ������ ��� �ȳ� �޼ҵ�
	public static void search(String tel) throws InterruptedException,IOException
	{
		Scanner sc = new Scanner(System.in);

		Members.oldMem(); // Members�� ��ϵǾ��ִ� ȸ�� ���� ������� Ȯ���ϱ� ���� ȣ��
						  // Members.mData�� ȸ������ ������ ����ִ� ArrayList > ������ Ȯ��(ȸ�� ����ŭ �ݺ�)
		for (int i = 0; i < (Members.mData).size() ; i++) 
        {
			// ArrayList�� ����Ǿ��ִ� ���� �� ��ȭ��ȣ �ҷ�����
			String str = (Members.mData).get(i).getTel();
	 
			// ArrayList�� Tel�� �Է��� Tel�� ������
			// �� Tel�� ���� ȸ�� ������ ��� ���
			if (tel.equals(str)) 
			{
				String name = (Members.mData).get(i).getName(); // �λ縻�� �ֱ� ���� �̸� get�ؿ���
				System.out.printf("\t%s ȸ���� �ȳ��ϼ���!\n\t", name);

				culDisc(); // ȸ���� Ȯ�εǾ� ��ȭ�� �� �ȳ� �޼ҵ� ȣ��

				// �ش� ȸ���� ������ �ִ� ����Ʈ(getPoint)�� 2000���� �Ѵ´ٸ� ��� �����ϴٴ� ���� ����
				if ((Members.mData).get(i).getPoint()>=2000)
				{
					// ������ ����� �� �����ϰ� �ٽ� �ݿ��� �� �ִ� usePoint ����
					int usePoint = (Members.mData).get(i).getPoint(); // getPoint�� �˾ƿ� ����Ʈ�� usePoint�� ����
					System.out.println("\n\n\n\n\n\t[ ������ ��� Ȯ�� ]");
					System.out.println("\t===============================================");
					System.out.printf("\t���� ������ [%d��] �����ֽ��ϴ�. \n\t����Ͻðڽ��ϱ�? (Y/N) : ", usePoint);
					answer = (char)System.in.read();
					System.in.skip(2);

					if (answer=='y' || answer=='Y')
					{
						System.out.print("\n\t>> ����� �������� �Է����ּ���. : ");
						su = sc.nextInt();
						usePoint -= su; // �����ݿ��� ��� ������ ����
						(Members.mData).get(i).setPoint(usePoint); // ������ ������ �ݾ� �ٽ� set ���ֱ�
						//System.out.print("������ Ȯ�� : " + usePoint);
						System.out.printf("\t>> [%d]�� ��� �Ϸ��߽��ϴ�. (���� ������ : %d)\n", su, usePoint);

						// ��ȭ�� �� ���� > ���� �߰� ���ŷ�
						Pay.selSnack();
					}	Pay.selSnack();
				}
				else // ������ 2000������ ������ ���Ұ��� �ٷ� ���� �߰����ŷ� �Ѿ
					Pay.selSnack(); 
			}
			else // �������� 2000���� �̻��� �ƴ϶��
			{
				System.out.println("\n\n\t�������� �ʴ� ȸ���Դϴ�. �ٽ� �������ּ���.");
				break; // ���� ���������� �ٽ� ȸ��/��ȸ�� �����ϴ� recogMem() �޼ҵ��
			}
	    }	
	} // end search

	// ��ȸ�� ���� Ȯ�� �޼ҵ�
	public static void noMemAge() throws InterruptedException,IOException
	{
		Scanner sc = new Scanner(System.in);
		Set<String> keys = AdminMovie.ht.keySet(); // key��(��ȭ ����) ��������
		Iterator<String> it = keys.iterator();	   // �ش� ��ȭ�� ���� Ȯ���ϱ� ���� Iterator ����
		String temp="";							   // ��ȿ�� Ȯ���� �� ��Ƶδ� �ӽ� ����
		boolean flag = false;
		
		if (AdminMovie.ht.get(ReserveTikets.checkMovie).getmAge()==19) // ����ڰ� ������ ��ȭ�� 19�� ���� �Ұ����
		{
			do // ��ȿ�� �˻縦 ���� �ݺ���
			{
				System.out.printf("\n\n\n\n\n\t[%s] ��ȭ�� �ֹι�ȣ Ȯ���� �ʿ��մϴ�.",
				AdminMovie.ht.get(ReserveTikets.checkMovie).getmTitle()); // �ֹι�ȣ Ȯ�� �ȳ���Ʈ�� �� ��ȭ�̸� ��������
				System.out.print("\n\t�ֹε�Ϲ�ȣ�� �Է��ϼ���(xxxxxx-xxxxxxx) : ");
				temp = sc.next();

				// �ֹι�ȣ ��ȿ�� �˻� ����
				int[] chk = {2, 3, 4, 5, 6, 7, 0, 8, 9, 2, 3, 4, 5}; 
				int tot = 0;

				for (int i=0 ; i<13 ; i++) // i �� 0 1 2 3 4 5 6 7 8 9 10 11 12
					{
						if (i==6)
							continue;			
						tot += chk[i] * Integer.parseInt(temp.substring(i,i+1));
					}
				
				int su = 11 - tot % 11;
				su = su % 10;
				// �ֹι�ȣ ��ȿ�� �˻� ��
				int nowYear = Calendar.getInstance().get(Calendar.YEAR);

				if (su == Integer.parseInt(temp.substring(13))) // ��ȿ�� �ֹι�ȣ���
				{
					int birYear20 = Integer.parseInt("20" + temp.substring(0,2));
					
					if (nowYear-birYear20<19)
					{
						System.out.print("\n\t>> �˼��մϴ�. �ش� ��ȭ�� û�ҳ� ���� �Ұ��� ���Ÿ� ������ �� �����ϴ�.\n\t���� �ʱ�ȭ������ ���ư��ϴ�.\n");
						User.startUser(); // ���� �ʱ�ȭ������
					}	
					else // ������ 19�̻� ������ ���� �����ϴϱ� ��ȭ�� �� ���� > ���� �߰� ���ŷ�
					{
						culDisc();
						Pay.selSnack();
					}
				}
				else
				{	// �������� �ʴ� �ֹι�ȣ �Է�, flag�� true�� �ٽ� �ݺ��� ����
					flag=true;
					System.out.println("\n\t�������� �ʴ� �ֹι�ȣ�Դϴ�. �ٽ� �Է��ϼ���.\n\n");
				}
			} 
			while (flag);				
		} 
		else // 19�� ���� ��ȭ �ƴϸ� ��ȭ�� �� ���� > ���� �߰� ���ŷ�
		{
			culDisc();
			Pay.selSnack();
		}
	}


	// ��ȭ�� �� ���� �޼ҵ�
	public static void culDisc()
	{
		Calendar cal = Calendar.getInstance();
		w = cal.get(Calendar.DAY_OF_WEEK);

		if (w==3) // ��ǥ�ϴ� ���Ϸ� ���߸� �ɵ�
		{
			System.out.println("\n\n\n\n\n\t �ߡ�[ ��ȭ�� �� �ȳ� ]�ߡ�");
			System.out.println("\t===============================================");
			System.out.println("\t������ ��ȭ�� ��!\n\t��ȭ�� �ݰ��� ��⼼��!");
			System.out.println("\t-----------------------------------------------");
			System.out.println("\t���� ����� �ݾ� : [" + moviePayTot/2 + "��]");
		}
	} // end culDisc ��ȭ�� �� ���� �޼ҵ�
} // end PayDisc class 




// 2. ���� ����� �ݾ� + ���� �߰����� Ȯ�� �� �����ݾ� ���� Ŭ����
class Pay extends AdminCashVO
{
	// key������ ���Ź�ȣ�� ��� value������ RsvNumbVO���� ��� nRsv �ؽ����̺� ���� 
    public static Hashtable<String, RsvNumbVO> nRsv;

    static ReserveTiketsVO rt = new ReserveTiketsVO();
	static AdminCashVO ac = new AdminCashVO();

	static Date payToday = new Date();		//-- �����ð� Ȯ�ο�
	static SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
	static SimpleDateFormat time = new SimpleDateFormat("hh:mm:ss a");
	static String payDate = date.format(payToday); //-- ������ ��¥ ���
	static String payTime = time.format(payToday); //-- ������ �ð� ���

	static int payTot; //-- ��ȭ+���� �ջ� ����
	static int a, b, c, d, inputTot, chaCash; // ���� �Է¹޾� ���翡 �ݿ��ϱ� ���� a,b,c,d ����
											  // �Է��� �� ����, �Ž�����(changeCash)

	public static boolean flag = false;

   static 
   {
	   nRsv = new Hashtable<>();
   }

	// ���� �߰� ���� Ȯ�� �� ����
	static void selSnack() throws InterruptedException,IOException
	{
		BuySnacks bst = new BuySnacks(); // ���� ���� VO �ν��Ͻ� ����
		Scanner sc = new Scanner(System.in);

		System.out.print("\n\n\n\t>> ����/���� �߰� ���� �Ͻðڽ��ϱ�?(Y/N) : ");
		answer = (char)System.in.read();
		
		if (answer=='Y' || answer=='y')
		{
			bst.snackMenuDisp(); // ���� ���� �޼ҵ� ȣ��
		}
		else
			selPay(); // ���� ���� ���� �޼ҵ� ȣ��
	}

	// ���� ���� ���� �޼ҵ�
	static void selPay() throws InterruptedException,IOException
	{
		payTot = snackPayTot + moviePayTot; // ��ȭ+���� ���� ����
		cul = moviePayTot/2;			// ��ȭ�� �� ���ΰ��� ��Ƴ���

		if (moviePayTot>0 && snackPayTot>0) // ��ȭ, ���� ��� ���� �ݾ��� �ִٸ�
		{
			if (w==3) // ��ȭ�� ���̶��
			{
				System.out.print("\n\n\n\t===============================================");
				System.out.printf("\n\t���� ���� �ݾ��� %d�Դϴ�.", cul+snackPayTot-su);
				System.out.print("\n\t===============================================");
			}
			else if (w!=3)
			{
				System.out.print("\n\n\n\t===============================================");
				System.out.printf("\n\t���� ���� �ݾ��� %d�Դϴ�.", payTot-su);
				System.out.print("\n\t===============================================");
			}
		}

		if (moviePayTot<=0 && snackPayTot>0)
		{
			System.out.print("\n\n\n\t===============================================");
			System.out.printf("\n\t���� ���� �ݾ��� %d�Դϴ�.", snackPayTot);
			System.out.print("\n\t===============================================");
		}

		if (moviePayTot>0 && snackPayTot<=0)
		{
			if (w==3) // ��ȭ�� ���̶��
			{
				System.out.print("\n\n\n\t===============================================");
				System.out.printf("\n\t���� ���� �ݾ��� %d�Դϴ�.", cul+snackPayTot-su);
				System.out.print("\n\t===============================================");
			}
			else if (w!=3)
			{
				System.out.print("\n\n\n\t===============================================");
				System.out.printf("\n\t���� ���� �ݾ��� %d�Դϴ�.", moviePayTot-su);
				System.out.print("\n\t===============================================");
			}
		}

		do
		{
			Scanner sc = new Scanner(System.in);

			System.out.println("\n\t1. ����");
			System.out.println("\t2. ī��");
			System.out.print("\t���� ����� �Է����ּ��� : ");

			sel = sc.nextInt();

			if (sel>0)
			{
				if (sel==1 || sel==2)
					break;
				System.out.println("\t>> �߸��� ��ȣ�� �Է��߽��ϴ�. �ٽ� �Է����ּ���.\n");
			}
		}
		while (sel<1 || sel>2);

		if (sel==1)
		{
			if (moviePayTot>0 && snackPayTot>0) // ��ȭ, ���� ��� ���� �ݾ��� �ִٸ�
			{
				payCash();
				printAd();
				receipt();
				coupon();
				User.startUser();
			}
			if (moviePayTot<=0 && snackPayTot>0) // ������ ���� �ݾ��� �ִٸ�
			{
				payCash();
				coupon();
				User.startUser();
			}
			if (moviePayTot>0 && snackPayTot<=0) // ��ȭ�� ���� �ݾ��� �ִٸ�
			{
				payCash();
				printAd();
				receipt();
				User.startUser();
			}
		}
		else if(sel==2)
		{
			if (moviePayTot>0 && snackPayTot>0) // ��ȭ, ���� ��� ���� �ݾ��� �ִٸ�
			{
				payCard();
				printAd();
				receipt();
				coupon();
				User.startUser();
			}
			if (moviePayTot<=0 && snackPayTot>0) // ������ ���� �ݾ��� �ִٸ�
			{
				payCard();
				coupon();
				User.startUser();
			}
			if (moviePayTot>0 && snackPayTot<=0) // ��ȭ�� ���� �ݾ��� �ִٸ�
			{
				payCard();
				printAd();
				receipt();
				User.startUser();
			}
		}

	} // end selPay() ���� ���� ���� �޼ҵ�


	// ���� ����
	static void payCash() throws InterruptedException,IOException
	{
		payTot = snackPayTot + moviePayTot;

		Scanner sc = new Scanner(System.in);
		System.out.print("\n\n\n\t������ �ݾ��� ���󺰷� �Է����ּ���.");

		do // ���� �����ϸ� �ٽ� �Է� ��û�ϴ� �ݺ� ����
		{
			flag = false;
			System.out.print("\n\t>> 50000���� : ");
			a = sc.nextInt();
			System.out.print("\t>> 10000���� : ");
			b = sc.nextInt();
			System.out.print("\t>> 5000����  : ");
			c = sc.nextInt();
			System.out.print("\t>> 1000����  : ");
			d = sc.nextInt();

			inputTot = 50000*a + 10000*b + 5000*c + 1000*d;

			System.out.printf("\n\t50000���� %d��, 10000���� %d��, 5000���� %d��, 1000���� %d�� \n\t�� [%d��] �����߽��ϴ�.\n", a, b, c, d, inputTot);

			if (payTot>inputTot)
			{
				flag = true;
				System.out.printf("\n\t[�� ���� �ݾ�(%d)]���� [%d��]���� �����߽��ϴ�. �ٽ� �Է����ּ���.\n", payTot, payTot-inputTot);
			}
		}
		while (flag);

		if (payTot<inputTot) // �� �ݾ׺��� ���� �������� �� �� �Ž�����
		{
			payi = 2; 
			//----------------- ���翡 �Է¹��� �� �ݿ�
			ac.setOmanwon(a);
			ac.setManwon(b);
			ac.setOcheonwon(c);
			ac.setCheonwon(d);

			//----------------- �Ž����� ���
			chaCash = inputTot-payTot;

			int oman = chaCash / 50000;
			int man = chaCash % 50000 / 10000;
			int ocheon = chaCash % 50000 % 10000 / 5000;
			int cheon = chaCash % 50000 % 10000 % 5000 / 1000;

			if (chaCash>payHap) // �Ž������� ���� ���뿡 �ִ� �ݾ׺��� ���� ��(=�Ž����� �� ����)
			{
				payi = 1; // �Ž����� �� ���� �� 1�� �����س����� �ʱ�޴� ���� �޼ҵ忡 �ִ� if������ ���� ī����� �ȳ� ���� �߰���
				System.out.print("\n\n\n\t�˼��մϴ�. ���� ��迡 ���� �������� �ܵ� ��ȯ�� �Ұ��Ͽ� ������ ������ �� �����ϴ�.");
				System.out.print("\n\t===============================================");
				System.out.print("\n\t1.ī��� �����ϱ� | 2. ���� �������� �ʱ�");
				System.out.print("\n\t===============================================");
				System.out.print("\n\t>> �ٸ� ����� �Է����ּ��� : ");
				sel = sc.nextInt();

				if (sel==1)
					payCard();
				else if (sel==2)
					Admin.adminSalesON();
				else
					System.out.println("\t>> �߸��� ��ȣ�� �Է��߽��ϴ�. �ٽ� �Է����ּ���.\n");
	
			}
			else
			{
				payi = 2; 
				System.out.printf("\n\t���Ǳ� �ϴܿ� �Ž����� [50000���� %d��, 10000���� %d��, 5000���� %d��, 1000���� %d��]", oman, man, ocheon, cheon);
				System.out.printf("\n\t>> �� [%d��] �޾ư�����.",chaCash);
			}

			//----------------- ������ �Ž����� ���翡 �ݿ�(����)
			ac.setOmanwon(-(oman));
			ac.setManwon(-(man));
			ac.setOcheonwon(-(ocheon));
			ac.setCheonwon(-(cheon));
			ac.setCashMovie(moviePayTot);
			ac.setCashSnacks(snackPayTot);
		}
		else if (payTot==inputTot)
		{
			//----------------- ���翡 �Է¹��� �� �ݿ�
			ac.setOmanwon(a);
			ac.setManwon(b);
			ac.setOcheonwon(c);
			ac.setCheonwon(d);
			ac.setCashMovie(moviePayTot);
			ac.setCashSnacks(snackPayTot);

			System.out.printf("\n\t>> %d�� ���� �Ϸ�ƽ��ϴ�.\n", inputTot);
			System.out.println("\t(���� �ð� : " + payDate + " " + payTime + ")");
		}

		snackPayTot = 0;
		moviePayTot = 0;

	}// end payCash() ���� ���� �޼ҵ�
	
	// ī�� ����
	static void payCard() throws InterruptedException,IOException
	{
		System.out.print("\n\n\n\n\t�ܸ��⿡ ī�带 �������ּ���.\n\n\n\t");

        for (int i = 0; i<3; i++) 
		{
            System.out.print("..");
            Thread.sleep(1000);
        }
        System.out.print("������ �������̿��� ī�带 ��������������...\n\t");

		for (int i = 0; i<2; i++) 
		{
            System.out.print(".");
            Thread.sleep(1000);
        }
		System.out.println("\n\n\t������ �Ϸ�ƽ��ϴ�!\n\tī�带 �������ּ���.\n");
		ac.setCardMovie(moviePayTot);
		ac.setCardSnacks(snackPayTot);

		System.out.println("\t(���� �ð� : " + payDate + " " + payTime + ")"); 
	} // end payCard() ī�� ����

	// ���� �� ��� ���� Ȯ��
	public static void printAd() throws IOException, InterruptedException
	{
		Random rd = new Random();
		System.out.println("\n\n\n\n\t===============================================");
		System.out.println("\t����! ������ �� ��ȭ�� �����?         (AD)");
		System.out.println("\t-----------------------------------------------");

		// ��ϵ� ��ȭ �� ���� ���(����)

		Set<String> key = AdminMovie.ht.keySet(); // ���� ��ϵ� ��ȭ�� ��������
		Iterator<String> hit = key.iterator();	  // ��ȸ�ϱ� ���� iterator ����
		int rdsu = rd.nextInt(key.size());		  // ��ϵ� ��ȭ ����ŭ ������ ������ ���� �޾Ƴ���
		
		String rdMovie="";
		while (hit.hasNext())
		{
			String[] rdmTit = new String[key.size()]; // ��ϵ� ��ȭ ������ŭ �� �����
			//Object keys = hit.next();
			for(int i=0; i<key.size(); i++) // �迭�� ��ϵ� ��ȭ �� ���
				rdmTit[i] = hit.next();
			rdMovie = rdmTit[rdsu];	// �� �� �������� �ִ� ��ȭ ���� ��Ƴ���
		}
		System.out.println(AdminMovie.ht.get(rdMovie)); // ���� ��� (��ȭ ����)
		System.out.println("\t===============================================");


		System.out.print("\n\t��ȭ Ƽ�� ������Դϴ�");
		for (int i = 0; i<3; i++) 
		{
            System.out.print(".");
            Thread.sleep(2000);
        }
	}

	public static void receipt() throws IOException, InterruptedException
	{

		System.out.printf("\n\n\n\n\n\t   %20s\n", "===============================");
		System.out.printf("\n\t      %13s\n", "��ȭ �����");
		System.out.printf("\t      %14s\n\n", " (������ ���)");
		System.out.printf("\t   %20s\n", "-------------------------------");
		System.out.printf("\t            %s\n", " |���� �ð�|");
		System.out.printf("\t      %-1s  %-1s\n", payDate, payTime);
		System.out.printf("\t   %25s\n", "-------------------------------");
		System.out.printf("\t   %24s \n", "");
		System.out.printf("\t      ���Ź�ȣ : %s \n", rt.rMem);
		System.out.printf("\t      %s(%d�� �̻�) \n", ReserveTikets.checkMovie, AdminMovie.ht.get(ReserveTikets.checkMovie).getmAge());
		System.out.printf("\t      �� �ð� : %s \n", ReserveTikets.checkTime);
		System.out.printf("\t   %25s\n", "-------------------------------");
		System.out.printf("\t      �� �ο�  : %d�� \n",rt.inwon);
		System.out.printf("\t      �󿵰�   :%s��\n", AdminMovie.rm1.get(ReserveTikets.checkTime)); 
		System.out.printf("\t      �¼���ȣ : %s \n",rt.cSeat);
		System.out.printf("\t   %25s\n", "-------------------------------");
		System.out.printf("\t      ��ȭ Ƽ�� : %d \n",rt.inwon * 10000);

		Calendar cal = Calendar.getInstance();
		w = cal.get(Calendar.DAY_OF_WEEK);

		int n=0; // ���� ����Ǵ� �ݾ� ��Ƶα� ����
		if (w==3) // ��ǥ�ϴ� ���Ϸ� ������
		{   
			System.out.printf("\t      >> ��ȭ�� �� ���� : %d \n", moviePayTot/2);
			n = moviePayTot/2;
		}
		System.out.printf("\t      >> ������ ���� : %d \n", su); // ������ ���� �������

		if (moviePayTot>0 && snackPayTot>0) // ��ȭ, ���� ��� ���� �ݾ��� �ִٸ�
		{
			System.out.printf("\t     ���� ���� : %d \n", snackPayTot);	
			System.out.printf("\t   %25s\n", "-------------------------------");
			if (w==3) // ��ȭ�� ���̶��
			{
				System.out.printf("\t      �� �����ݾ� : %d \n", cul+snackPayTot-su);
			}
			else if (w!=3)
			{
				System.out.printf("\t      �� �����ݾ� : %d \n", payTot-su);
			}
			System.out.printf("\n\t   %20s\n", "===============================");
		}

		if (moviePayTot>0 && snackPayTot<0) // ��ȭ�� ���� �ݾ��� �ִٸ�
		{
			System.out.printf("\t   %25s\n", "-------------------------------");
			if (w==3) // ��ȭ�� ���̶��
				{
					System.out.printf("\t      �� �����ݾ� : %d \n", cul+snackPayTot-su);
				}
			else if (w!=3)
				{
					System.out.printf("\t      �� �����ݾ� : %d \n", moviePayTot-su);
				}
			System.out.printf("\n\t   %20s\n", "===============================");
		}

		snackPayTot = 0;
		moviePayTot = 0;


       // �ؽ����̺� nRsv�� value���� �������� �������� �Ű������� �޴� RsvNumbVo ����� ���ο� �ν��Ͻ� �����Ͽ� �߰�
       nRsv.put(rt.rMem, new RsvNumbVO(rt.rMem, ReserveTikets.checkMovie, ReserveTiketsVO.cSeat, ReserveTikets.lastTimeTable, AdminMovie.rmNum));
	}

	public static void coupon()
	{
		System.out.printf("\n\n\n\n\n\t   %20s\n", "===============================");
		System.out.printf("\n\t           %s\n", "����/���� ��ȯ��");
		System.out.printf("\t        %s\n\n", " (������ ���/����)");
		System.out.printf("\t   %20s\n", "-------------------------------");
		System.out.printf("\t            %s\n", " |���� �ð�|");
		System.out.printf("\t      %-1s  %-1s\n", payDate, payTime);
		System.out.printf("\t   %25s\n", "-------------------------------");
		System.out.printf("\t   %24s \n", "");
		System.out.printf("\t         �� ��ȯ ��ȣ : %d �� \n\n", couponNum+1);
		System.out.print("\t   ���� ������ ��ȯ ��ȣ��");
		System.out.print("\n\t   Ȯ���� �� �ֵ���");
		System.out.println("\n\t   �� �������ּ���.");
		System.out.printf("\n\t   %20s\n", "===============================");
		couponNum += 1;
	}

} // end Pay class 