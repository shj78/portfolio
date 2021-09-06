package com.leggo.mybatis;

import java.util.ArrayList;

public interface IJoinQuestionDAO
{
	// 설문조사 질문 리스트
	public ArrayList<JoinQuestionDTO> list();
	
	// 설문조사 총 수
	public int count();
	
}
