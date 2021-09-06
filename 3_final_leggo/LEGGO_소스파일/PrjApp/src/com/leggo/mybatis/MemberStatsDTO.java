package com.leggo.mybatis;

public class MemberStatsDTO
{
	//-- 주요 속성 구성
	private String join_dt, qrd_dt;				//-- 가입일, 탈퇴일
	private int leggo, naver, kakao, google;	//-- 가입방식 count
	private int rsn1, rsn2, rsn3, rsn4, rsn5;	//-- 탈퇴사유 count
	private int count;
	
	//-- getter / setter
	public String getJoin_dt()
	{
		return join_dt;
	}
	public void setJoin_dt(String join_dt)
	{
		this.join_dt = join_dt;
	}
	public int getLeggo()
	{
		return leggo;
	}
	public void setLeggo(int leggo)
	{
		this.leggo = leggo;
	}
	public int getNaver()
	{
		return naver;
	}
	public void setNaver(int naver)
	{
		this.naver = naver;
	}
	public int getKakao()
	{
		return kakao;
	}
	public void setKakao(int kakao)
	{
		this.kakao = kakao;
	}
	public int getGoogle()
	{
		return google;
	}
	public void setGoogle(int google)
	{
		this.google = google;
	}
	public String getQrd_dt()
	{
		return qrd_dt;
	}
	public void setQrd_dt(String qrd_dt)
	{
		this.qrd_dt = qrd_dt;
	}
	public int getRsn1()
	{
		return rsn1;
	}
	public void setRsn1(int rsn1)
	{
		this.rsn1 = rsn1;
	}
	public int getRsn2()
	{
		return rsn2;
	}
	public void setRsn2(int rsn2)
	{
		this.rsn2 = rsn2;
	}
	public int getRsn3()
	{
		return rsn3;
	}
	public void setRsn3(int rsn3)
	{
		this.rsn3 = rsn3;
	}
	public int getRsn4()
	{
		return rsn4;
	}
	public void setRsn4(int rsn4)
	{
		this.rsn4 = rsn4;
	}
	public int getRsn5()
	{
		return rsn5;
	}
	public void setRsn5(int rsn5)
	{
		this.rsn5 = rsn5;
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
