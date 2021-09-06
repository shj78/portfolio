package com.leggo.login;

import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.CookieGenerator;
import org.springframework.web.util.WebUtils;

@Controller
public class MemberLoginController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 로그인 페이지
	@RequestMapping(value = "/loginpage.action", method = RequestMethod.GET)
	public String LoginPage(HttpServletRequest request)
	{
		// 자동로그인 세션 보유 여부 확인
		HttpSession session = request.getSession();
		String AutologinMemberId = (String)session.getAttribute("AutologinMemberId");
		
		// 이메일 인증 체크
		//String SigninAuth = request.getParameter("success_message");
		String mem_id = request.getParameter("mem_id");
		
		// 이메일 인증 완료
		/*
		if (SigninAuth != null && mem_id != null)
		{
			IMemberLoginDAO dao = sqlSession.getMapper(IMemberLoginDAO.class);
			
			// DB에서 회원가입 인증여부 '완료'로 업데이트
			dao.SigninAuthUpdate(mem_id);
		}
		*/
		
		if (AutologinMemberId != null)
		{
			session.setAttribute("mem_id", AutologinMemberId);
			
			return "profilepage.action";
		}
		else
			return "/WEB-INF/views/Login.jsp";
	}
	
	// 로그인 처리
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String Login(HttpServletRequest request, HttpServletResponse response, ModelMap model, MemberLoginDTO Logindto, MemberAutoLoginDTO Autodto)
	{
		HttpSession session = request.getSession();
		String result = null;
		
		IMemberLoginDAO dao = sqlSession.getMapper(IMemberLoginDAO.class);
	    
		// DB에서 회원 상태를 받아옴
		String MemAcctCck = dao.MemAcctCck(Logindto.getMem_id());
		
		// DB에서 회원가입 이메일 인증여부를 받아옴
		//String SigninAuthCck = dao.SigninAuthCck(Logindto.getMem_id());
		
		try
		{
			if (MemAcctCck.equals("정상"))
			{
				MemberLoginDTO login = dao.Login(Logindto);
					
				// 정상 로그인
				if (login != null)
				{
					// 이메일 인증이 완료되지 않았을 경우
					if (MemAcctCck.equals("미완료"))	//--SigninAuthCck.equals("미완료")
					{
						String alert_message = "이메일 인증이 완료되지 않았습니다.";
						
						// alert_message 인코딩
						String encodedParam = URLEncoder.encode(alert_message, "UTF-8");
						result = "redirect:loginpage.action?alert_message="+encodedParam;
					}
					else
					{
						// 프로필 사진 받아오기
						String mem_img = dao.getMemImg(login.getMem_id());
						
						// 세션에 저장
						session.setAttribute("mem_id", login.getMem_id());
						session.setAttribute("mem_img", mem_img);
						
						// 자동 로그인 체크 안 했을 경우
						if (Logindto.getLogin_cck() == null)
						{
							// 일반 회원일 경우
							if (login.getAdmin_cd() == null)
								result = "redirect:profilepageauto.action";
							// 관리자일 경우
							else
								result = "redirect:admin.action";
						}
						// 자동 로그인 체크했을 경우
						else if(Logindto.getLogin_cck().equals("on"))
						{
							System.out.println("로그인 컨트롤러 2");
							// 로그인 세션을 쿠키에 저장
							Cookie loginCookie = new Cookie("loginCookie", session.getId());
							System.out.println("세션 아이디: "+session.getId());
							
							// 기본 uri 경로 페이지로 저장
							loginCookie.setPath("/*.action");
							
							// 3개월 동안 저장
							long limitTime = 60 * 60 * 24 * 90;
							loginCookie.setMaxAge((int)limitTime);
							
							// 현재시간 + limit_time(밀리초 단위로 변환)
							long expireDate = System.currentTimeMillis()+(limitTime*1000);
							
							// 저장 시간 일 단위로 변환
							Date limitDate = new Date(expireDate);
							
							Autodto.setLimit_date(limitDate);
							Autodto.setSession_id(session.getId());
							Autodto.setMem_id(login.getMem_id());
							
							System.out.println(Autodto.getMem_id());
							System.out.println(Autodto.getSession_id());
							System.out.println(Autodto.getLimit_time());
							
							// 자동로그인 세션 정보 DB에 저장
							dao.AutoLoginUpdate(Autodto);
							
							CookieGenerator cg = new CookieGenerator();

							cg.setCookieName("loginCookie");
							cg.addCookie(response, loginCookie.getValue());
							
							result = "redirect:profilepage.action";
						}
					}
				}
				// 아이디는 있는데 로그인 실패할 경우
				else
				{	
					model.addAttribute("alert_message", "비밀번호를 잘못 입력하셨습니다.");
					
					result = "redirect:loginpage.action";
				}
			}
			else if (MemAcctCck.equals("차단"))
			{
				model.addAttribute("error_message", "차단된 계정으로는 로그인하실 수 없습니다.");
				
				result = "redirect:loginpage.action";
			}
		}
		catch (Exception e)	// NullPointerException
		{
			model.addAttribute("error_message", "가입되지 않은 계정이거나 이미 탈퇴한 계정입니다.");
			
			result = "redirect:loginpage.action";
		}
		
		return result;
	}
	

	// 카카오 로그인 처리
	@RequestMapping(value = "/loginkakao.action", method = RequestMethod.GET)
	public String LoginKakao(HttpServletRequest request, HttpServletResponse response, ModelMap model, MemberLoginDTO Logindto, MemberAutoLoginDTO Autodto)
	{
		HttpSession session = request.getSession();
		String result = null;
		
		IMemberLoginDAO dao = sqlSession.getMapper(IMemberLoginDAO.class);
		
		System.out.println("카카오 아이디: "+Logindto.getKakao_id());
	    
		// DB에서 회원 상태를 받아옴
		String MemAcctCck = dao.MemAcctCck(Logindto.getKakao_id());
		
		// DB에서 회원가입 이메일 인증여부를 받아옴
		//String SigninAuthCck = dao.SigninAuthCck(Logindto.getMem_id());
		
		try
		{
			if (MemAcctCck.equals("정상"))
			{
				System.out.println("MemAcctCck 정상");
				MemberLoginDTO login = dao.KakaoLogin(Logindto);
					
				// 정상 로그인
				if (login != null)
				{
					System.out.println("로그인 정상");
					
					// 프로필 사진 받아오기
					String mem_img = dao.getMemImg(login.getMem_id());
					
					System.out.println("프로필 사진: "+mem_img);
					
					// 세션에 저장
					session.setAttribute("mem_id", login.getMem_id());
					session.setAttribute("mem_img", mem_img);
					
					result = "redirect:profilepageauto.action";		
				}
			}
			else if (MemAcctCck.equals("차단"))
			{
				model.addAttribute("error_message", "차단된 계정으로는 로그인하실 수 없습니다.");
				
				result = "redirect:loginpage.action";
			}
		}
		catch (Exception e)	// NullPointerException
		{
			model.addAttribute("error_message", "가입되지 않은 계정이거나 이미 탈퇴한 계정입니다.");
			
			result = "redirect:loginpage.action";
		}
		
		return result;
	}
	
	// 로그아웃
	@RequestMapping(value = "/logout.action", method = RequestMethod.GET)
	public String Logout(HttpServletRequest request, HttpServletResponse response, ModelMap model, HttpSession session)
	{
		System.out.println("로그아웃 실행");
		
		// loginCookie라는 이름의 쿠키 가져오기
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		// 쿠키가 존재할 경우
		if (loginCookie != null)
		{
			IMemberLoginDAO dao = sqlSession.getMapper(IMemberLoginDAO.class);
			
			// 쿠키 유효시간 초기화 후 로컬 전송 → 0초 지나 자동 삭제
			loginCookie.setMaxAge(0);
			
			CookieGenerator cg = new CookieGenerator();

			cg.setCookieName("loginCookie");
			cg.addCookie(response, null);
			
			// DB에서 자동로그인 세션 삭제
			dao.AutoLoginDel(loginCookie.getValue());
			
			System.out.println("로그인 쿠키 제거");
		}
		
		// 카카오 쿠키 제거
		CookieGenerator cg = new CookieGenerator();
		cg.setCookieName("TIARA");
		cg.addCookie(response, null);
		
		System.out.println("액세스 토큰: "+(String)session.getAttribute("access_token"));
		
		session.invalidate();
        
        model.addAttribute("success_message", "로그아웃되었습니다.");
        
        // 메인페이지로 이어져야 함
		return "redirect:loginpage.action";
	}
}
