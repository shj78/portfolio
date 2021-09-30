package com.leggo.plan;

public class PlanDTO
{													//★★ PL_CD, MEM_CD,일정 코드, 회원 코드
	//일정 테이블 
	private Long PL_CD;
	private String PL_TT;		// 일정 제목
	private String PL_STT;		// 일정 소제목
	private String PL_STRT_DT;	// 일정 시작일
	private String PL_END_DT;	// 일정 종료일
	private String PL_PPL;		// 일정 작성일(Default라 뺌), 일정 예상 인원, 일정 공개 여부
	private String OPEN_CD;
	private Long MEM_CD;
	 
	//PL_IMG 아직 구현안됐음 , 일정 대표이미지, PL_IMG

	public String getPL_TT()
	{
		return PL_TT;
	}

	public void setPL_TT(String pL_TT)
	{
		PL_TT = pL_TT;
	}

	public String getPL_STT()
	{
		return PL_STT;
	}

	public void setPL_STT(String pL_STT)
	{
		PL_STT = pL_STT;
	}

	public String getPL_STRT_DT()
	{
		return PL_STRT_DT;
	}

	public void setPL_STRT_DT(String pL_STRT_DT)
	{
		PL_STRT_DT = pL_STRT_DT;
	}

	public String getPL_END_DT()
	{
		return PL_END_DT;
	}

	public void setPL_END_DT(String pL_END_DT)
	{
		PL_END_DT = pL_END_DT;
	}

	public String getPL_PPL()
	{
		return PL_PPL;
	}

	public void setPL_PPL(String pL_PPL)
	{
		PL_PPL = pL_PPL;
	}

	public String getOPEN_CD()
	{
		return OPEN_CD;
	}

	public void setOPEN_CD(String oPEN_CD)
	{
		OPEN_CD = oPEN_CD;
	}

	public Long getPL_CD()
	{
		return PL_CD;
	}

	public void setPL_CD(Long pL_CD)
	{
		PL_CD = pL_CD;
	}

	public Long getMEM_CD()
	{
		return MEM_CD;
	}

	public void setMEM_CD(Long mEM_CD)
	{
		MEM_CD = mEM_CD;
	}

	

	//나는 도시명으로 넣을건데, 테이블에는 도시코드로 들어가야함 - CASE WHEN THEN
	
	
	
	
	
	
	
	
}
