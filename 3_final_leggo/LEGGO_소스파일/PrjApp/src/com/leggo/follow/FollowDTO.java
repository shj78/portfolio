package com.leggo.follow;

public class FollowDTO
{
	private String follow_mem_nnm;	//--팔로우 회원 별명
	private String follow_mem_img;	//--팔로우 회원 프로필 사진
	private String follow_mem_id;	//--팔로우 회원 아이디
	private String count;			//--맞팔 여부 확인용
	
	public String getFollow_mem_nnm()
	{
		return follow_mem_nnm;
	}
	public void setFollower_mem_nnm(String follow_mem_nnm)
	{
		this.follow_mem_nnm = follow_mem_nnm;
	}
	public String getFollow_mem_img()
	{
		return follow_mem_img;
	}
	public void setFollow_mem_img(String follow_mem_img)
	{
		this.follow_mem_img = follow_mem_img;
	}
	public String getFollow_mem_id()
	{
		return follow_mem_id;
	}
	public void setFollow_mem_id(String follow_mem_id)
	{
		this.follow_mem_id = follow_mem_id;
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
