package com.leggo.mybatis;

public class TripDTO
{
	//-- 주요 속성 구성
	private String tr_cd, mem_nnm, tr_dt, tr_hits, blind, tr_tt, dt, open_st;
	private String tr_rpt_cd, rpt_st_cont, tr_rpt_dt;
	
	//-- getter / setter 구성
	public String getTr_cd()
	{
		return tr_cd;
	}

	public String getTr_tt()
	{
		return tr_tt;
	}

	public void setTr_tt(String tr_tt)
	{
		this.tr_tt = tr_tt;
	}

	public void setTr_cd(String tr_cd)
	{
		this.tr_cd = tr_cd;
	}

	public String getMem_nnm()
	{
		return mem_nnm;
	}

	public void setMem_nnm(String mem_nnm)
	{
		this.mem_nnm = mem_nnm;
	}

	public String getTr_dt()
	{
		return tr_dt;
	}

	public void setTr_dt(String tr_dt)
	{
		this.tr_dt = tr_dt;
	}

	public String getTr_hits()
	{
		return tr_hits;
	}

	public void setTr_hits(String tr_hits)
	{
		this.tr_hits = tr_hits;
	}

	public String getBlind()
	{
		return blind;
	}

	public void setBlind(String blind)
	{
		this.blind = blind;
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

	public String getRpt_st_cont()
	{
		return rpt_st_cont;
	}

	public void setRpt_st_cont(String rpt_st_cont)
	{
		this.rpt_st_cont = rpt_st_cont;
	}

	public String getTr_rpt_dt()
	{
		return tr_rpt_dt;
	}

	public void setTr_rpt_dt(String tr_rpt_dt)
	{
		this.tr_rpt_dt = tr_rpt_dt;
	}

	public String getTr_rpt_cd()
	{
		return tr_rpt_cd;
	}

	public void setTr_rpt_cd(String tr_rpt_cd)
	{
		this.tr_rpt_cd = tr_rpt_cd;
	}
	
	
}
