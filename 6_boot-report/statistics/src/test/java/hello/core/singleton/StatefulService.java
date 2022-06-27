package hello.core.singleton;

public class StatefulService {
	
	private int price; //���¸� �����ϴ� �ʵ� 10000 �� 20000
	
	public void order(String name, int price) {
		System.out.println("name = " + name + " price = " + price);
		this.price = price; //���Ⱑ ����!
	}

	public int getPrice() {
		return price;
	}
}
