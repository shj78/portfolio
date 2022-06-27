package hello.core.member;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import hello.core.AppConfig;
import hello.core.order.OrderService;

public class MemberServiceTest {
	
	//생성자 때문에 오류
	//MemberService memberService = new MemberServiceImpl(null);
	MemberService memberService;
	OrderService orderService;
	
	@BeforeEach //테스트 실행 전 무조건 실행되는 것 
	public void beforeEach() {
		AppConfig appConfig = new AppConfig();//AppConfig 클래스 객체 생성 
		memberService = appConfig.memberService();
		orderService = appConfig.orderService();
	}
	
	@Test // JUNIT Run이 활성화되며 초록색이 좌측에 뜨고 긍정적인 마음이...
	void join() {
		//given - ~주어졌을 때
		Member member = new Member(1L, "memberA", Grade.VIP);
		//when - ~ 때 
		memberService.join(member);
		//Member findMember = memberService.findMember(2L); - 빨간색! 부정적 마음이...
		Member findMember = memberService.findMember(1L);
		
		//then - ~가 된다.
		Assertions.assertThat(member).isEqualTo(findMember);
		
		//현대적인 코딩 방법 - 테스트 코드는 필수. 60%의 개발자가 테스트 코드를 작성한다. 테스트 코드는 중요하다. 
	}
}
