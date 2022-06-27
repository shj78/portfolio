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
		
		//���������� ������ 3-----------������ �ϰ� �����ϸ� ������ �޸� �αװ� ������! 
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
		//�׷��� ���� ���� �� ��ϵ� �̸������� ������.
		
		ApplicationContext applicationContext = new AnnotationConfigApplicationContext(AppConfig.class);
		MemberService memberService = applicationContext.getBean("memberService", MemberService.class);
		//������ ���� memberServiceImpl�� ���� main���� �����ߴ�. �� MemoryMemberRepository�� �����ϰ�... ����������  
		//������ AppConfig�� �Ѵ�.
		//MemberService memberService = new MemberServiceImpl();
		Member member = new Member(1L, "memberA", Grade.VIP);
		
		//member��� �ν��Ͻ��� memberA�� ���� ��û - HashMap�� put() 
		memberService.join(member);
		
		//findMember��� ��ü�� �����Ͽ� 1�̶�� id�� ���� Member��ü�� ��ȯ�ϰ� �� 
		Member findMember = memberService.findMember(1L);
		
		//���Կ�û�� ����� �̸� 
		System.out.println("new member = " + member.getName());
		//����� ����� �̸� 
		System.out.println("find Member = " + findMember.getName());
		/*
		new member = memberA
		find Member = memberA
		*/
		//���� �ڹٷ� ������ �غ����� -> spring ���� �Ѱ� 1������ 
		
	}
}
