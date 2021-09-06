package com.leggo.mybatis;

public class AdminAnswerDTO
{
	// 일대일문의 답변
	
	// 주요 속성 구성
	private String admin_ans_cd, mem_qst_cd, admin_cd, admin_ans_cont, admin_ans_dt;
	private String mem_nnm;
	
	// getter / setter
	public String getAdmin_ans_cd()
	{
		return admin_ans_cd;
	}
	public void setAdmin_ans_cd(String admin_ans_cd)
	{
		this.admin_ans_cd = admin_ans_cd;
	}
	public String getMem_qst_cd()
	{
		return mem_qst_cd;
	}
	public void setMem_qst_cd(String mem_qst_cd)
	{
		this.mem_qst_cd = mem_qst_cd;
	}
	public String getAdmin_cd()
	{
		return admin_cd;
	}
	public void setAdmin_cd(String admin_cd)
	{
		this.admin_cd = admin_cd;
	}
	public String getAdmin_ans_cont()
	{
		return admin_ans_cont;
	}
	public void setAdmin_ans_cont(String admin_ans_cont)
	{
		this.admin_ans_cont = admin_ans_cont;
	}
	public String getAdmin_ans_dt()
	{
		return admin_ans_dt;
	}
	public void setAdmin_ans_dt(String admin_ans_dt)
	{
		this.admin_ans_dt = admin_ans_dt;
	}
	public String getMem_nnm()
	{
		return mem_nnm;
	}
	public void setMem_nnm(String mem_nnm)
	{
		this.mem_nnm = mem_nnm;
	}
}
