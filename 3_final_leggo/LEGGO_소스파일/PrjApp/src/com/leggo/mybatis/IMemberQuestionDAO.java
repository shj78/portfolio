package com.leggo.mybatis;

import java.util.ArrayList;

public interface IMemberQuestionDAO
{
	// 일대일문의 문의 리스트
	public ArrayList<MemberQuestionDTO> list();
	
	// 일대일문의 문의 총 수
	public int count();
	
	// 일대일문의 상세 페이지
	public MemberQuestionDTO inquiryPost(MemberQuestionDTO q);
	
	// 금일 일대일문의 수
	public int dayCount();
	
	
}
