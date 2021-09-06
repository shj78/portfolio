package com.leggo.qna;

public class QnaDTO
{
	private String qna_type, qna_title, qna_content;
	private String mem_id;
	private String qna_date, qna_count;

	public String getQna_type()
	{
		return qna_type;
	}

	public void setQna_type(String qna_type)
	{
		this.qna_type = qna_type;
	}

	public String getQna_title()
	{
		return qna_title;
	}

	public void setQna_title(String qna_title)
	{
		this.qna_title = qna_title;
	}

	public String getQna_content()
	{
		return qna_content;
	}

	public void setQna_content(String qna_content)
	{
		this.qna_content = qna_content;
	}

	public String getMem_id()
	{
		return mem_id;
	}

	public void setMem_id(String mem_id)
	{
		this.mem_id = mem_id;
	}
	
	public String getQna_date()
	{
		return qna_date;
	}

	public void setQna_date(String qna_date)
	{
		this.qna_date = qna_date;
	}

	public String getQna_count()
	{
		return qna_count;
	}

	public void setQna_count(String qna_count)
	{
		this.qna_count = qna_count;
	}
}
