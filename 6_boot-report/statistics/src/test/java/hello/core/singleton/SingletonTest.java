package hello.core.singleton;

import static org.assertj.core.api.Assertions.assertThat;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import hello.core.AppConfig;
import hello.core.member.MemberService;

public class SingletonTest {
	
	@Test
	@DisplayName("������ ���� ������ DI �����̳�")
	void pureContainer() {
		AppConfig appConfig = new AppConfig();
		//1.��ȸ : ȣ���� �� ���� ��ü ����
		MemberService memberService1 = appConfig.memberService();
		//2.��ȸ : ȣ���� �� ���� ��ü ����
		MemberService memberService2 = appConfig.memberService();
		//JVM�� ���ο� ��ü�� �����ȴ�.
		
		//�������� �ٸ� ���� Ȯ��
		System.out.println("memberService1 = " + memberService1);
		System.out.println("memberService2 = " + memberService2);
		
		//���� - �׽�Ʈ�� �ڵ�ȭ�ǰ� �������մϴ�.
		Assertions.assertThat(memberService1).isNotSameAs(memberService2);
		//�׽�Ʈ ���� 
	}
	
	@Test
	@DisplayName("�̱��������� ������ ��ü ���")
	void singletonServiceTest() {
		//private�̶� �����Ұ�! 
		//SingletonService singletonService1 = new SingletonService();
		
		SingletonService singletonService1 = SingletonService.getInstance();
		SingletonService singletonService2 = SingletonService.getInstance();
		
		assertThat(singletonService1).isSameAs(singletonService2);
		//same == 
		//equal 
		//�ν��Ͻ� ���̱� ������ SameAs 
	}
	
	//������� �̷��� ����� �� ������ ����� �����ϴ�...
	
	@Test
	@DisplayName("�����������̳ʿ� �̱���")
	void springContainer() {
//		AppConfig appConfig = new AppConfig();
		ApplicationContext ac = new AnnotationConfigApplicationContext(AppConfig.class);
		//MemberService memberService1 = appConfig.memberService();
		MemberService memberService1 = ac.getBean("memberService", MemberService.class);
		MemberService memberService2 = ac.getBean("memberService", MemberService.class);
		
		//�������� �ٸ� ���� Ȯ��
		System.out.println("memberService1 = " + memberService1);
		System.out.println("memberService2 = " + memberService2);
		
		//���� 
		Assertions.assertThat(memberService1).isSameAs(memberService2);
		//������ �����̳� ���п� �� ��û���� ��ü ������ �ƴ� �̹� ������� ��ü�� �����ؼ� ȿ�������� ���� 
		 		
	}

}
