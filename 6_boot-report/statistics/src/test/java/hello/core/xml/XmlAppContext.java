package hello.core.xml;

import org.junit.jupiter.api.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class XmlAppContext {
	@Test
	void xmlAppContext() {
		//GenericXmlApplicationContext�� ApplicationContext�� �θ� 
		ApplicationContext ac = new GenericXmlApplicationContext("appConfig.xml");
	}
}
