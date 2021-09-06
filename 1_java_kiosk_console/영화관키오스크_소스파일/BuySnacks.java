import java.util.Scanner;
import java.io.IOException;
import java.util.Hashtable;

/*
	Title	 : BuySnacks
	Function : ����ڰ� ����/������ ������ �� �ֵ��� ��� ����
	author	 : �Ҽ���, ������
*/

/*
	�ۼ��� : ������ 
	�� 21-03-21 12:58 snackMenuDisp() ���� �ʱ�ȭ������ ���ư������� snackSelect() do while�� snackMenuDisp()�޼ҵ�� �̵�,
					  ����ڿ��� �Է� ���� sel ���� snackSelect()���� �������� ���� �Ű����� �߰� 
*/

//-------------------------[ ����/���� ���� Ŭ���� ]-------------------------

class BuySnacks extends Record
{
	static int snackSu;												//-- �Է¹޴� ���� ����
	static final String[] snackName = {"�ݶ�", "���̴�", "����"};	//-- ���� �޴� �̸����� ���� �迭
	static int[] snackSuArr = new int[3];							//-- ������ ���� ���� ������ ��� �迭


	// <������ �޴�, ���� ����> �� ���� ht
	public static Hashtable<String, Integer> ht = new Hashtable<String, Integer>();


	// ���� �޴��� ��� �� �Է� �޼ҵ�
	public static void snackMenuDisp() throws InterruptedException, IOException
	{
		System.out.println("\n");
		System.out.println("\t�޴���				       -1. ó������");
		System.out.println("\t===================================================");
		System.out.println("\t1. �ݶ�(2,000��)");
		System.out.println("\t2. ���̴�(2,000��)");
		System.out.println("\t3. ����(3,000��)");
		System.out.println();
		
		// 1~3 �̿��� ���� �Է��� �� �޴����ù��� �ݺ��ϵ��� do-while�� ���
		do
		{
			System.out.print("\t>> �����Ͻ� �޴��� �����ϼ���(1~3) : ");
			sel = sc.nextInt();
			
			// -1 �� �Է��ϸ� �޼ҵ� �����Ͽ� ����ڸ��θ޴��� �̵�
			if (sel == -1)
					return;
			
			// ����� �Է��ϰ� 1,2,3 ���� ������ �� ���Է¾ȳ������� ������ ���� break �� 4 �̻� �Էº��ʹ� ���Է¾ȳ������� ����
			if(sel>0)
			{
				if (sel==1 || sel==2 || sel==3)
					break;
				System.out.println("\t��ȿ���� ���� �޴��Դϴ�. �ٽ� �������ּ���.\n");
			}

		}
		while (sel>3 || sel<1);
		
		// �Է� �Ϸ� �� sel���� �Ű������� �޴� snackSelect �޼ҵ�� �̵�
		snackSelect(sel);			//-- �� Ȯ���ʿ�!!!
	}

	// ���� ���ż��� �Է� �޼ҵ�
	public static void snackSelect(int sel) throws InterruptedException, IOException
	{
		// �Է¹ޱ� ���� ��ĳ�� �ν��Ͻ� ����
		Scanner sc = new Scanner(System.in);

		// ���� ��� ���� �迭 ����
		// StocksVO Ŭ������ ��� ������ ���� ������ �� �ֵ��� getter �� ���
		int su[] = {StocksVO.getCoke(), StocksVO.getCida(), StocksVO.getPop()};		//-- {���� ���, ���̴� ���, ���� ���}
		

		// ����� ���ż����� �Է¹��� ������ �ݺ��ϵ��� do-whil�� ���
		do
		{
			// �������� ������ �ȳ����� ���
			if (snackSu<0)
				System.out.println("\n\t�� 0 �̻��� ������ �Է����ּ���.");


			System.out.println("\n\n");
			System.out.printf("\t>> ���� �׸� : %s                    -1. ó������\n", snackName[sel-1]);	//-- sel�� �Է��ߴ� ���� �Ű������� �ٷ� �޾� �����̸� �迭�� ����
			System.out.println("\t====================================================");		
			System.out.printf("\t>> ��%s���� ���� ������ �Է����ּ��� : ",snackName[sel-1]);
			snackSu = sc.nextInt();

			
			// -1 �� �Է��ϸ� �޼ҵ� �����Ͽ� ����ڸ��θ޴��� �̵�
			if (snackSu == -1)
				return;

			
			// ���� ������ �ܰ� ������ ���� �� ������ ����
			if (snackSu>su[sel-1])
			{
				System.out.println("\n\n");
				System.out.print("        -----------------------------------------------------");		
				System.out.printf("\n\t�� ���� ��%s���� �ִ밡�� ���ż����� ��%d���Դϴ�.\n\t   �߰����Ÿ� ���Ͻø� �����ڸ� �ҷ��ּ���.\n", snackName[sel-1], su[sel-1]);
				System.out.println("        -----------------------------------------------------");	
				
				// �ٽ� �Է¹޾� �� �����
				System.out.printf("\n\t>> ��%s���� ���� ������ ���Է����ּ��� : ",snackName[sel-1]);
				snackSu = sc.nextInt();

				// ����/���� �޴������� ���ư��� ����		//-- �� Ȯ���ʿ�!!!
				if (snackSu == -1)
					return;
			}
		}
		while (snackSu<0);
		
										
		// ù ��° ���ż��� �Է¿Ϸ� ���� ���ż���Ȯ�� �� �߰����Ź��� �޼ҵ� ȣ��
		snackCheck();
	}
		
