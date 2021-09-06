package com.leggo.mybatis;

import java.util.ArrayList;

public interface IPlanDAO
{
	// 일정 리스트
	public ArrayList<PlanDTO> list();
	
	// 일정 총 수
	public int count();
	
	// 일정 상세 페이지
	public PlanDTO planPost(PlanDTO p);
	
	// 일정 신고 리스트 - 상세
	public ArrayList<PlanDTO> rptList(PlanDTO p);
	
	public int rptCount(PlanDTO p);
}
