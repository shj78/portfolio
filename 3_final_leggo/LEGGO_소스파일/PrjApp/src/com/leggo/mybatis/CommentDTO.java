package com.leggo.mybatis;

public class CommentDTO
{
	// 주요 속성 구성
	private String cd, mem_nnm, cont, dt, post_cd, cmt_dt;
	
	//-- getter / setter 구성
	public String getCd()
	{
		return cd;
	}

	public void setCd(String cd)
	{
		this.cd = cd;
	}

	public String getMem_nnm()
	{
		return mem_nnm;
	}

	public void setMem_nnm(String mem_nnm)
	{
		this.mem_nnm = mem_nnm;
	}

	public String getCont()
	{
		return cont;
	}

	public void setCont(String cont)
	{
		this.cont = cont;
	}

	public String getDt()
	{
		return dt;
	}

	public void setDt(String dt)
	{
		this.dt = dt;
	}

	public String getPost_cd()
	{
		return post_cd;
	}

	public void setPost_cd(String post_cd)
	{
		this.post_cd = post_cd;
	}

	public String getCmt_dt()
	{
		return cmt_dt;
	}

	public void setCmt_dt(String cmt_dt)
	{
		this.cmt_dt = cmt_dt;
	}
}
