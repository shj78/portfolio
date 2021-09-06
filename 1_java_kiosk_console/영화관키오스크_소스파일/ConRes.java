import java.util.Scanner;

/*
	Title	 : ConRes
	Function : ��ȭ ���� �Ϸ� �� �ο����� ���Ź�ȣ�� ���� �������� Ȯ���� �����Ѵ�.
	author	 : �Ҽ���, ������
*/

//-------------------------[ ���� Ȯ�� Ŭ���� ]-------------------------

// ���� ���� : 
// PayŬ������ 34�� : RsvNumbVO Ŭ���� ���� �� toString ����
// ReserveTiketsŬ������ 463�� : �󿵽ð�ǥ�� ������ ��¥�� ©���
// ReserveTiketsŬ������ 466~7�� : rMem �� ���� 03-21 �κ��� �ڸ��� �ڿ� 0���� �����ϴ� ���ڸ� ���ļ� ���Ź�ȣ �ϼ�
// PayŬ������ 259�� : nRsv �ؽ����̺� ����
// PayŬ������ 549�� : nRsv�� put
// �״��� ConRes ����

class ConRes extends Record
{ 
	// ���Ź�ȣ �Է� �޴� �޼ҵ�
	public static void conInput() 
	{
		// ����� �Է��� ���� ��ĳ�� �ν��Ͻ� ����
		Scanner sc = new Scanner(System.in);

		System.out.print("\n\t>> ���Ź�ȣ�� �Է����ּ��� : ");									
		rm = sc.next();												//-- rm �� Record Ŭ������ ����
		System.out.println();										//-- ����						
		
		// �Է� �Ϸ� �� ���Ź�ȣ Ȯ�� �޼ҵ� ȣ��
		conRes();
	}
	
	// ���Ź�ȣ Ȯ���ϴ� �޼ҵ�
	public static void conRes()
	{
		// ����ڰ� �Է��� rm ���� PayŬ������ �ִ� nRsv �ؽ����̺��� key ���� �����Ѵٸ� �������� ���
		if (Pay.nRsv.containsKey(rm))
		{
			System.out.println("\t>> ������ ���ų����Դϴ�.");				
			System.out.println("\t====================================");		
			// key��(���Ź�ȣ rm)�� �´� value��(����������ü�� hashcode)�� ���
			System.out.print(Pay.nRsv.get(rm));									
		}

		// �������� �ʴٸ� �ȳ� ���� ���
	   else 
		    System.out.println("\t>> ������ ���� ������ �������� �ʽ��ϴ�.");
	}
}