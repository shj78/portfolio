package com.leggo.myphoto;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPhotoController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 내 사진 페이지
	@RequestMapping(value = "/myphotopage.action", method = RequestMethod.GET)
	public String MyPhotoPage(ModelMap model, HttpServletRequest request, HttpSession session)
	{
		String mem_id = (String)session.getAttribute("mem_id");
		
		IMyPhotoDAO dao = sqlSession.getMapper(IMyPhotoDAO.class);
		
		List<MyPhotoDTO> myphotolist = null;
		
		if (dao.MyPhotoSelect(mem_id) != null)
		{
			myphotolist = new ArrayList<MyPhotoDTO>();
			myphotolist.add(dao.MyPhotoSelect(mem_id));			
		}
		
		model.addAttribute("myphotolist", myphotolist);
		
		return "/WEB-INF/views/MyPhoto.jsp";
	}
}
