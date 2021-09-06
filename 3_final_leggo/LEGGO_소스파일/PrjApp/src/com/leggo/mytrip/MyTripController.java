package com.leggo.mytrip;

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
import com.leggo.myphoto.MyPhotoDTO;
import com.leggo.profile.IProfileDAO;
import com.leggo.profile.ProfileDTO;

@Controller
public class MyTripController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 내 여행기 페이지
	@RequestMapping(value = "/mytrippage.action", method = RequestMethod.GET)
	public String MyTripPage(ModelMap model, HttpServletRequest request, HttpSession session)
	{
		// 로그인 세션에서 넘겨준 mem_id 받아오기
		String mem_id = (String)session.getAttribute("mem_id");
		
		IMyTripDAO dao = sqlSession.getMapper(IMyTripDAO.class);
		
		// dao에 mem_id 넘겨주고 MyTripDTO 받기
		List<MyTripDTO> mytriplist = null;
		
		if (dao.MyTripSelect(mem_id) != null)
		{
			mytriplist = new ArrayList<MyTripDTO>();
			mytriplist.add(dao.MyTripSelect(mem_id));			
		}
		
		// MyTripDTO MyTrip.jsp로 넘겨주기
		model.addAttribute("mytriplist", mytriplist);
		
		return "/WEB-INF/views/MyTrip.jsp";
	}
}