	// ���� �ѱ��ż���Ȯ�� �� �߰����Ź��� �޼ҵ�
	public static void snackCheck() throws InterruptedException, IOException
	{	
		// ���� �� �̸��� ���� �迭�� ���ż��� �ֱ�
		snackSuArr[sel-1] += snackSu;
		// ht�� key��(���ø޴�)�� value ���� ���ż��� �ֱ�
		ht.put(snackName[sel-1], snackSuArr[sel-1]);
		

		// ���ż��� �ȳ� Ȯ�� ���� ���
		System.out.println("\n\n\t���� ���� Ȯ��");
		System.out.println("\t===================================================");
		System.out.printf("\t>> �ݶ� %d��, ���̴� %d��, ���� %d���� �����ϼ̽��ϴ�.\n", snackSuArr[0], snackSuArr[1], snackSuArr[2]);
		

		// �߰����������� ���� ���� Y, y, N, n �� �ƴ� �� �ݺ��ϵ��� do-while�� ���
		do
		{
			System.out.print("\t>> �߰� ���Ÿ� �Ͻðڽ��ϱ�?(Y/N) : ");
			// �� ���ڸ� �Է¹��� �� �ֵ��� System.in.read() ��� -- answer ���� ������ Record Ŭ������ ���� 
			answer = (char)System.in.read();
			System.in.skip(2);
		}
		while (answer != 'y' && answer != 'Y' && answer != 'n' && answer != 'N');
			
		// �߰����� �� �� �����޴��� �ٽ� ȣ��
		if (answer == 'y' || answer == 'Y')
			snackMenuDisp();

		// �߰����� ���� �� ���� �ش� ������ �°� ���� ���ŷ��� snackSuArr �� ����
		if (answer == 'n' || answer == 'N')
		{
			if (ht.containsKey(snackName[sel-1]))				// �� key ��(�ش� �����̸�)�� �����Ѵٸ�
			{
				if(ht.get(snackName[sel-1]) != null)			// �� �׸��� Ű ���� ã������
				{
					int add = snackSuArr[sel-1] + snackSu;		// �� add��� ������ ���� ���ż��� + �߰� ���ż��� ���� �ִ´�.
					ht.put(snackName[sel-1], add);				// �� ht�� key ���� �°� add ���� ���Ѵ�.
				}
			}
			// ���� ���� ������ ���� �߰��� �ƴ϶� ���ο� ������ �߰��� �������� �� �ش� ���� �̸��� �°� �״�� snackSu �� ���� 
			else 
				ht.put(snackName[sel-1], snackSu);


			// �������� �����ϴ� �ѱݾ� ���
			// �ݶ�� ���̴ٴ� 2000��, ������ 3000������ ����
			snackPayTot = 2000*(snackSuArr[0]+snackSuArr[1]) + 3000*snackSuArr[2];

			
			// �����޴��� ��� ��Ÿ���� setCoke �� �Ű������� ������ �ѱ��ŷ��� �����ؼ� ��� ������Ʈ ����
			StocksVO.setCoke(-snackSuArr[0]);
			StocksVO.setCida(-snackSuArr[1]);
			StocksVO.setPop(-snackSuArr[2]);
				
			
			// �Է��� ���ż��� ���� (���� ����ڸ� ����)
			for (int i=0; i<3; i++)						
				snackSuArr[i] = 0;
			
			// �� �Ϸ�Ǹ� PayŬ������ �������ܼ��� �޼ҵ带 ȣ��
			Pay.selPay();
		}
	}
	
}
