package com.leggo.mytrip;

public class MyTripDTO
{
	private String tr_cd, tr_tt, tr_thum_url, tr_hits, tr_dt;	//--코드, 제목, 썸네일, 조회수, 작성일자

	public String getTr_cd()
	{
		return tr_cd;
	}

	public void setTr_cd(String tr_cd)
	{
		this.tr_cd = tr_cd;
	}

	public String getTr_tt()
	{
		return tr_tt;
	}

	public void setTr_tt(String tr_tt)
	{
		this.tr_tt = tr_tt;
	}

	public String getTr_thum_url()
	{
		return tr_thum_url;
	}

	public void setTr_thum_url(String tr_thum_url)
	{
		this.tr_thum_url = tr_thum_url;
	}

	public String getTr_hits()
	{
		return tr_hits;
	}

	public void setTr_hits(String tr_hits)
	{
		this.tr_hits = tr_hits;
	}

	public String getTr_dt()
	{
		return tr_dt;
	}

	public void setTr_dt(String tr_dt)
	{
		this.tr_dt = tr_dt;
	}
}
