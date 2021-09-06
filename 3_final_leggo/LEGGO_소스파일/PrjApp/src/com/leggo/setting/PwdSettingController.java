package com.leggo.setting;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.leggo.mail.MailSend;

@Controller
public class PwdSettingController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 비밀번호 설정 페이지
	@RequestMapping(value = "/pwdsettingpage.action", method = RequestMethod.GET)
	public String FollowingPage()
	{
		return "/WEB-INF/views/PwdSetting.jsp";
	}
}
