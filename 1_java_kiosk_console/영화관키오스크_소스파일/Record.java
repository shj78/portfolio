import java.util.Scanner;

//-------------------------[ Record Ŭ���� ]-------------------------

public class Record
{
	public static Integer sel;      //-- �޴� ���� ���� ��� ����
	static Scanner sc;				//-- Scanner �޸� �Ҵ�
	static char answer;

	static int snackPayTot=0; 
	static int payCash, payCard, payHap;	//-- ����/���ܿ����� �ѱݾ�, ��ȭ������ �ѱݾ�
	static int moviePayTot=0; //-- �׽�Ʈ��
	//static String memFlag="";
	static int payTot = moviePayTot+snackPayTot;
	static String cMem;				//-- ���Ź�ȣ
	static String uSelTit;
	static int selMovieDate;
    static int payi = 2;			//-- �ܰ� ���� ���� �Ǻ���
	static int iLast=1;
	static int temp;				//-- �¼���ȣ �ӽ� ����
	static int w;					//-- Pay Ŭ���� ��ȭ�� �� �Ǻ�����
	static int su;					//-- Pay Ŭ���� ����Ʈ �����ݾ�
	static int cul;					//-- ��ȭ�� �� ������ ���� ����
	static int couponNum;		//-- ��ȯ�� ī����
	static String rm;				//-- ConRes
}