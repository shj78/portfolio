package com.leggo.interceptor;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.leggo.login.IMemberLoginDAO;
import com.leggo.login.MemberAutoLoginDTO;

public class AutoLoginInterceptor extends HandlerInterceptorAdapter
{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
	{
		IMemberLoginDAO dao = sqlSession.getMapper(IMemberLoginDAO.class);
		
		//--자동로그인 체크할 경우------------------------------------------------
		
		// loginCookie라는 이름의 쿠키 가져오기
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		// 유효기간 비교용 현재 날짜 가져오기
		Date sysdate = new Date();
		
		System.out.println("자동로그인 인터셉터 실행");
		
		// 쿠키가 존재할 경우
		if (loginCookie != null)
		{
			System.out.println("자동로그인된 상태");
			
			// 쿠키의 세션 아이디 가져오기
			String session_id = loginCookie.getValue();

			MemberAutoLoginDTO dto = dao.AutoLoginCck(session_id);
			
			// 쿠키의 세션 아이디와 일치하는 세션 아이디가 DB에 있을 경우
			if (dto != null)
			{
				System.out.println("session_id: "+dto.getSession_id());
				if (session_id.equals(dto.getSession_id()))
				{
					System.out.println(dto.getLimit_time());
					
					// 유효날짜가 오늘보다 이전일 경우 삭제
					if (dto.getLimit_time().before(sysdate))
					{
						dao.AutoLoginDel(session_id);
					}
					else
					{
						System.out.println("AutoLoginMemberId 생성");
			
						HttpSession session = request.getSession();
						String mem_id = (String)session.getAttribute("mem_id");

						// 세션에 값 담아 넘겨줌
						session.setAttribute("AutoLoginMemberId", dto.getMem_id());
						
						response.sendRedirect("profilepageauto.action");
						
						return false;
					}
				}	
			}
		}
		//--자동로그인 체크할 경우------------------------------------------------
		
		
		//--로그인 유지-----------------------------------------------------------

		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		
		if (mem_id != null)
		{
			System.out.println("로그인된 상태");

			// 프로필 사진 받아오기
			String mem_img = dao.getMemImg(mem_id);
			session.setAttribute("mem_img", mem_img);
			System.out.println("mem_img: "+mem_img);
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			String element = "<script>location.href=\"profilepageauto.action?alert_message=이미 로그인된 상태입니다.\";</script>";
			out.println(element);
			out.flush();
			out.close();
			
			return false;
		}
		
		//--로그인 유지-----------------------------------------------------------
		
		System.out.println("자동로그인 인터셉터 통과");
		
		return true;
	}
}
