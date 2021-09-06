/*========================
   ComTripFeedDTO.java
========================*/

package com.leggo.comtrip;

public class ComTripDTO
{
	private String mem_cd, mem_img, mem_nnm;  // 회원 코드, 회원 프로필 사진, 닉네임, 
	private String tr_tt, tr_cont, tr_thum_url, tr_hits, tr_dt; // 제목, 조회수, 작성일, 내용
	
	// getter / setter 구성
	public String getMem_cd()
	{
		return mem_cd;
	}
	public void setMem_cd(String mem_cd)
	{
		this.mem_cd = mem_cd;
	}
	public String getMem_img()
	{
		return mem_img;
	}
	public void setMem_img(String mem_img)
	{
		this.mem_img = mem_img;
	}
	public String getMem_nnm()
	{
		return mem_nnm;
	}
	public void setMem_nnm(String mem_nnm)
	{
		this.mem_nnm = mem_nnm;
	}
	public String getTr_tt()
	{
		return tr_tt;
	}
	public void setTr_tt(String tr_tt)
	{
		this.tr_tt = tr_tt;
	}
	public String getTr_cont()
	{
		return tr_cont;
	}
	public void setTr_cont(String tr_cont)
	{
		this.tr_cont = tr_cont;
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
