package com.leggo.mybatis;

public class VisitantDTO
{
	// 주요 속성 구성
	private String vi_cd, vi_ip, vi_dt, count;
	
	// getter / setter 
	public String getVi_cd()
	{
		return vi_cd;
	}
	public void setVi_cd(String vi_cd)
	{
		this.vi_cd = vi_cd;
	}
	public String getVi_ip()
	{
		return vi_ip;
	}
	public void setVi_ip(String vi_ip)
	{
		this.vi_ip = vi_ip;
	}
	public String getVi_dt()
	{
		return vi_dt;
	}
	public void setVi_dt(String vi_dt)
	{
		this.vi_dt = vi_dt;
	}
	public String getCount()
	{
		return count;
	}
	public void setCount(String count)
	{
		this.count = count;
	}
}
