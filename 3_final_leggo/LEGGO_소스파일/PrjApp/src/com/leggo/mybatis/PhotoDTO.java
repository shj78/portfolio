package com.leggo.mybatis;

public class PhotoDTO
{
	//-- 주요 속성 구성
	private String pp_cd, mem_nnm, pp_dt, pp_hits, rpt_st_count, dt, open_st, blind;
	private String ppr_dt, ppr_cd;
	
	//--  getter / setter 구성
	public String getPp_cd()
	{
		return pp_cd;
	}

	public void setPp_cd(String pp_cd)
	{
		this.pp_cd = pp_cd;
	}

	public String getMem_nnm()
	{
		return mem_nnm;
	}

	public void setMem_nnm(String mem_nnm)
	{
		this.mem_nnm = mem_nnm;
	}

	public String getPp_dt()
	{
		return pp_dt;
	}

	public void setPp_dt(String pp_dt)
	{
		this.pp_dt = pp_dt;
	}

	public String getPp_hits()
	{
		return pp_hits;
	}

	public void setPp_hits(String pp_hits)
	{
		this.pp_hits = pp_hits;
	}

	public String getRpt_st_count()
	{
		return rpt_st_count;
	}

	public void setRpt_st_count(String rpt_st_count)
	{
		this.rpt_st_count = rpt_st_count;
	}

	public String getDt()
	{
		return dt;
	}

	public void setDt(String dt)
	{
		this.dt = dt;
	}

	public String getOpen_st()
	{
		return open_st;
	}

	public void setOpen_st(String open_st)
	{
		this.open_st = open_st;
	}

	public String getBlind()
	{
		return blind;
	}

	public void setBlind(String blind)
	{
		this.blind = blind;
	}

	public String getPpr_dt()
	{
		return ppr_dt;
	}

	public void setPpr_dt(String ppr_dt)
	{
		this.ppr_dt = ppr_dt;
	}

	public String getPpr_cd()
	{
		return ppr_cd;
	}

	public void setPpr_cd(String ppr_cd)
	{
		this.ppr_cd = ppr_cd;
	}
}
