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

	@RequestMapping(value = "login.action", method = RequestMethod.GET)
	public String loginpage(ModelMap model, HttpServletRequest request)
	{

		String result = "WEB-INF/views/login.jsp";
		return result;

	}
	
	@RequestMapping(value = "join.action", method = RequestMethod.GET)
	public String joinpage(ModelMap model, HttpServletRequest request)
	{

		String result = "WEB-INF/views/join.jsp";
		return result;

	}
	
	@RequestMapping(value = "main.action", method = RequestMethod.GET)
	public String mainpage(ModelMap model, HttpServletRequest request)
	{

		String result = "WEB-INF/views/Main.jsp";
		return result;

	}
	
	
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

		String result = "WEB-INF/views/ZPlan.jsp";
		
		return result;

	}
	
	
	/* 미완 */
	/* 일정 작성 내용 인서트 완료 후 저장된 일정 작성 화면 */
	@RequestMapping(value ="saveplan.action", method=RequestMethod.GET) 
	public String saveplan(PlanDTO p) 
	{ 
		// IPlanDAO dao = sqlSession.getMapper(IPlanDAO.class);
	  
		 return "WEB-INF/views/SavePlan.jsp";
	  
	}
	
	
	@RequestMapping(value = "insertplan.action", method = {RequestMethod.GET, RequestMethod.POST})
	 public String insertplan(PlanDTO p,
	 String[] LOC_NM, String[] CITY_CD, String[]
	LOC_LAT, String[] LOC_LONG, String[] LOC_DESC, String[] LOC_STRT_TIME)
	{
		
		
		
		String result = "WEB-INF/views/StartPlan.jsp";
		
		IPlanDAO dao = sqlSession.getMapper(IPlanDAO.class);
			
		
		try {
			//일정 테이블에 인서트됨
			dao.insertplan(p);
			
			
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return result;
	    

	}

	@RequestMapping(value = "insertaddlocation.action", method = {RequestMethod.GET, RequestMethod.POST})
	 public String insertplan(String[] LOC_NM, String[] CITY_CD, String[] LOC_LAT
	, String[] LOC_LONG, String[] LOC_DESC, String[] LOC_STRT_TIME)
	{
		
		String result = "WEB-INF/views/StartPlan.jsp";
		
		IPlanDAO dao = sqlSession.getMapper(IPlanDAO.class);
			
		
		try {
			
			int n = LOC_NM.length;
			
			System.out.println("n: "+n);
			
			System.out.println("배열의 개수 : "+n);
			
			for(int i=0; i<n; i++)
			{
				
				System.out.println(LOC_NM[i]);

				System.out.println(CITY_CD[i]);

				System.out.println(LOC_LAT[i]);

				System.out.println(LOC_LONG[i]);

				System.out.println(LOC_DESC[i]);

				System.out.println(LOC_STRT_TIME[i]);

				System.out.println("================");
				
				PlanADTO a =  new PlanADTO();
				
				//얕은복사 깊은복사??
				//쿼리로그?? - 마이바티스 
		    	a.setLOC_NM(LOC_NM[i]);
		    	a.setCITY_CD(CITY_CD[i]);
		    	a.setLOC_LAT(LOC_LAT[i]);
		    	a.setLOC_LONG(LOC_LONG[i]);
		    	a.setLOC_DESC(LOC_DESC[i]);
		    	a.setLOC_STRT_TIME(LOC_STRT_TIME[i]);
		    	
		    	dao.insertaddloc(a);

				
			}
			
			
			


			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return result;
	    

	}

	  
}
