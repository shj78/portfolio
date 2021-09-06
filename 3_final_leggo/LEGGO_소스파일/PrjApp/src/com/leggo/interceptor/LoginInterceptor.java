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
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.leggo.login.IMemberLoginDAO;
import com.leggo.login.MemberAutoLoginDTO;

public class LoginInterceptor extends HandlerInterceptorAdapter
{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
	{
		System.out.println("로그인 인터셉터 실행");
		
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		
		// session에 mem_id가 없을 경우(로그인된 상태가 아닐 경우) 로그인 페이지로 보내기
		if (mem_id == null)
		{
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			String element = "<script>location.href='loginpage.action';</script>";
			out.println(element);
			out.flush();  	//--브라우저 출력 비우기
			out.close();	//--아웃객체 닫기
			
			return false;
		}
		else
		{
			IMemberLoginDAO dao = sqlSession.getMapper(IMemberLoginDAO.class);
			//String SigninAuth = dao.SigninAuthCck(mem_id);

			// 프로필 사진 받아오기
			String mem_img = dao.getMemImg(mem_id);
			session.setAttribute("mem_img", mem_img);
			System.out.println("mem_img: "+mem_img);
			
			/*
			// 입력한 아이디가 회원가입 인증이 되지 않았을 경우 → 아직 로그인 불가능
			if (SigninAuth.equals("필요"))
			{
				System.out.println("회원가입 인증 필요");
				
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				String element = "<script>location.href=\"loginpage.action?error_message=이메일 인증이 완료되지 않았습니다.\";</script>";
				out.println(element);
				out.flush();
				out.close();
				
				return false;
			}
			*/

			System.out.println("로그인 인터셉터 통과");
			
			return true;
		}
	}
}
