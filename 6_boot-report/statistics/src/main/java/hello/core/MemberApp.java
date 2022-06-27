package hello.core;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import hello.core.member.Grade;
import hello.core.member.Member;
import hello.core.member.MemberService;
//import hello.core.member.MemberServiceImpl;

public class MemberApp {

	public static void main(String[] args) {
		
		//AppConfig appConfig = new AppConfig();
		//MemberService memberService = appConfig.memberService();
		
		//스프링으로 수정중 3-----------여까지 하고 빌드하면 원래와 달리 로그가 찍힌다! 
//			16:58:18.848 [main] DEBUG org.springframework.context.annotation.AnnotationConfigApplicationContext - Refreshing org.springframework.context.annotation.AnnotationConfigApplicationContext@de0a01f
//			16:58:18.860 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'org.springframework.context.annotation.internalConfigurationAnnotationProcessor'
//			16:58:18.947 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'org.springframework.context.event.internalEventListenerProcessor'
//			16:58:18.949 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'org.springframework.context.event.internalEventListenerFactory'
//			16:58:18.950 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'org.springframework.context.annotation.internalAutowiredAnnotationProcessor'
//			16:58:18.951 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'org.springframework.context.annotation.internalCommonAnnotationProcessor'
//			16:58:18.958 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'appConfig'
//			16:58:18.962 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'memberService'
//			16:58:18.973 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'memberRepository'
//			16:58:18.974 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'orderService'
//			16:58:18.977 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'discountPolicy'
//			16:58:18.984 [main] DEBUG org.springframework.core.env.PropertySourcesPropertyResolver - Found key 'spring.liveBeansView.mbeanDomain' in PropertySource 'systemProperties' with value of type String
		//그래서 꺼낼 때는 저 등록된 이름가지고 꺼낸다.
		
		ApplicationContext applicationContext = new AnnotationConfigApplicationContext(AppConfig.class);
		MemberService memberService = applicationContext.getBean("memberService", MemberService.class);
		//기존에 내가 memberServiceImpl을 직접 main에서 생성했다. → MemoryMemberRepository를 생성하고... 순차적으로  
		//이제는 AppConfig가 한다.
		//MemberService memberService = new MemberServiceImpl();
		Member member = new Member(1L, "memberA", Grade.VIP);
		
		//member라는 인스턴스로 memberA를 가입 요청 - HashMap에 put() 
		memberService.join(member);
		
		//findMember라는 객체를 선언하여 1이라는 id를 갖는 Member객체로 반환하게 함 
		Member findMember = memberService.findMember(1L);
		
		//가입요청한 멤버의 이름 
		System.out.println("new member = " + member.getName());
		//저장된 멤버의 이름 
		System.out.println("find Member = " + findMember.getName());
		/*
		new member = memberA
		find Member = memberA
		*/
		//순수 자바로 개발을 해보았음 -> spring 적용 한게 1도없음 
		
	}
}
