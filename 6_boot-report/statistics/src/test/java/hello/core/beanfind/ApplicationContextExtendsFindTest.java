//package hello.core.beanfind;
//
//import static org.assertj.core.api.Assertions.assertThat;
//import static org.junit.jupiter.api.Assertions.assertThrows;
//
//import org.junit.jupiter.api.DisplayName;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.NoUniqueBeanDefinitionException;
//import org.springframework.context.annotation.AnnotationConfigApplicationContext;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//import com.sun.javafx.collections.MappingChange.Map;
//
//import hello.core.beanfind.ApplicationContextBeasicFindTest.SameBeanConfig;
//import hello.core.discount.DiscountPolicy;
//import hello.core.discount.FixDiscountPolicy;
//import hello.core.discount.RateDiscountPolicy;
//
//public class ApplicationContextExtendsFindTest {
//	
//	AnnotationConfigApplicationContext ac = new AnnotationConfigApplicationContext(SameBeanConfig.class);
//
//	@Test
//	@DisplayName("�θ� Ÿ������ ��ȸ��, �ڽ��� �� �̻� ������ �ߺ������� �߻��Ѵ�.")
//	void findBeanByParentTypeDuplicate() {
//		assertThrows(NoUniqueBeanDefinitionException.class,
//				() -> ac.getBean(DiscountPolicy.class));
//	}
//	
//	@Test
//	@DisplayName("�θ� Ÿ������ ��ȸ��, �ڽ��� �� �̻� ������ �� �̸��� �����ϸ� �ȴ�.")
//	void findBeanByParentTypeBeanName() {
//		DiscountPolicy rateDiscountPolicy = ac.getBean("rateDiscountPolicy", DiscountPolicy.class);
//		assertThat(rateDiscountPolicy).isInstanceOf(RateDiscountPolicy.class);
//	}
//	
//	@Test
//	@DisplayName("�θ�Ÿ������ ��ȸ�ϱ�")
//	void findAllBeanByParentType() {
//		Map<String, DiscountPolicy> beansOfType = (Map<String, DiscountPolicy>) ac.getBeansOfType(DiscountPolicy.class);
//		assertThat(((java.util.Map<String, DiscountPolicy>) beansOfType).size()).isEqualTo(2);
//		for (String key : ((java.util.Map<String, DiscountPolicy>) beansOfType).keySet()) {
//			System.out.println("key = "+ key + " value = " + ((java.util.Map<String, DiscountPolicy>) beansOfType).get(key));
//		}
//	}
//	
//	
//	
//	@Configuration
//	static class TestConfig {
//		@Bean
//		public DiscountPolicy rateDiscountPolicy() {
//			return new RateDiscountPolicy();
//		}
//		
//		@Bean 
//		public DiscountPolicy fixDiscountPolicy () {
//			return new FixDiscountPolicy();
//		}
//	}
//}
