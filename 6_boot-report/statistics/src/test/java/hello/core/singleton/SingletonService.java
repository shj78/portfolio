package hello.core.singleton;

public class SingletonService {
	private static final SingletonService instance = new SingletonService();
	
	public static SingletonService getInstance() {
		return instance;
	}
	
	private SingletonService() {
		
	}
	
	public void logic () {
		System.out.println("�̱��� ��ü ���� ����");
	}
	//1. static������ �ڹٰ� �ö󰡸� instance�� �߰� �ȴ�.
	//2. �� ��ü �ν��Ͻ��� getInstance() �޼���θ� ������ �� �ִ�.
	//3. �Ѱ��� �ν��Ͻ��� �����ؾ��ϹǷ� Ȥ�ó� �� �ܺ� ������ �������ؼ� �����ڸ� private 
	
}
