package com.leggo.plan;

public class PlanADTO
{
	//PL_IMG 아직 구현안됐음 , 일정 대표이미지, PL_IMG
	
	//추가된 장소 테이블								//★ LOC_CD 추가된 장소 코드
	private String LOC_NM, CITY_CD					//장소명, 도시 코드
	, LOC_LAT, LOC_LONG, LOC_DESC 					//추가된 장소 위도, 추가된 장소 경도, 추가된 장소 설명
	, LOC_STRT_TIME;									// 추가된 장소 도착 시간


	public String getLOC_NM()
	{
		return LOC_NM;
	}
				
	public void setLOC_NM(String lOC_NM)
	{
		LOC_NM = lOC_NM;
	}

	public String getCITY_CD()
	{
		return CITY_CD;
	}

	public void setCITY_CD(String cITY_CD)
	{
		CITY_CD = cITY_CD;
	}

	public String getLOC_LAT()
	{
		return LOC_LAT;
	}

	public void setLOC_LAT(String lOC_LAT)
	{
		LOC_LAT = lOC_LAT;
	}

	public String getLOC_LONG()
	{
		return LOC_LONG;
	}

	public void setLOC_LONG(String lOC_LONG)
	{
		LOC_LONG = lOC_LONG;
	}

	public String getLOC_DESC()
	{
		return LOC_DESC;
	}

	public void setLOC_DESC(String lOC_DESC)
	{
		LOC_DESC = lOC_DESC;
	}

	public String getLOC_STRT_TIME()
	{
		return LOC_STRT_TIME;
	}

	public void setLOC_STRT_TIME(String lOC_STRT_TIME)
	{
		LOC_STRT_TIME = lOC_STRT_TIME;
	}

	

	

	//나는 도시명으로 넣을건데, 테이블에는 도시코드로 들어가야함 - CASE WHEN THEN
	
	
	
	
	
	
	
	
}
