/*===========================
   MainHomeController.java
===========================*/

package com.leggo.main;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainHomeController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 메인홈 페이지
	@RequestMapping(value="mainhome.action",method=RequestMethod.GET)
	public String comtripfeed(ModelMap model, HttpServletRequest request)
	{
		
		String result = "/WEB-INF/views/MainHome.jsp";
		
		return result;
	}

}
