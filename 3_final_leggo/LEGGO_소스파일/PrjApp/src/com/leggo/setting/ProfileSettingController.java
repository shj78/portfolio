package com.leggo.setting;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.leggo.login.IMemberLoginDAO;
import com.leggo.login.MemberLoginDTO;
import com.leggo.mail.MailSend;
import com.leggo.profile.IProfileDAO;
import com.leggo.profile.ProfileDTO;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



@Controller
public class ProfileSettingController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 프로필 설정 페이지
	@RequestMapping(value = "/profilesettingpage.action", method = RequestMethod.GET)
	public String ProfileSettingPage( ModelMap model, HttpSession session)
	{
		IProfileDAO dao = sqlSession.getMapper(IProfileDAO.class);
		String mem_id = (String)session.getAttribute("mem_id");
		
		ProfileDTO profile = dao.ProfileSetting(mem_id);
		
		model.addAttribute("profile", profile);
		
		return "/WEB-INF/views/ProfileSetting.jsp";
	}
	
	// 프로필 수정-프로필 사진
	@RequestMapping(value = "/profilesettingimg.action", method = RequestMethod.POST)
	public String ProfileSetting(HttpServletRequest request, HttpServletResponse response, ModelMap model, ProfileDTO dto, HttpSession session)
	{
		return "/WEB-INF/views/ProfileSettingImg.jsp";
	}
	
	// 프로필 수정
	@RequestMapping(value = "/profilesetting.action", method = RequestMethod.POST)
	public String ProfileSetting2(HttpServletRequest request, HttpServletResponse response, ModelMap model, ProfileDTO dto, HttpSession session)
	{
		IProfileDAO dao = sqlSession.getMapper(IProfileDAO.class);
		
		String mem_id = (String)session.getAttribute("mem_id");
		
		dto.setMem_id(mem_id);
		
		String mem_nnm = request.getParameter("mem_nnm");
		String mem_intro = request.getParameter("mem_intro");
		String mem_img = request.getParameter("mem_img");
		
		if (mem_img != null)
		{
			dto.setMem_img(mem_img);
			System.out.println("프로필 사진 변경 완료");
			dao.ProfileSettingImg(dto);
		}
		
		if (mem_nnm != null)
		{
			dto.setMem_nnm(mem_nnm);
			int count = dao.MemNnmCck(dto);
			
			System.out.println("별명 중복 여부: "+count);
			
			if (count == 0)
			{
				dao.ProfileSettingNnm(dto);
				System.out.println("별명 수정 완료");
			}
			else
			{
				model.addAttribute("alert_message","이미 존재하는 별명입니다.");
				
				return "redirect:profilesettingpage.action";
			}
		}
		
		if (mem_intro != null)
		{
			dto.setMem_intro(mem_intro);
			dao.ProfileSettingIntro(dto);
			System.out.println("자기소개 수정 완료");
		}
		
		model.addAttribute("success_message", "프로필이 수정되었습니다.");
			
		return "redirect:profilepageauto.action";
	}
}
