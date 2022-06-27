package hello.core;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import hello.core.discount.DiscountPolicy;
import hello.core.discount.FixDiscountPolicy;
import hello.core.discount.RateDiscountPolicy;
import hello.core.member.MemberRepository;
import hello.core.member.MemberService;
import hello.core.member.MemberServiceImpl;
import hello.core.member.MemoryMemberRepository;
import hello.core.order.OrderService;
import hello.core.order.OrderServiceImpl;

//app 전체를 설정하고 구성한다. 
//담당 배우가 다른 배우를 섭외하게 하지 않고 AppConfig에서 다 하게 한다. 
//AppConfig는 애플리케이션의 실제 동작에 필요한 구현객체를 생성한다. -> 내가 직접 new 하고 하던거 다 사라짐.
//AppConfig는 생성한 객체 인스턴스의 참조를 생성자를 통해서 주입해준다.

//공연기획자 - 의존관계는 모두 기획자에게 맡겨! 
@Configuration//스프링으로 수정중 1----------- // @Configuration은 싱글톤을 위해서 존재한다.  
public class AppConfig {
	
	//예측한 결과
	//call AppConfig.memberService
	//call AppConfig.memberRepository
	//call AppConfig.memberRepository
	//call AppConfig.orderService
	//call AppConfig.memberRepository
	
	//실제 결과
	//call AppConfig.memberService
	//call AppConfig.memberRepository
	//call AppConfig.orderService
	
	@Bean//스프링으로 수정중 2-----------각 메서드에 Bean이라고 적어주면 이 메서드들이 스프링컨테이너에 등록이 됨 (k:메서드이름, v:메서드 내용)
	public MemberService memberService() {
		System.out.println("call AppConfig.memberService");
		//return new MemberServiceImpl(new MemoryMemberRepository());//생성자 전달 - 의존관계 주입 
		return new MemberServiceImpl(memberRepository());//위에서 아래로!!! - ①
		//MemberServiceImpl입장에서는 내 주머니에 뭐가 쏙 갑자기 들어와있는 것 같아 의존 관계를 누가 주입했다고 해서 DI
	}
	
	@Bean
	public MemberRepository memberRepository() {
		System.out.println("call AppConfig.memberRepository");
		return new MemoryMemberRepository();
	}
	
	@Bean
	public OrderService orderService() {
		//생성자를 두개를 만들어서 OrderServiceImpl이 MemoryMemberRepository와 FixDiscountPolicy를 참조하는 그림을 그림 
		//그리고 완성되면 그 OrderServiceImpl을 반환 
		System.out.println("call AppConfig.orderService");
		return new OrderServiceImpl(memberRepository(), discountPolicy());//객체 생성에서 호출로!!! - ② 하니까 서로 다른 객체였던 것들이 한 객체로 
	}
	
	@Bean
	public DiscountPolicy discountPolicy() {
		//return new FixDiscountPolicy();
		return new RateDiscountPolicy();
	}
}
