package hello.core.singleton;

public class SingletonService {
	private static final SingletonService instance = new SingletonService();
	
	public static SingletonService getInstance() {
		return instance;
	}
	
	private SingletonService() {
		
	}
	
	public void logic () {
		System.out.println("싱글톤 객체 로직 추출");
	}
	//1. static영역에 자바가 올라가면 instance가 뜨게 된다.
	//2. 이 객체 인스턴스는 getInstance() 메서드로만 접근할 수 있다.
	//3. 한개의 인스턴스만 존재해야하므로 혹시나 모를 외부 접근을 막기위해서 생성자를 private 
	
}
