package com.leggo.quit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QuitController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 탈퇴 페이지
	@RequestMapping(value = "/quitpage.action", method = RequestMethod.GET)
	public String MemberQuitPage()
	{
		return "/WEB-INF/views/Quit.jsp";
	}
	
	// 회원 탈퇴
	@RequestMapping(value = "/quit.action", method = RequestMethod.GET)
	public String MemberQuit(ModelMap model, HttpServletRequest request, HttpSession session)
	{
		String mem_id = (String)session.getAttribute("mem_id");
		
		IMemberQuitDAO dao = sqlSession.getMapper(IMemberQuitDAO.class);
		
		dao.InsertQuitMember(mem_id);
		dao.DeleteQuitMember(mem_id);
		
		model.addAttribute("success_message", "탈퇴가 완료되었습니다.");
		
		return "/WEB-INF/views/Login.jsp";
	}
}
