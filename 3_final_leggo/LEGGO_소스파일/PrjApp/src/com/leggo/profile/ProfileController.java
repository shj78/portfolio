package com.leggo.profile;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.leggo.login.IMemberLoginDAO;
import com.leggo.login.MemberLoginDTO;
import com.leggo.myphoto.IMyPhotoDAO;
import com.leggo.myphoto.MyPhotoDTO;
import com.leggo.myplan.IMyPlanDAO;
import com.leggo.myplan.MyPlanDTO;
import com.leggo.mytrip.IMyTripDAO;
import com.leggo.mytrip.MyTripDTO;

@Controller
public class ProfileController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 프로필 페이지
	@RequestMapping(value = "/profilepage.action", method = RequestMethod.POST)
	public String ProfileSelect(ModelMap model, HttpServletRequest request, HttpSession session)
	{
		// 로그인 세션에서 넘겨준 mem_id 받아오기
		String mem_id = (String)session.getAttribute("mem_id");
		
		IProfileDAO dao = sqlSession.getMapper(IProfileDAO.class);
		
		// dao에 mem_id 넘겨주고 ProfileDTO 받기
		ProfileDTO profile = dao.ProfileSelect(mem_id);
		
		// ProfileDTO Profile.jsp로 넘겨주기
		model.addAttribute("profile", profile);
		
		return "/WEB-INF/views/Profile.jsp";
	}
	
	// 프로필 페이지(자동로그인)
	@RequestMapping(value = "/profilepageauto.action", method = RequestMethod.GET)
	public String ProfileSelectAuto(ModelMap model, HttpServletRequest request, HttpSession session)
	{
		// 로그인 세션에서 넘겨준 mem_id 받아오기
		String mem_id = (String)session.getAttribute("mem_id");
		
		ProfileDTO profile = null;
		List<MyPlanDTO> myplanlist = null;
		List<MyTripDTO> mytriplist = null;
		List<MyPhotoDTO> myphotolist = null;
		
		IProfileDAO dao = sqlSession.getMapper(IProfileDAO.class);
		IMyPlanDAO MyPlandao = sqlSession.getMapper(IMyPlanDAO.class);
		IMyTripDAO MyTripdao = sqlSession.getMapper(IMyTripDAO.class);
		IMyPhotoDAO MyPhotodao = sqlSession.getMapper(IMyPhotoDAO.class);
		
		// dao에 mem_id 넘겨주고 ProfileDTO 받기
		if (mem_id != null)
		{
			// 프로필 정보
			profile = dao.ProfileSelect(mem_id);
			
			// 작성한 일정 목록
			myplanlist = new ArrayList<MyPlanDTO>();
			myplanlist.add(MyPlandao.MyPlanSelect(mem_id));
			
			// 작성한 여행기 목록
			mytriplist = new ArrayList<MyTripDTO>();
			mytriplist.add(MyTripdao.MyTripSelect(mem_id));
			
			// 작성한 사진 목록
			myphotolist = new ArrayList<MyPhotoDTO>();
			myphotolist.add(MyPhotodao.MyPhotoSelect(mem_id));
		}
		
		model.addAttribute("profile", profile);
		model.addAttribute("myplanlist",myplanlist);
		model.addAttribute("mytriplist",mytriplist);
		model.addAttribute("myphotolist",myphotolist);
		
		return "/WEB-INF/views/Profile.jsp";
	}
	
	// 프로필 페이지(카카오 로그인)
	@RequestMapping(value = "/profilepagekakao.action", method = RequestMethod.GET)
	public String ProfileSelectKakao(ModelMap model, HttpServletRequest request, HttpSession session)
	{
		// 로그인 세션에서 넘겨준 kakao_id 받아오기
		String kakao_id = request.getParameter("kakao_id");
		
		// 액세스 토큰 받아오기
		String kakao_access_token = request.getParameter("kakao_access_token");
		
		ProfileDTO profile = null;
		IProfileDAO dao = sqlSession.getMapper(IProfileDAO.class);
		
		// dao에 kakao_id 넘겨주고 ProfileDTO 받기
		if (kakao_id != null)
		{
			profile = dao.ProfileSelect(kakao_id);
		}
		
		// 세션에 넣기
		session.setAttribute("mem_id", profile.getMem_id());
		session.setAttribute("access_token", profile.getMem_id());
		
		// ProfileDTO Profile.jsp로 넘겨주기
		model.addAttribute("profile", profile);
		
		return "/WEB-INF/views/Profile.jsp";
	}
}
