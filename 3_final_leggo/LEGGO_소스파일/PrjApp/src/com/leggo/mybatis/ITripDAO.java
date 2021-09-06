package com.leggo.mybatis;

import java.util.ArrayList;

public interface ITripDAO
{
	// 여행기 리스트
	public ArrayList<TripDTO> list();
	
	// 여행기 총 수
	public int count();
	
	// 여행기 상세 페이지
	public TripDTO tripPost(TripDTO t);
	
	// 여행기 상세 - 신고 리스트 
	public ArrayList<TripDTO> rptList(TripDTO t);
	
	// 여행기 상세 - 신고 수 
	public int rptCount(TripDTO t);
	
}
