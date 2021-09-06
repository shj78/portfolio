package com.leggo.mybatis;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 대시보드 페이지 
	@RequestMapping(value = "/admin.action", method = RequestMethod.GET)
	public String adminDashboard(Model model, HttpServletRequest request)
	{
		String result = null;
		
		IVisitantDAO vi = sqlSession.getMapper(IVisitantDAO.class);				//-- 접속자
		IMemberDAO mem = sqlSession.getMapper(IMemberDAO.class);				//-- 회원
		IPostStatsDAO ps = sqlSession.getMapper(IPostStatsDAO.class);			//-- 게시물
		IReportDAO pe = sqlSession.getMapper(IReportDAO.class);					//-- 신고
		ICommentDAO com = sqlSession.getMapper(ICommentDAO.class);				//-- 댓글
		IMemberQuestionDAO mq = sqlSession.getMapper(IMemberQuestionDAO.class);	//-- 일대일문의
		
		// 메인 페이지 접근 시 접속자 COUNT (사용자 페이지로 이동 필요) -------------------------------------- 
		VisitantDTO v = new VisitantDTO();
		v.setVi_ip(request.getRemoteAddr());
		
		vi.add(v);
		// -------------------------------------- 메인 페이지 접근 시 접속자 COUNT (사용자 페이지로 이동 필요)
		
		model.addAttribute("joinCount", mem.joinCount());		//-- 신규 회원 
		model.addAttribute("reportCount", pe.count());			//-- 신규 신고 
		model.addAttribute("comCount", com.count());			//-- 신규 댓글
		model.addAttribute("mqCount", mq.dayCount());			//-- 신규 일대일문의 
		
		model.addAttribute("postCount", ps.postCount());		//-- 당일 게시물 수 (그래프)
		model.addAttribute("timeList", vi.timeList());			//-- 당일 시간별 접속자 수 (그래프)
		
		model.addAttribute("inqList", mq.list());
		model.addAttribute("repList", pe.list());
		
		result = "/WEB-INF/adminpage/AdminDashboard.jsp";
		
		return result;
	}
	
	// 회원 목록 페이지 
	@RequestMapping(value = "/memberlist.action", method = RequestMethod.GET)
	public String member(Model model)
	{
		String result = null;
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		model.addAttribute("list", dao.list());						//-- 회원리스트
		model.addAttribute("totCount", dao.totCount());				//-- 회원 총 인원
		
		result = "/WEB-INF/adminpage/AdminMember.jsp";
		
		return result;
	}
	
	// 회원 목록 상세 
	@RequestMapping(value = "/memberprofile.action", method = RequestMethod.GET)
	public String memberProfile(Model model, MemberDTO m)
	{
		String result = null;
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		IReportDAO re = sqlSession.getMapper(IReportDAO.class);
		
		model.addAttribute("memberProfile", dao.memberProfile(m));		//-- 회원 상세 프로필 정보
		
		model.addAttribute("postList", re.postAllList(m));				//-- 회원 작성 게시물
		
		model.addAttribute("rptTotCount", re.rptTotCount(m));
		model.addAttribute("oRptCount", re.oRptCount(m));
		
		model.addAttribute("memRptList", re.memRptList(m));
		
		result = "/WEB-INF/adminpage/AdminMemberProfile.jsp";
		
		return result;
	}
	
	// 회원 목록 상세 
	@RequestMapping(value = "/memberprofileUpdate.action", method = RequestMethod.POST)
	public String memberprofileUpdate(Model model, MemberDTO m, String rank)
	{
		String result = null;
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		
		if ( (dao.adminCheck(m)).getCount() == 0)		//-- 선택된 회원이 사용자 
		{
			if (rank.equals("1"))	//-- 관리자로 변경하고자한다면 ADMIN 테이블 추가 
			{
				dao.memberUpdate(m);
			}
		}
		else if ( (dao.adminCheck(m)).getCount() == 1)		//-- 선택된 회원이 관리자
		{
			if (rank.equals("0"))	//-- 사용자로 변경하고자한다면 ADMIN 테이블 삭제
			{
				dao.memberDelete(m);
			}
		}
		
		//System.out.println(m.getMem_cd());
		
		model.addAttribute("mesagge", "수정");
		
		result = "/WEB-INF/adminpage/AdminNotice.jsp";
		
		return result;
	}
	
	// 일대일문의 관리 페이지 
	@RequestMapping(value = "/inquiry.action", method = RequestMethod.GET)
	public String memberQuestion(Model model)
	{
		String result = null;
		
		IMemberQuestionDAO dao = sqlSession.getMapper(IMemberQuestionDAO.class);
		
		model.addAttribute("list", dao.list());
		model.addAttribute("count", dao.count());
		
		result = "/WEB-INF/adminpage/AdminInquiry.jsp";
		
		return result;
	}
	
	// 일대일문의 답변 페이지 
	@RequestMapping(value = "/inquiryanwer.action", method = RequestMethod.GET)
	public String inquiryAnwer(Model model, MemberQuestionDTO q)
	{
		String result = null;
		
		IMemberQuestionDAO dao = sqlSession.getMapper(IMemberQuestionDAO.class);
		IAdminAnswerDAO adao = sqlSession.getMapper(IAdminAnswerDAO.class);
		
		model.addAttribute("question", dao.inquiryPost(q));
		model.addAttribute("answer", adao.list(q));
		
		result = "/WEB-INF/adminpage/AdminAnswer.jsp";
		
		return result;
	}
	
	// 설문조사 관리 페이지 
	@RequestMapping(value = "/survey.action", method = RequestMethod.GET)
	public String survey(Model model)
	{
		String result = null;
		
		IMemberDAO mem = sqlSession.getMapper(IMemberDAO.class);
		IJoinQuestionDAO jq = sqlSession.getMapper(IJoinQuestionDAO.class);
		IJoinQuestionOptionDAO jqo = sqlSession.getMapper(IJoinQuestionOptionDAO.class);
		
		model.addAttribute("totCount", mem.totCount());
		
		model.addAttribute("jq_list", jq.list());
		model.addAttribute("jq_count", jq.count());
		
		model.addAttribute("jqo_list", jqo.list());
		model.addAttribute("answer1", jqo.answer1());
		model.addAttribute("answer2", jqo.answer2());
		model.addAttribute("answer3", jqo.answer3());
		
		
		result = "/WEB-INF/adminpage/AdminSurvey.jsp";
		
		return result;
	}
	
	
	// 일정 관리 페이지 
	@RequestMapping(value = "/plan.action", method = RequestMethod.GET)
	public String plan(Model model)
	{
		String result = null;
		
		IPlanDAO dao = sqlSession.getMapper(IPlanDAO.class);
		
		model.addAttribute("list", dao.list());
		model.addAttribute("count", dao.count());
		
		result = "/WEB-INF/adminpage/AdminPlan.jsp";
		
		return result;
	}
	
	// 일정 관리 상세 페이지
	@RequestMapping(value = "/memberplan.action", method = RequestMethod.GET)
	public String memberPlan(Model model, PlanDTO p)
	{
		String result = null;
		
		IPlanDAO dao = sqlSession.getMapper(IPlanDAO.class);
		
		model.addAttribute("post", dao.planPost(p));
		model.addAttribute("rptCount", dao.rptCount(p));
		model.addAttribute("rptList", dao.rptList(p));
		
		result = "/WEB-INF/adminpage/AdminMemberPlan.jsp";
		
		return result;
	}
	
	
	// 여행기 관리 페이지 
	@RequestMapping(value = "/trip.action", method = RequestMethod.GET)
	public String trip(Model model)
	{
		String result = null;
		
		ITripDAO dao = sqlSession.getMapper(ITripDAO.class);
		
		model.addAttribute("list", dao.list());
		model.addAttribute("count", dao.count());
		
		result = "/WEB-INF/adminpage/AdminTrip.jsp";
		
		return result;
	}
	
	// 여행기 관리 상세 페이지
	@RequestMapping(value = "/membertrip.action", method = RequestMethod.GET)
	public String memberTrip(Model model, TripDTO t)
	{
		String result = null;
		
		ITripDAO dao = sqlSession.getMapper(ITripDAO.class);
		
		model.addAttribute("post", dao.tripPost(t));
		model.addAttribute("rptList", dao.rptList(t));
		model.addAttribute("rptCount", dao.rptCount(t));
		
		result = "/WEB-INF/adminpage/AdminMemberTrip.jsp";
		
		return result;
	}

	
	// 사진 관리 페이지 
	@RequestMapping(value = "/photo.action", method = RequestMethod.GET)
	public String photo(Model model)
	{
		String result = null;
		
		IPhotoDAO dao = sqlSession.getMapper(IPhotoDAO.class);
		
		model.addAttribute("list", dao.list());
		model.addAttribute("count", dao.count());
		
		result = "/WEB-INF/adminpage/AdminPhoto.jsp";
		
		return result;
	}
	
	// 사진 관리 상세 페이지
	@RequestMapping(value = "/memberphoto.action", method = RequestMethod.GET)
	public String memberPhoto(Model model, PhotoDTO p)
	{
		String result = null;
		
		IPhotoDAO dao = sqlSession.getMapper(IPhotoDAO.class);
		
		model.addAttribute("post", dao.photoPost(p));
		model.addAttribute("rptList", dao.rptList(p));
		model.addAttribute("rptCount", dao.rptCount(p));
		
		result = "/WEB-INF/adminpage/AdminMemberPhoto.jsp";
		
		return result;
	}
	
	// 댓글 관리 페이지
	@RequestMapping(value = "/comment.action", method = RequestMethod.GET)
	public String comment(Model model)
	{
		String result = null;
		
		ICommentDAO dao = sqlSession.getMapper(ICommentDAO.class);
		
		model.addAttribute("list", dao.list());							//-- 댓글 리스트 
		model.addAttribute("totCount", dao.totCount());					//-- 댓글 총 수
		
		result = "/WEB-INF/adminpage/AdminComment.jsp";
		
		return result;
	}
	
	
	// 신고 관리 페이지
	@RequestMapping(value = "/report.action", method = RequestMethod.GET)
	public String report(Model model)
	{
		String result = null;
		
		IReportDAO dao = sqlSession.getMapper(IReportDAO.class);
		
		model.addAttribute("list", dao.list());							//-- 신고 리스트 
		model.addAttribute("totCount", dao.totCount());					//-- 신고 총 수
		
		result = "/WEB-INF/adminpage/AdminReport.jsp";
		
		return result;
	}
	
	// 신고 관리 상세 페이지
	@RequestMapping(value = "/memberreport.action", method = RequestMethod.GET)
	public String memberReport(Model model, ReportDTO r)
	{
		String result = null;
		
		IReportDAO dao = sqlSession.getMapper(IReportDAO.class);
		
		model.addAttribute("rptList", dao.rptList(r));					//-- 신고 상세 리스트 
		
		String post_cd = dao.postCheck(r);								//-- 게시물 코드 가져오기 
		
		model.addAttribute("postList", dao.postList(post_cd));			//-- 게시물 정보 가져오기 
		
		result = "/WEB-INF/adminpage/AdminMemberReport.jsp";
		
		return result;
	}
	
	// 신고 관리 상세 페이지
	@RequestMapping(value = "/processReport.action", method = RequestMethod.GET)
	public String processReport(Model model, ReportDTO r)
	{
		String result = null;
		
		IReportDAO dao = sqlSession.getMapper(IReportDAO.class);
		
		model.addAttribute("rptList", dao.rptList(r));					//-- 신고 상세 리스트 
		
		String post_cd = dao.postCheck(r);								//-- 게시물 코드 가져오기 
		
		model.addAttribute("postList", dao.postList(post_cd));			//-- 게시물 정보 가져오기 
		
		result = "/WEB-INF/adminpage/AdminProcessReport.jsp";
		
		return result;
	}
	
	// 접속자 통계 페이지
	@RequestMapping(value = "/connectStats.action", method = RequestMethod.GET)
	public String connectStats(Model model)
	{
		String result = null;
		
		IVisitantDAO dao = sqlSession.getMapper(IVisitantDAO.class);
		
		model.addAttribute("list", dao.list());							//-- 접속자 리스트
		model.addAttribute("totCount", dao.totCount());					//-- 접속자 로그 총 수량
		model.addAttribute("dayList", dao.dayList());					//-- 일별 접속자 수 (그래프)
		model.addAttribute("timeList", dao.timeList());					//-- 당일 시간별 접속자 수 (그래프)
		
		result = "/WEB-INF/adminpage/AdminConnectStatistics.jsp";
		
		return result;
	}
	
	// 회원 통계 페이지
	@RequestMapping(value = "/memberStats.action", method = RequestMethod.GET)
	public String memberStats(Model model) 
	{
		String result = null;
		
		IMemberStatsDAO dao = sqlSession.getMapper(IMemberStatsDAO.class);
		
		model.addAttribute("joinList", dao.joinList());					//-- 가입방식에 따른 가입자 수 
		model.addAttribute("joinCount", dao.joinCount());				//-- 가입일자 총 수량 
		model.addAttribute("joinMtd", dao.joinMtd());					//-- 가입 방식별 가입자 수 (그래프)
		model.addAttribute("joinDayList", dao.joinDayList());			//-- 일자별 가입자 수(그래프)
		
		model.addAttribute("qrdList", dao.qrdList());					//-- 탈퇴사유에 따른 탈퇴 회원 수
		model.addAttribute("qrdCount", dao.qrdCount());					//-- 탈퇴사유 로그 총 수량
		model.addAttribute("qrdRsn", dao.qrdRsn());						//-- 탈퇴사유별 탈퇴회원 수 (그래프)
		model.addAttribute("qrdDayList", dao.qrdDayList());				//-- 일자별 탈퇴회원 수(그래프)
		
		result = "/WEB-INF/adminpage/AdminMemberStatistics.jsp";
		
		return result;
	}
	
	// 게시물 통계 페이지
	@RequestMapping(value = "/postStats.action", method = RequestMethod.GET)
	public String postStats(Model model)
	{
		String result = null;
		
		IPostStatsDAO dao = sqlSession.getMapper(IPostStatsDAO.class);
		
		model.addAttribute("postCount", dao.postCount());					//-- 당일 게시물 통계(그래프)
		model.addAttribute("postDayCount", dao.postDayCount());				//-- 일자별 게시물 수(그래프)
		model.addAttribute("totCount", dao.totCount());						//-- 총 게시물 수
		
		result = "/WEB-INF/adminpage/AdminPostStatistics.jsp";
		
		return result;
	}
	
	
}
