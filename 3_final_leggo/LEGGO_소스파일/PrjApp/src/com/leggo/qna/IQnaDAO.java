package com.leggo.qna;

import java.util.ArrayList;

public interface IQnaDAO
{
	// 일대일문의 작성
	public int SendQna(QnaDTO dto);
	  
	// 작성한 일대일문의 조회
	public ArrayList<QnaDTO> QnaList(String mem_id);
}
