/*=======================
 * PlanMain.java
 * - 컨트롤러
 =======================*/

package com.leggo.plan;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*스프링컨테이너야 com.test.mybatis 패키지 둘러보다가 이 클래스가 보이면 콘트롤러로 취급해주면돼*/
@Controller
public class PlanMain
{
	// mybatis 객체 의존성 (자동)주입 - sqlSession이 마이바티스 객체다 라고 생각하기(사실은 sqlSession이
	// mybatis객체를생성하지만)
	@Autowired
	private SqlSession sqlSession;

	//
	@RequestMapping(value = "startplan.action", method = RequestMethod.GET)
	public String startpage(ModelMap model, HttpServletRequest request)
	{

		String result = "WEB-INF/views/StartPlan.jsp";
		return result;

	}

	@RequestMapping(value = "writeplan.action", method = RequestMethod.GET)
	public String writepage(ModelMap model, HttpServletRequest request)
	{

		String keyword = request.getParameter("keyword");
		model.addAttribute("keyword", keyword);

		String result = "WEB-INF/views/UserPlan.jsp";
		
		return result;

	}

	
	
	@RequestMapping(value ="saveplan.action", method=RequestMethod.GET) 
	public String saveplan(PlanDTO p) 
	{ 
		 IPlanDAO dao = sqlSession.getMapper(IPlanDAO.class);
	  
		 return "WEB-INF/views/SavePlan.jsp";
	  
	}
	  
	 
	@RequestMapping(value ="insertplan.action", method=RequestMethod.GET) 
	public String insertplan(PlanDTO p) 
	{ 
		IPlanDAO dao = sqlSession.getMapper(IPlanDAO.class);
			
		String result = "WEB-INF/views/StartPlan.jsp";
		return result;
	  
	}
	  
	  
	  
	  
	@RequestMapping(value ="insertaddloc.action", method=RequestMethod.GET) 
	public String insertaddloc(PlanDTO p) 
	{ 
		IPlanDAO dao = sqlSession.getMapper(IPlanDAO.class);
	  
		String result = "WEB-INF/views/StartPlan.jsp";
		return result;
	  
	}
}
