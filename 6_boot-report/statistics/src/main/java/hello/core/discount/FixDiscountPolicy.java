package hello.core.discount;

import hello.core.member.Grade;
import hello.core.member.Member;
//진짜디스카운트클래스
public class FixDiscountPolicy implements DiscountPolicy {
	//디스카운트 규정 
	private int discountFixAmount = 1000;//1000원 할인 

	//디스카운트 정책 
	@Override
	public int discount(Member member, int price) {
		
		//vip시면 discount해드릴게요
		if(member.getGrade() == Grade.VIP) {
			return discountFixAmount;
		}else {
			return 0;
		}
	}
	
	
}
