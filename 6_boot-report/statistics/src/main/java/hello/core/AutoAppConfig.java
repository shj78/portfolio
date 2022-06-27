package hello.core;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;

@Configuration //설정정보, 구성
//컴포넌트 스캔은 이렇게  ComponentScan을 해주면 되고... 자동으로 Configuration이 붙은 애들을 bean으로 등록하기 때문에 Configuration 붙은애들은 exclude해주어야 한다.
//일반적으로 excludeFilters를 하지는 않는다. 일일이 만든 AppConfig 의 bean을 지우지.. 근데 기존 예제를 유지하려고 이 방식으로 한다.
@ComponentScan(
		basePackages = "hello.core",
		//충돌방지! 
		excludeFilters = @ComponentScan.Filter(type=FilterType.ANNOTATION, classes = Configuration.class)
) 
public class AutoAppConfig {}
