package com.leggo.mybatis;

import java.util.ArrayList;

public interface IPostStatsDAO
{
	//-- 당일 게시판 별 
	public PostStatsDTO postCount();
	
	//-- 일자별 게시물 총 수 (금일부터 6일전)
	public ArrayList<PostStatsDTO> postDayCount();
	
	//-- 2주 게시물 총 수 (금일부터 13일전)
	public ArrayList<PostStatsDTO> totCount();
}
