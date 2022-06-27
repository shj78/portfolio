package hello.core.beanfind;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.NoUniqueBeanDefinitionException;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.sun.javafx.collections.MappingChange.Map;

import hello.core.member.MemberRepository;
import hello.core.member.MemoryMemberRepository;

public class ApplicationContextBasicFindTest {
	AnnotationConfigApplicationContext ac = new AnnotationConfigApplicationContext(SameBeanConfig.class);

	@Test
	@DisplayName("Ÿ������ ��ȸ�� ���� Ÿ���� �� �̻� ������, �ߺ� ������ �߻��Ѵ�.")
	void findBeanByTypeDuplicate() {
		MemberRepository bean = ac.getBean(MemberRepository.class);
		assertThrows(NoUniqueBeanDefinitionException.class,
				() -> ac.getBean(MemberRepository.class));
	}
	
	@Test
	@DisplayName("Ÿ������ ��ȸ�� ���� Ÿ���� �� �̻� ������, �� �̸��� �����ϸ� �ȴ�.")
	void findBeanByName () {
		MemberRepository memberRepository = ac.getBean("memberRepository1", MemberRepository.class);
		assertThat(memberRepository).isInstanceOf(MemberRepository.class);
	}
	
	@Test
	@DisplayName("Ư��Ÿ���� ��� ��ȸ�ϱ�")
	void findAllBeanByType() {
		Map<String, MemberRepository> beansOfType =(Map<String, MemberRepository>) ac.getBeansOfType(MemberRepository.class);
		for(String key : ((java.util.Map<String, MemberRepository>) beansOfType).keySet()) {
			System.out.println("key = " + key + " value = " + ((java.util.Map<String, MemberRepository>) beansOfType).get(key));
		}
		System.out.println("beansOfType = "  +beansOfType);
		assertThat(((java.util.Map<String, MemberRepository>) beansOfType).size()).isEqualTo(2);
	}
	
	
	
	@Configuration
	static class SameBeanConfig {//��øŬ���� - static : �������� �� �ȿ����� �ϰڴ�.
		@Bean
		public MemberRepository memberRepository1 () {
			return new MemoryMemberRepository();
		}

		@Bean
		public MemberRepository memberRepository2 () {
			return new MemoryMemberRepository();
		}

	}
	
	
	
	
}
