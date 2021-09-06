import java.util.*;
import java.lang.*;
import java.text.SimpleDateFormat;

class  RM_shj
{
  // ��ȭ���� ��� �޼ҵ� 
	public static void registerMovie() 
	{

	 Scanner sc = new Scanner(System.in);

	 String openDate;	// ��ȭ ��������
	 String endDate;	// ��ȭ ��������
	 int age;			// ��ȭ �������ɿ���
	 int time;			// ��ȭ �� �󿵽ð�
	 int star;			// ��ȭ ����
	 String answer="";
	 int t=0;					//do while�� ó�� �� �� �⺻ �� 

	 int yy, mm, dd;
	 yy=mm=dd=0;

	 boolean flag;				 // do while���� ���������� ���� 
	 
	 System.out.println("\n\n");
	 System.out.println("\t��ȭ ���                                   -1. ��ȭ ���� �޴�");
	 System.out.println("\t==============================================================");

	 t = 0;			// do while���� ���� ���� t �ʱ�ȭ 
	 
		do
		{
			flag = false;	// do while���� ���� ���� flag �� �ʱ�ȭ
			
			while (flag==false)		// ����ó���� �ϱ� ���� �ݺ��� 
			{
				 flag = true;	// do while���� ���� ���� flag �� �ʱ�ȭ
				 
				 System.out.println();
				 System.out.print("\t>> ����� ��ȭ ���� ���ڸ� �Է��ϼ��� (YY-MM-DD) : ");
				 
				 openDate = sc.next();	
				 //ex String openDate = "21-06-13"; ���·� �Էµ� ������;

				 try
				 {
					//���˿� ���� ��ȿ�� �˻�
					SimpleDateFormat dateFormatParser = new SimpleDateFormat("yyyy-MM-dd"); //������ ��¥ ���� ����
					dateFormatParser.setLenient(false); //false�ϰ�� ó���� �Է��� ���� �߸��� ������ �� ������ �߻�
					dateFormatParser.parse(openDate); //��� �� ���˿� ����Ǵ��� Ȯ��
					
					 //break; 
					
					 //��¥ ���˿� ���� ��� ���ܸ� ������ ����
					 flag = true; 
					 
					 //��¥ ���˿� ���� ���� ��� ���ܸ� ����				 

					//- ��¥ ���˿� �´ٸ� if�� Jump
					
					//��, ��, �� ������ ���ؼ� String > Date > Calendar ����
					Date date = dateFormatParser.parse(openDate);
					Calendar cal = Calendar.getInstance();
					cal.setTime(date); 

					//cal.getTime() - openDate�� Calendar ����
					yy = cal.get(Calendar.YEAR);
					mm = cal.get(Calendar.MONTH) + 1;
					dd = cal.get(Calendar.DAY_OF_MONTH);

				 }
				 catch (Exception e) 
				 {
					 flag = false;
					 System.out.println("\n\t>> �߸� �Է��ϼ̽��ϴ�. �Է� ���Ŀ� ���� �Է����ּ���.");
				 }

			}
			  // �Է� ���� ������ ��ȿ�� �˻�

			 // ���� ���� ����
			 String result = (yy%4==0&&yy%100!=0||yy%400==0? "����": "���");


			 if (mm<1 || mm>12)				// ���� 1~12�� �ƴ϶�� 
				 flag = false;

			 if (dd>31)						// ���� 31���� ������
				 flag = false;
			 else if (result=="���" && mm==2 && dd>28)			// ��� 2���� �� 28���� ������   
				 flag = false;
			 else if (result=="����" && mm==2 && dd>29)			// ���� 2���� �� 29���� ������     
				 flag = false;
			 else if ((mm==4 || mm==6 || mm==9 || mm==11) && dd>30)	// 4, 6, 9. 11���Ͻ� 30���� ������ 
				 flag = false;

			 t++;
		 }
		 while (flag==false);
	 
	 t = 0;			// do while���� ���� ���� t �ʱ�ȭ 


	} // end registerMovie() ��ȭ ��� �޼ҵ� 

	public static void main(String[] args) 
	{
		registerMovie();
	}
}
