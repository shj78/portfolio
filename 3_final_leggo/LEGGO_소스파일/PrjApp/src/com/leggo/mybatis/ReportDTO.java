package com.leggo.mybatis;

public class ReportDTO
{
	private String rpt_cd, rsn, mem_nnm, dt, st, dtt, post_cd;		//-- 코드, 사유, 회원코드, 신고일, 상태, 신고일(시간같이)
	private String tt, open_st, blind, mem_cd;

	public String getRpt_cd()
	{
		return rpt_cd;
	}

	public void setRpt_cd(String rpt_cd)
	{
		this.rpt_cd = rpt_cd;
	}

	public String getRsn()
	{
		return rsn;
	}

	public void setRsn(String rsn)
	{
		this.rsn = rsn;
	}

	public String getMem_nnm()
	{
		return mem_nnm;
	}

	public void setMem_nnm(String mem_nnm)
	{
		this.mem_nnm = mem_nnm;
	}

	public String getDt()
	{
		return dt;
	}

	public void setDt(String dt)
	{
		this.dt = dt;
	}

	public String getSt()
	{
		return st;
	}

	public void setSt(String st)
	{
		this.st = st;
	}

	public String getDtt()
	{
		return dtt;
	}

	public void setDtt(String dtt)
	{
		this.dtt = dtt;
	}

	public String getPost_cd()
	{
		return post_cd;
	}

	public void setPost_cd(String post_cd)
	{
		this.post_cd = post_cd;
	}

	public String getTt()
	{
		return tt;
	}

	public void setTt(String tt)
	{
		this.tt = tt;
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

	public String getMem_cd()
	{
		return mem_cd;
	}

	public void setMem_cd(String mem_cd)
	{
		this.mem_cd = mem_cd;
	}
	
}
