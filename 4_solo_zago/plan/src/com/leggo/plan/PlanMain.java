/*=======================
 * PlanMain.java
 * - 컨트롤러
 =======================*/

package com.leggo.plan;


import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.ObjectMapper;


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

		String result = "WEB-INF/views/Login.jsp";
		return result;

	}
	
	@RequestMapping(value = "join.action", method = RequestMethod.GET)
	public String joinpage(ModelMap model, HttpServletRequest request)
	{

		String result = "WEB-INF/views/Join.jsp";
		return result;

	}
	
	//get이니 데이터 조회
	@RequestMapping(value = "main.action", method = RequestMethod.GET)
	public String mainpage(ModelMap model, HttpServletRequest request)
	{

		String result = "WEB-INF/views/Main.jsp";
		
		//sqlSession 객체에서 getMapper()를 실행해 오버라이딩 된 인터페이스 객체를 얻어옴
		//왜 sqlSession을 이용하지?:
		IPlanDAO dao = sqlSession.getMapper(IPlanDAO.class);
		
		//일정 목록을 가져옴
		List<PlanDTO> planList = dao.selectPlanList();
//		List<PlanResponseDTO> planResponseList = new ArrayList<>();
//		for (PlanDTO dto : planList) {
//			planResponseList.add(PlanResponseDTO.buildFromPlanDTO(dto));
//		}
		
		//넘길 데이터를 k,v 형태로 넣으면 스프링은 그 값을 뷰로 넘겨줌
		model.addAttribute("planList", planList);
		
		//뷰 파일 리턴 
		return result;

	}
	
	/* 일정 작성 내용 인서트 완료 후 저장된 일정 화면 */	
	@RequestMapping(value = "detail.action", method = RequestMethod.GET)
	public String detailPage(@RequestParam(value = "pl_cd", required = true) String pl_cd, Model model)
	{

		String result = "WEB-INF/views/ZPlan.jsp";
		
		IPlanDAO dao = sqlSession.getMapper(IPlanDAO.class);
		
		//일정 테이블
		PlanDTO plan = dao.selectPlan(pl_cd);
		model.addAttribute("plan", plan);
		
		//추가된 장소 테이블
		List<PlanADTO> locationList = dao.selectLocationList(pl_cd);
		model.addAttribute("locationList", locationList);
		
		return result;
	}
	
	/* 일정 작성 시작 화면 */
	@RequestMapping(value = "startplan.action", method = RequestMethod.GET)
	public String startpage(ModelMap model, HttpServletRequest request)
	{

		String result = "WEB-INF/views/StartPlan.jsp";
		return result;

	}

	/* 일정 작성 시작 이후 작성 화면 */
	@RequestMapping(value = "writeplan.action", method = RequestMethod.GET)
	public String writepage(ModelMap model, HttpServletRequest request)
	{

		String keyword = request.getParameter("keyword");
		model.addAttribute("keyword", keyword);

		String result = "WEB-INF/views/UserPlan.jsp";
		
		return result;

	}
	
	/* 일정 인서트 */
	@RequestMapping(value = "insertplan.action", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	 public String insertplan(@RequestBody String body)
	{
		
		String result = "WEB-INF/views/StartPlan.jsp";
		
		IPlanDAO dao = sqlSession.getMapper(IPlanDAO.class);
			
		
		try {
			String decodedBody = URLDecoder.decode(body, "utf-8"); 
			//JSON 문자열(body)을 객체로 파싱 
			ObjectMapper objectMapper = new ObjectMapper();
			objectMapper.setSerializationInclusion(Include.NON_NULL);
																				//타겟클래스 - 파싱되고, 객체만들어짐
			PlanRequestDTO planRequestDTO = objectMapper.readValue(decodedBody, PlanRequestDTO.class);
			//보내는 데이터 구조 복잡 
			
			//일정 테이블에 인서트됨
			PlanDTO plan = planRequestDTO.getPlan();
			
			//마이바티스에게 넘김 - 셀렉키 설정대로 plan PL_CD 설정이 됨  
			dao.insertplan(plan);
			
			for (PlanADTO planA : planRequestDTO.getLocationList()) {
				
				planA.setPL_CD(plan.getPL_CD());
									// 추가된 장소 도착 시간
				System.out.println(planA.getLOC_NM());
				System.out.println(planA.getLOC_DESC());
				System.out.println(planA.getLOC_LAT());
				System.out.println(planA.getLOC_LONG());
				System.out.println(planA.getLOC_STRT_TIME());
				System.out.println("-----------------------");
				
				dao.insertaddloc(planA);
			}
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return "{\"result\":\"ok\"}";

	}
	
	@RequestMapping(value = "uploadimage.action", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String uploadImage(
			@RequestParam(value = "image") MultipartFile image,
			@RequestParam(value = "PL_CD") String PL_CD) throws Exception
	{
		FileOutputStream fos = new FileOutputStream(image.getName());
		fos.write(image.getBytes());
		
		// TODO: file 저장 후 DB PLAN 테이블에도 이미지 경로 Update
		
		return "";
	}

	/*
	@RequestMapping(value = "insertaddlocation.action", method = {RequestMethod.GET, RequestMethod.POST})
	 public String insertplan(List<PlanADTO> locationList)
	{
		
		String result = "WEB-INF/views/StartPlan.jsp";
		
		IPlanDAO dao = sqlSession.getMapper(IPlanDAO.class);
			
		
		try {
			
			for (PlanADTO planA : locationList) {
				dao.insertaddloc(planA);
			}
			
			/*
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
			*/
			
			


	/*		
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return result;
	    

	}
	*/

	  
}
