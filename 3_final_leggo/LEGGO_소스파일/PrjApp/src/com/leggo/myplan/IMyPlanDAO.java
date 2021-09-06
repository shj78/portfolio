package com.leggo.myplan;

public interface IMyPlanDAO
{
	// 작성한 일정 목록 조회
	public MyPlanDTO MyPlanSelect(String mem_id);
}
