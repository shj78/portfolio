package hello.core.discount;

import hello.core.member.Grade;
import hello.core.member.Member;
//��¥��ī��ƮŬ����
public class FixDiscountPolicy implements DiscountPolicy {
	//��ī��Ʈ ���� 
	private int discountFixAmount = 1000;//1000�� ���� 

	//��ī��Ʈ ��å 
	@Override
	public int discount(Member member, int price) {
		
		//vip�ø� discount�ص帱�Կ�
		if(member.getGrade() == Grade.VIP) {
			return discountFixAmount;
		}else {
			return 0;
		}
	}
	
	
}
