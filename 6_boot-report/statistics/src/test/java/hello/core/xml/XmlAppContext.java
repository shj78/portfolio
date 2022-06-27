package hello.core.xml;

import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class XmlAppContext {
	@Test
	void xmlAppContext() {
		//GenericXmlApplicationContext는 ApplicationContext의 부모 
		ApplicationContext ac = new GenericXmlApplicationContext("appConfig.xml");
	}
}
