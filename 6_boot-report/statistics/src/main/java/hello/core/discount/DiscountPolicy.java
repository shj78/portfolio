package hello.core.discount;

import hello.core.member.Member;

//��ī��Ʈ �������̽�
public interface DiscountPolicy {
	/* 
	 * @return 
	 * ���δ��ݾ�
	 */
	int discount(Member member, int price);
}
