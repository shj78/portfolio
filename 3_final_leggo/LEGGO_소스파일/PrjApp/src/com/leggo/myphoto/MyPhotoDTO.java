package com.leggo.myphoto;

public class MyPhotoDTO
{
	private String pht_url, pp_hits, pp_dt;	//--사진, 조회수, 작성일자

	public String getPht_url()
	{
		return pht_url;
	}

	public void setPht_url(String pht_url)
	{
		this.pht_url = pht_url;
	}

	public String getPp_hits()
	{
		return pp_hits;
	}

	public void setPp_hits(String pp_hits)
	{
		this.pp_hits = pp_hits;
	}

	public String getPp_dt()
	{
		return pp_dt;
	}

	public void setPp_dt(String pp_dt)
	{
		this.pp_dt = pp_dt;
	}
}
