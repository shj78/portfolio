package hello.core.member;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import hello.core.AppConfig;
import hello.core.order.OrderService;

public class MemberServiceTest {
	
	//������ ������ ����
	//MemberService memberService = new MemberServiceImpl(null);
	MemberService memberService;
	OrderService orderService;
	
	@BeforeEach //�׽�Ʈ ���� �� ������ ����Ǵ� �� 
	public void beforeEach() {
		AppConfig appConfig = new AppConfig();//AppConfig Ŭ���� ��ü ���� 
		memberService = appConfig.memberService();
		orderService = appConfig.orderService();
	}
	
	@Test // JUNIT Run�� Ȱ��ȭ�Ǹ� �ʷϻ��� ������ �߰� �������� ������...
	void join() {
		//given - ~�־����� ��
		Member member = new Member(1L, "memberA", Grade.VIP);
		//when - ~ �� 
		memberService.join(member);
		//Member findMember = memberService.findMember(2L); - ������! ������ ������...
		Member findMember = memberService.findMember(1L);
		
		//then - ~�� �ȴ�.
		Assertions.assertThat(member).isEqualTo(findMember);
		
		//�������� �ڵ� ��� - �׽�Ʈ �ڵ�� �ʼ�. 60%�� �����ڰ� �׽�Ʈ �ڵ带 �ۼ��Ѵ�. �׽�Ʈ �ڵ�� �߿��ϴ�. 
	}
}
