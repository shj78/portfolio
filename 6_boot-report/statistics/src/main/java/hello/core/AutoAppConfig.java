package hello.core;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;

@Configuration //��������, ����
//������Ʈ ��ĵ�� �̷���  ComponentScan�� ���ָ� �ǰ�... �ڵ����� Configuration�� ���� �ֵ��� bean���� ����ϱ� ������ Configuration �����ֵ��� exclude���־�� �Ѵ�.
//�Ϲ������� excludeFilters�� ������ �ʴ´�. ������ ���� AppConfig �� bean�� ������.. �ٵ� ���� ������ �����Ϸ��� �� ������� �Ѵ�.
@ComponentScan(
		basePackages = "hello.core",
		//�浹����! 
		excludeFilters = @ComponentScan.Filter(type=FilterType.ANNOTATION, classes = Configuration.class)
) 
public class AutoAppConfig {}
