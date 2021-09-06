package com.leggo.signin;

public class MemberSigninDTO
{
	private String mem_id, mem_pw, mem_nnm;	//--아이디, 비밀번호, 닉네임
	
	public String getMem_id()
	{
		return mem_id;
	}
	public void setMem_id(String mem_id)
	{
		this.mem_id = mem_id;
	}
	public String getMem_pw()
	{
		return mem_pw;
	}
	public void setMem_pw(String mem_pw)
	{
		this.mem_pw = mem_pw;
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
