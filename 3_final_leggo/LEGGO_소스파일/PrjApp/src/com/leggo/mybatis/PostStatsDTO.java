package com.leggo.mybatis;

public class PostStatsDTO
{
	//-- 주요 속성 구성
	private String dt;							//-- 작성일
	private int plan, trip, photo, count;		//-- 일정게시물수, 여행기게시물수, 사진게시물수
	
	// getter / setter 
	public String getDt()
	{
		return dt;
	}
	public void setDt(String dt)
	{
		this.dt = dt;
	}
	public int getPlan()
	{
		return plan;
	}
	public void setPlan(int plan)
	{
		this.plan = plan;
	}
	public int getTrip()
	{
		return trip;
	}
	public void setTrip(int trip)
	{
		this.trip = trip;
	}
	public int getPhoto()
	{
		return photo;
	}
	public void setPhoto(int photo)
	{
		this.photo = photo;
	}
	public int getCount()
	{
		return count;
	}
	public void setCount(int count)
	{
		this.count = count;
	}
}
