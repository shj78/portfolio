package com.leggo.mycomment;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.leggo.mail.MailSend;

@Controller
public class MyCommentController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 내 댓글 페이지
	@RequestMapping(value = "/mycommentpage.action", method = RequestMethod.GET)
	public String MyCommentPage()
	{
		return "/WEB-INF/views/MyComment.jsp";
	}
}
