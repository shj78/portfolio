package com.leggo.mybatis;

import java.util.ArrayList;

public interface IJoinQuestionOptionDAO
{
	// 설문조사 답변 항목 리스트
	public ArrayList<JoinQuestionOptionDTO> list();
	
	// 설문조사 질문1 답 통계
	public ArrayList<JoinQuestionOptionDTO> answer1();

	// 설문조사 질문2 답 통계
	public ArrayList<JoinQuestionOptionDTO> answer2();

	// 설문조사 질문3 답 통계
	public ArrayList<JoinQuestionOptionDTO> answer3();
}
