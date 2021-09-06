package com.leggo.profile;

public class ProfileDTO
{
	private String mem_id, mem_nnm, mem_img, mem_intro;	//--아이디, 닉네임, 프로필 사진, 자기소개
	private String fol_ing_cnt, fol_ed_cnt;		//--팔로잉 수, 팔로워 수
	private String root;	//--수정할 프로필 파일 저장 루트
	
	public String getMem_id()
	{
		return mem_id;
	}
	public void setMem_id(String mem_id)
	{
		this.mem_id = mem_id;
	}
	public String getMem_nnm()
	{
		return mem_nnm;
	}
	public void setMem_nnm(String mem_nnm)
	{
		this.mem_nnm = mem_nnm;
	}
	public String getMem_img()
	{
		return mem_img;
	}
	public void setMem_img(String mem_img)
	{
		this.mem_img = mem_img;
	}
	public String getMem_intro()
	{
		return mem_intro;
	}
	public void setMem_intro(String mem_intro)
	{
		this.mem_intro = mem_intro;
	}
	public String getFol_ing_cnt()
	{
		return fol_ing_cnt;
	}
	public void setFol_ing_cnt(String fol_ing_cnt)
	{
		this.fol_ing_cnt = fol_ing_cnt;
	}
	public String getFol_ed_cnt()
	{
		return fol_ed_cnt;
	}
	public void setFol_ed_cnt(String fol_ed_cnt)
	{
		this.fol_ed_cnt = fol_ed_cnt;
	}
	public String getRoot()
	{
		return root;
	}
	public void setRoot(String root)
	{
		this.root = root;
	}
}
