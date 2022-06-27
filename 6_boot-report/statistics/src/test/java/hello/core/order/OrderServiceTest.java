package hello.core.order;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;

import hello.core.member.Grade;
import hello.core.member.Member;
import hello.core.member.MemberService;
import hello.core.member.MemberServiceImpl;

public class OrderServiceTest {
	//null�����ؾ���! 
	MemberService memberService = new MemberServiceImpl(null);
	OrderService orderService = new OrderServiceImpl(null, null);
	
	@Test
	void createOrder() {
		Long memberId = 1L;//null�� �� ���� �־ Wrapper Ŭ������ 
		Member member = new Member(memberId, "memberA", Grade.VIP);
		memberService.join(member);
		
		Order order = orderService.createOrder(memberId, "itemA", 10000);
		Assertions.assertThat(order.getDiscountPrice()).isEqualTo(1000);//assertThat�� ��� �޼��� ü�̴��ϱ� ����.
		
	}
}
