package com.leggo.myscrap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.leggo.mail.MailSend;

@Controller
public class MyScrapController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 스크랩북 페이지
	@RequestMapping(value = "/myscrappage.action", method = RequestMethod.GET)
	public String MyScrapPage()
	{
		return "/WEB-INF/views/MyScrap.jsp";
	}
}
