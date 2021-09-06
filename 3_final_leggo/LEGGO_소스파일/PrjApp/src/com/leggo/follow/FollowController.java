package com.leggo.follow;

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
import com.leggo.profile.IProfileDAO;
import com.leggo.profile.ProfileDTO;

@Controller
public class FollowController
{
	@Autowired
	private SqlSession sqlSession;

	// 팔로워 페이지
	@RequestMapping(value = "/followerpage.action", method = RequestMethod.GET)
	public String FollowerPage(ModelMap model, HttpServletRequest request, HttpSession session)
	{
		// 로그인 세션에서 넘겨준 mem_id 받아오기
		String mem_id = (String) session.getAttribute("mem_id");
		String mem_ing_id = mem_id;
		String mem_ed_id = "";

		IProfileDAO dao = sqlSession.getMapper(IProfileDAO.class);
		IFollowDAO followDAO = sqlSession.getMapper(IFollowDAO.class);

		// dao에 mem_id 넘겨주고 ProfileDTO 받기
		ProfileDTO profile = dao.ProfileSelect(mem_id);

		// 팔로워 목록 조회하기
		List<FollowDTO> followerList = new ArrayList<FollowDTO>();

		int count = 0;

		System.out.println("로그인 아이디: " + mem_id);
		System.out.println("팔로워 여부: " + followDAO.FollowerSelect(mem_id) != null);

		if (followDAO.FollowerSelect(mem_id) != null)
		{
			followerList = followDAO.FollowerSelect(mem_id);

			// 맞팔 여부 확인
			for (FollowDTO dto : followerList)
			{
				mem_ed_id = dto.getFollow_mem_id();
				count = followDAO.followbackCck(mem_ing_id, mem_ed_id);
				dto.setCount(Integer.toString(count));

				System.out.println("mem_ed_id: " + mem_ed_id);
				System.out.println("count: " + dto.getCount());
			}

			model.addAttribute("followerList", followerList);
		}

		// ProfileDTO Profile.jsp로 넘겨주기
		model.addAttribute("profile", profile);

		return "/WEB-INF/views/Follower.jsp";
	}

	// 팔로잉 페이지
	@RequestMapping(value = "/followingpage.action", method = RequestMethod.GET)
	public String FollowingPage(ModelMap model, HttpServletRequest request, HttpSession session)
	{
		// 로그인 세션에서 넘겨준 mem_id 받아오기
		String mem_id = (String) session.getAttribute("mem_id");

		IProfileDAO profileDAO = sqlSession.getMapper(IProfileDAO.class);
		IFollowDAO followDAO = sqlSession.getMapper(IFollowDAO.class);

		// dao에 mem_id 넘겨주고 ProfileDTO 받기
		ProfileDTO profile = profileDAO.ProfileSelect(mem_id);

		// 팔로잉 목록 조회하기
		List<FollowDTO> followingList = new ArrayList<FollowDTO>();
		List<FollowPostDTO> followingpostList = new ArrayList<FollowPostDTO>();

		if (followDAO.FollowingSelect(mem_id) != null)
		{
			followingList = followDAO.FollowingSelect(mem_id);
			model.addAttribute("followingList", followingList);

			for (int i = 0; i < followingList.size(); i++)
			{
				followingpostList.add(followDAO.FollowingPost(followingList.get(i).getFollow_mem_id()));
			}

			model.addAttribute("followingpostList", followingpostList);
		}

		// ProfileDTO Profile.jsp로 넘겨주기
		model.addAttribute("profile", profile);

		return "/WEB-INF/views/Following.jsp";
	}
	
	// 팔로우 / 언팔로우
	@RequestMapping(value = "/follow.action", method = RequestMethod.POST)
	public String Follow(ModelMap model, HttpServletRequest request, HttpSession session)
	{
		String mem_ing_id = (String)session.getAttribute("mem_id");
		String mem_ed_id = request.getParameter("follow_mem_id");
		
		IFollowDAO followDAO = sqlSession.getMapper(IFollowDAO.class);
		
		if (followDAO.followbackCck(mem_ing_id, mem_ed_id) == 0)
			followDAO.Follow(mem_ing_id, mem_ed_id);
		else
			followDAO.Unfollow(mem_ing_id, mem_ed_id);
		
		return "redirect:followerpage.action";
	}
}
