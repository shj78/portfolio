package com.leggo.mybatis;

import java.util.ArrayList;

public interface ICommentDAO
{
	// 댓글 리스트 
	public ArrayList<CommentDTO> list();
	
	// 댓글 총 수 
	public int totCount();
	
	// 당일 댓글 건 수 
	public int count();
}
