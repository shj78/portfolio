package hello.core;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import hello.core.member.Grade;
import hello.core.member.Member;
import hello.core.member.MemberService;
//import hello.core.member.MemberServiceImpl; - 의존할 필요 없음
import hello.core.order.Order;
import hello.core.order.OrderService;
//import hello.core.order.OrderServiceImpl; - 의존할 필요 없음 

public class OrderApp {
	//메인 메서드로 테스트 하는건 좋지 않다. 
	public static void main(String[] args) {
		
		//AppConfig appConfig = new AppConfig();
		//필요하면 꺼내고 
		//MemberService memberService = appConfig.memberService();
		//OrderService  orderService = appConfig.orderService();
		
		ApplicationContext applicationContext = new AnnotationConfigApplicationContext(AppConfig.class);
		MemberService memberService = applicationContext.getBean("memberService", MemberService.class);
		OrderService orderService = applicationContext.getBean("orderService", OrderService.class);
		
		//MemberService memberService = new MemberServiceImpl(null);
		//OrderService orderService = new OrderServiceImpl(null, null);
		
		Long memberId = 1L;
		Member member = new Member(memberId, "memberA", Grade.VIP);
		memberService.join(member);
		Order order = orderService.createOrder(memberId, "itemA", 20000);
		
		System.out.println("order = " + order);
		//System.out.println("order = " + order.toString());
		
		//System.out.println("order.calculatePrice = " + order.calculatePrice());
	}
	
}
