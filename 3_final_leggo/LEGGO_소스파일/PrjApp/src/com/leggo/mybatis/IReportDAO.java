package com.leggo.mybatis;

import java.util.ArrayList;

public interface IReportDAO
{
	// 신고 리스트 
	public ArrayList<ReportDTO> list();
	
	// 신고 총 수 
	public int totCount();
	
	// 당일 신고 건 수 
	public int count();
	
	// 신고 상세 페이지 
	public ReportDTO rptList(ReportDTO r);
	
	// 게시물 코드 가져오기
	public String postCheck(ReportDTO r);
	
	// 게시물 정보 가져오기
	public ReportDTO postList(String post_cd);
	
	// 게시물 리스트 가져오기 (회원 상세 페이지)
	public ArrayList<ReportDTO> postAllList(MemberDTO m);
	
	// 회원 신고 총합
	public int rptTotCount(MemberDTO m);
	
	// 회원 오신고 수
	public int oRptCount(MemberDTO m);
	
	// 회원 신고 내역
	public ArrayList<ReportDTO> memRptList(MemberDTO m);
}
