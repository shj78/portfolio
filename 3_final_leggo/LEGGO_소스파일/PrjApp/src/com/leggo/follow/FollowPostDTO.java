package com.leggo.follow;

public class FollowPostDTO
{
	private String post_cd, post_tt, post_img;	//--게시글 코드, 게시글 제목, 게시글 사진 url

	public String getPost_cd()
	{
		return post_cd;
	}

	public void setPost_cd(String post_cd)
	{
		this.post_cd = post_cd;
	}

	public String getPost_tt()
	{
		return post_tt;
	}

	public void setPost_tt(String post_tt)
	{
		this.post_tt = post_tt;
	}

	public String getPost_img()
	{
		return post_img;
	}

	public void setPost_img(String post_img)
	{
		this.post_img = post_img;
	}
}
