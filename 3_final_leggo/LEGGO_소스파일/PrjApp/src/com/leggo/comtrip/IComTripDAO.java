/*=========================
   IComTripFeedDAO.java
   - 인터페이스
=========================*/

package com.leggo.comtrip;

import java.util.ArrayList;

public interface IComTripDAO
{
	// 여행기 목록 페이지 리스트
	public ArrayList<ComTripDTO> list();
	
	// 여행기 수정
	public int modify(ComTripDTO t);
	
	// 여행기 삭제
	public int remove(ComTripDTO t);
}
