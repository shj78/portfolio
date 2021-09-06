/*===========================
   ComTripController.java
===========================*/

package com.leggo.comtrip;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ComTripController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 여행기 피드 페이지
	@RequestMapping(value="comtripfeed.action",method=RequestMethod.GET)
	public String comtripfeed(ModelMap model, HttpServletRequest request)
	{
		String result = null;
		
		IComTripDAO dao = sqlSession.getMapper(IComTripDAO.class);
		
		model.addAttribute("list", dao.list());
		
		result = "/WEB-INF/views/ComTripFeed.jsp";
		
		return result;
	}
	
	// 여행기 게시글 조회 페이지
	@RequestMapping(value="comtrip.action",method=RequestMethod.GET)
	public String comtrip(ModelMap model, HttpServletRequest request)
	{
		
		String result = null;
		
		IComTripDAO dao =  sqlSession.getMapper(IComTripDAO.class);
		
		model.addAttribute("list", dao.list());
		
		result = "/WEB-INF/views/ComTrip.jsp";
		
		return result;
	}
}
