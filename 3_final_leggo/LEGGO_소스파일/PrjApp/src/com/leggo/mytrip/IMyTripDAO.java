package com.leggo.mytrip;

public interface IMyTripDAO
{
	// 작성한 여행기 목록 조회
	public MyTripDTO MyTripSelect(String mem_id);
}
