package hello.core;

import org.springframework.core.SpringVersion;

public class Ver {
	public static void main(String[] args) {
		String version = SpringVersion.getVersion();
		System.out.println("version : "+ version);//version : 5.3.13
	}
}
