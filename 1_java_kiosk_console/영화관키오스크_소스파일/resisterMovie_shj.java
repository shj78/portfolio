class  
{
  // ��ȭ���� ��� �޼ҵ� 
  public static void registerMovie() 
  {
	 Scanner sc = new Scanner(System.in);

	 String title="";	// ��ȭ ���� ���� 
	 String genre;		// ��ȭ �帣
	 String openDate;	// ��ȭ ��������
	 String endDate;	// ��ȭ ��������
	 String story;		// ��ȭ �ٰŸ�
	 int age;			// ��ȭ �������ɿ���
	 int time;			// ��ȭ �� �󿵽ð�
	 int star;			// ��ȭ ����
	 String answer="";
	 int t=0;					//do while�� ó�� �� �� �⺻ �� 
	 //String yy, mm, dd;				// ����, �������� ��ȿ�� �˻縦 ���� ����
	 int yy, mm, dd;
	 int oyy, omm, odd, emm, edd;    // ����, �������� ��ȿ�� �˻縦 ���� ����
	 boolean flag;				 // do while���� ���������� ���� 
	 
	 System.out.println("\n\n");
	 System.out.println("\t��ȭ ���                                   -1. ��ȭ ���� �޴�");
	 System.out.println("\t==============================================================");
	
	 // ��ȭ ������ �ߺ� �Ұ���
	 do
	 {	
		 if (t>0)
			System.out.println("\t" + title + "�� �̹� ��ϵǾ��ֽ��ϴ�.");

		 System.out.print("\t>> ����� ��ȭ ������ �Է��ϼ��� : ");
		 title = sc.nextLine();
		 
		 // ��ȭ ���� �޴��� ���ư��� ����
		 if (title.equals("-1"))
			 return; 

		 t++;
	 }
	 while (ht.containsKey(title));
		  
	 // �帣�� �ߺ� ���� 
	 System.out.println();
	 System.out.print("\t>> ����� ��ȭ �帣�� �Է��ϼ��� : ");
	 genre = sc.next();
	 
	 //�������� �ʱ�ȭ������ ���ư� �� �ִ�. 
	 if (genre.equals("-1"))
			 return; 
	
	 t = 0;			// do while���� ���� ���� t �ʱ�ȭ 
	 
	 do
	{
		 //flag = false;	// do while���� ���� ���� flag �� �ʱ�ȭ

		 if (t>0)
			 System.out.println("\n\t>> �Է��� ���ڰ� ��ȿ���� �ʽ��ϴ�.");
		
		while (false)		// ����ó���� �ϱ� ���� �ݺ��� 
		{
			 flag = true;	// do while���� ���� ���� flag �� �ʱ�ȭ
			 
			 System.out.println();
			 System.out.print("\t>> ����� ��ȭ ���� ���ڸ� �Է��ϼ��� (YY-MM-DD) : ");
			 
			 openDate = sc.next();	
			 //ex String openDate = "21-06-13"; ���·� �Էµ� ������;
			 
			 // ��ȭ ������ ���ư��� ����
			 if (openDate.equals("-1"))
				 return; 

			 //���˿� ���� ��ȿ�� �˻�
			 SimpleDateFormat dateFormatParser = new SimpleDateFormat("yyyy/MM/dd"); //������ ��¥ ���� ����

			 try
			 {

				/*
				// �Է��� ������ �������� 
				 yy = openDate.substring(0,2);		// ����ڰ� �Է��� �⵵�� �߶� yy ������ ����
				 mm = openDate.substring(3,5);		// ����ڰ� �Է��� ���� �߶� mm ������ ����
				 dd = openDate.substring(6,8);		// ����ڰ� �Է��� �ϸ� �߶� dd ������ ����
				

				 String hi = openDate.substring(4,5);
				 String hell = openDate.substring(7,8);

				 // ��ȭ ���� �޴��� �̵�, �ݺ��� �������
				 if (!hi.equals("-")) // a != "-" or b != "-" �̷� ������ �ڿ� ������ �ƿ� ���õ� ä�� �� ���Ǹ� �����ص� true ��ȯ�̴�. ���� ����. 
				 {	
					flag = true;
					break;
				 }

				if(!hell.equals("-"))
				 {
					flag = true;
					break;									 
				}
         

				// ���������� ����
				 omm = Integer.parseInt(mm);		// ���� �߶��� ���� ���������� ��ȯ (Open month)
				 odd = Integer.parseInt(dd);		// �ϸ� �߶��� ���� ���������� ��ȯ (Open day)	
				 oyy = Integer.parseInt(yy);		// �⸸ �߶��� ���� ���������� ��ȯ (Open year)

				 //break; 
				 */
				 flag = checkDate(openDate); // false �ƴϸ� true�� ��ȯ - �Ʒ� catch���� �ʿ������
				 
				 //��¥ ���˿� ���� ���� ���
				 //- ��¥ ���˿� �´ٸ� if�� Jump
				 if(flag==false)
					 break;
 
				//��, ��, �� ������ ���ؼ� String > Date > Calendar ����
				Date date = dateFormatParser.parse(opendate);
				Calendar cal = Calendar.getInstance();
				cal.setTime(date); 

				//cal.getTime() - openDate�� Calendar ����
				yy = cal.get(Calendar.YEAR);
				mm = cal.get(Calendar.MONTH) + 1;
				dd = cal.get(Calendar.DAY_OF_MONTH);
				



			 }
			 catch (NumberFormatException e) // ���ڿ��� ���ڷ� ��ȯ�� ���ڿ��� ���� ���ڰ� �ƴ϶�� 
			 {
				 //System.out.println("\n\t>> �߸� �Է��ϼ̽��ϴ�. �Է� ���Ŀ� ���� �Է����ּ���.");
			 }
			 catch (StringIndexOutOfBoundsException so)	// ���ڿ��� substring �� ���ڼ��� �����ϴٸ�
			 {
				 //System.out.println("\n\t>> �߸� �Է��ϼ̽��ϴ�. �Է� ���Ŀ� ���� �Է����ּ���.");
			 }

		}
		  // �Է� ���� ������ ��ȿ�� �˻�

		 // ���� ���� ����
		 String result = (oyy%4==0&&oyy%100!=0||oyy%400==0? "����": "���");


		 if (mm<1 || mm>12)				// ���� 1~12�� �ƴ϶�� 
			 flag = true;

		 if (dd>31)						// ���� 31���� ������
			 flag = true;
		 else if (result=="���" && mm==2 && dd>28)			// ��� 2���� �� 28���� ������   
			 flag = true;
		 else if (result=="����" && mm==2 && dd>29)			// ���� 2���� �� 29���� ������     
			 flag = true;
		 else if ((mm==4 || mm==6 || mm==9 || mm==11) && dd>30)	// 4, 6, 9. 11���Ͻ� 30���� ������ 
			 flag = true;

		 t++;
	 }
	 while (flag);
	
	   
	 t = 0;			// do while���� ���� ���� t �ʱ�ȭ 

	 do
	 {
		 // flag = false;	// do while���� ���� ���� flag �� �ʱ�ȭ

		 if (t>0)
			 System.out.println("\n\t>> �Է��� ���ڰ� ��ȿ���� �ʽ��ϴ�.");

		 while (true)		// ����ó���� �ϱ� ���� �ݺ��� 
		 {
			 flag = false;

			 try
			 {
				 System.out.println();
				 System.out.print("\t>> ����� ��ȭ ���� ���ڸ� �Է��ϼ��� (YY-MM-DD) : ");
				 endDate = sc.next();

				 // ��ȭ ���� �޴��� �̵�, �޼ҵ� ����
				 if (endDate.equals("-1"))
					 return; 

				 // �Է��� �������� �������� 
				 yy = endDate.substring(0,2);		// ����ڰ� �Է��� �⵵�� �߶� yy ������ ����
				 mm = endDate.substring(3,5);		// ����ڰ� �Է��� ���� �߶� mm ������ ����
				 dd = endDate.substring(6,8);		// ����ڰ� �Է��� �ϸ� �߶� dd ������ ����
				 
				 //System.out.println("\t"+mm+"-"+dd);
				 // ���������� ����
				 emm = Integer.parseInt(mm);		// ���� �߶��� ���� ���������� ��ȯ (end month)
				 edd = Integer.parseInt(dd);		// �ϸ� �߶��� ���� ���������� ��ȯ	(end day)

				 String hi = endDate.substring(2,3);	// ����ڰ� �Է��� ���ڿ� �߶� ���� (������, ����� �³� �˻��ϱ� ����) 
				
				 // �Է� ���� ������ ��ȿ�� �˻�
				 if (!hi.equals("-"))				// �������� �ƴ϶��
				  flag = true;

				  break;
			 }
			 catch (NumberFormatException e) // ���ڿ��� ���ڷ� ��ȯ�� ���ڿ��� ���� ���ڰ� �ƴ϶�� 
			 {
				 System.out.println("\n\t>> �߸� �Է��ϼ̽��ϴ�. �Է� ���Ŀ� ���� �Է����ּ���.");
			 }
			 catch (StringIndexOutOfBoundsException so)	// ���ڿ��� substring �� ���ڼ��� �����ϴٸ�
			 {
				 System.out.println("\n\t>> �߸� �Է��ϼ̽��ϴ�. �Է� ���Ŀ� ���� �Է����ּ���.");
			 }
		 }
		

		 if (emm<1 || emm>12)				// ���� 1~12�� �ƴ϶��
			 flag = true;

		 if (edd>31)						// ���� 31���� �Ѵ´ٸ� 
			 flag = true;
		 else if (emm==2 && edd>28)			// 2���Ͻ� 28���� ������
			 flag = true;
		 else if ((emm==4 || emm==6 || emm==9 || emm==11) && edd>30)	// 4, 6, 9. 11���Ͻ� 30���� ������ 
			 flag = true;
		 
		 if (omm>emm)						// ���� ���� ���� �޺��� ũ�ٸ�
			 flag = true;

		 if (omm==emm && odd>edd)			// ���� �ް� ���� ���� ������ �������� �����Ϻ��� ũ�ٸ�
			 flag = true;

		 t++;
	 }
	 while (flag);

	 sc.nextLine();
	 System.out.println();
	 System.out.print("\t>> ����� ��ȭ �ٰŸ��� �Է��ϼ��� : ");
	 story = sc.nextLine();
	 // ��ȭ ���� �޴��� �̵�, �޼ҵ� ����
	 if (story.equals("-1"))
		 return;
	 
	 while (true)
	 {
		 System.out.println();
		 System.out.print("\t>> ����� ��ȭ ���� ���� ������ �Է��ϼ��� : ");
		 try
		 {
		    age = sc.nextInt();

			break;
		 }
		 catch (InputMismatchException e)
		 {
			 sc = new Scanner(System.in);
			System.out.println("\t>> �߸� �Է��ϼ̽��ϴ�. ������ �Է��� �ּ���.\n");
		 }
	 }
	 
	 // ��ȭ ���� �޴��� �̵�, �޼ҵ� ����
	 if (age == -1)
		 return;
	 
	 while (true)
	 {
		 System.out.println();
		 System.out.print("\t>> ����� ��ȭ �� �󿵽ð��� �Է��ϼ��� (MM) : ");

		 try
		 {
			time = sc.nextInt();

			break;
		 }
		 catch (InputMismatchException e)
		 {
			 sc = new Scanner(System.in);
			System.out.println("\t>> �߸� �Է��ϼ̽��ϴ�. ������ �Է��� �ּ���.\n");
		 }
	 }
	
	 // ��ȭ ���� �޴��� �̵�, �޼ҵ� ����
	 if (time == -1)
		 return;
	 
	 while (true)
	 {
		 System.out.println();
		 System.out.print("\t>> ����� ��ȭ ������ �Է��ϼ���. : ");

		 try
		 {
			star = sc.nextInt();

			break;
		 }
		 catch (InputMismatchException e)
		 {
			 sc = new Scanner(System.in);
			System.out.println("\t>> �߸� �Է��ϼ̽��ϴ�. ������ �Է��� �ּ���.\n");
		 }
	 }
	 
	 // ��ȭ ���� �޴��� �̵�, �޼ҵ� ����
	 if (star == -1)
		 return;
	 
	 // �Է¹��� ��ȭ ���� hashtable�� �ֱ� 
	 ht.put(title,(new MovieVO(title, genre, openDate, endDate, story, age, time, star)));		// Hashtable<��ȭ����, ��ȭ����>
	 //ht.put("�̳���",(new MovieVO("�̳���", "����", "02-19", "04-01", "��̱��� �̾߱�", 12, 115, 8)));
	 //ht.put("�ҿ�",(new MovieVO("�ҿ�", "�ִ�", "02-27", "03-27", "���� ��ȭ", 15, 100, 9)));

	 System.out.println();
	 System.out.println("\t>> ��ȭ��"+title+"����(��) ���������� ��� �Ϸ�Ǿ����ϴ�.");
	 

  } // end registerMovie() ��ȭ ��� �޼ҵ� 

	public static void main(String[] args) 
	{
		System.out.println("Hello World!");
	}
}
