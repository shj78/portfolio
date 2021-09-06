package com.leggo.myplan;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.leggo.mail.MailSend;
import com.leggo.mytrip.IMyTripDAO;
import com.leggo.mytrip.MyTripDTO;

@Controller
public class MyPlanController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 내 일정 페이지
	@RequestMapping(value = "/myplanpage.action", method = RequestMethod.GET)
	public String MyPlanPage(ModelMap model, HttpServletRequest request, HttpSession session)
	{
		// 로그인 세션에서 넘겨준 mem_id 받아오기
		String mem_id = (String)session.getAttribute("mem_id");
		
		IMyPlanDAO dao = sqlSession.getMapper(IMyPlanDAO.class);
		
		// dao에 mem_id 넘겨주고 MyPlanDTO 받기
		List<MyPlanDTO> myplanlist = null;
		
		if (dao.MyPlanSelect(mem_id) != null)
		{
			myplanlist = new ArrayList<MyPlanDTO>();
			myplanlist.add(dao.MyPlanSelect(mem_id));			
		}
		
		// MyTripDTO MyTrip.jsp로 넘겨주기
		model.addAttribute("myplanlist", myplanlist);
		
		return "/WEB-INF/views/MyPlan.jsp";
	}
}
