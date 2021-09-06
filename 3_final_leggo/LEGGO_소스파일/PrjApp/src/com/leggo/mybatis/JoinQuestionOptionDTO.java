package com.leggo.mybatis;

public class JoinQuestionOptionDTO
{
	//-- 주요 속성 구성 
	private String jqo_cd, join_qst_cd, join_qst_num, jqo_cont, num;
	private int count;
	
	//-- getter / setter 
	public String getJqo_cd()
	{
		return jqo_cd;
	}

	public void setJqo_cd(String jqo_cd)
	{
		this.jqo_cd = jqo_cd;
	}

	public String getJoin_qst_cd()
	{
		return join_qst_cd;
	}

	public void setJoin_qst_cd(String join_qst_cd)
	{
		this.join_qst_cd = join_qst_cd;
	}

	public String getJoin_qst_num()
	{
		return join_qst_num;
	}

	public void setJoin_qst_num(String join_qst_num)
	{
		this.join_qst_num = join_qst_num;
	}

	public String getJqo_cont()
	{
		return jqo_cont;
	}

	public void setJqo_cont(String jqo_cont)
	{
		this.jqo_cont = jqo_cont;
	}

	public String getNum()
	{
		return num;
	}

	public void setNum(String num)
	{
		this.num = num;
	}

	public int getCount()
	{
		return count;
	}

	public void setCount(int count)
	{
		this.count = count;
	}
	
	
}
