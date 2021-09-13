/*=============================
 *
 * 		HelloController.java
 * 
==============================*/

package com.test.mvc;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HelloController  
{

	@RequestMapping("/hello.do")
	public String firstday(Model model)
	{
		String str = "Hello World! Hello Spring!";
		
		model.addAttribute("str", str);
		
		return "/WEB-INF/views/Hello.jsp";
		
	}
	


}
