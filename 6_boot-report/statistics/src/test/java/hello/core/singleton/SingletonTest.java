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
	@DisplayName("스프링 없는 순수한 DI 컨테이너")
	void pureContainer() {
		AppConfig appConfig = new AppConfig();
		//1.조회 : 호출할 때 마다 객체 생성
		MemberService memberService1 = appConfig.memberService();
		//2.조회 : 호출할 때 마다 객체 생성
		MemberService memberService2 = appConfig.memberService();
		//JVM에 새로운 객체가 생성된다.
		
		//참조값이 다른 것을 확인
		System.out.println("memberService1 = " + memberService1);
		System.out.println("memberService2 = " + memberService2);
		
		//검증 - 테스트는 자동화되게 만들어야합니다.
		Assertions.assertThat(memberService1).isNotSameAs(memberService2);
		//테스트 성공 
	}
	
	@Test
	@DisplayName("싱글톤패턴을 적용한 객체 사용")
	void singletonServiceTest() {
		//private이라 생성불가! 
		//SingletonService singletonService1 = new SingletonService();
		
		SingletonService singletonService1 = SingletonService.getInstance();
		SingletonService singletonService2 = SingletonService.getInstance();
		
		assertThat(singletonService1).isSameAs(singletonService2);
		//same == 
		//equal 
		//인스턴스 비교이기 때문에 SameAs 
	}
	
	//통과했죠 이렇게 녹색불 볼 때마다 기분이 좋습니다...
	
	@Test
	@DisplayName("스프링컨테이너와 싱글톤")
	void springContainer() {
//		AppConfig appConfig = new AppConfig();
		ApplicationContext ac = new AnnotationConfigApplicationContext(AppConfig.class);
		//MemberService memberService1 = appConfig.memberService();
		MemberService memberService1 = ac.getBean("memberService", MemberService.class);
		MemberService memberService2 = ac.getBean("memberService", MemberService.class);
		
		//참조값이 다른 것을 확인
		System.out.println("memberService1 = " + memberService1);
		System.out.println("memberService2 = " + memberService2);
		
		//검증 
		Assertions.assertThat(memberService1).isSameAs(memberService2);
		//스프링 컨테이너 덕분에 고객 요청마다 객체 생성이 아닌 이미 만들어진 객체를 공유해서 효율적으로 재사용 
		 		
	}

}
