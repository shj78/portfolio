package com.leggo.plan;

public class PlanResponseDTO
{

	private String plCd;
	private String plTt;		// 일정 제목
	private String plStt;		// 일정 소제목
	private String plStrtDt;	// 일정 시작일
	private String plEndDt;	// 일정 종료일
	private String plPpl;		// 일정 작성일(Default라 뺌), 일정 예상 인원, 일정 공개 여부
	private String openCd;
	private String memCd;
	
	public String getPlCd()
	{
		return plCd;
	}
	public void setPlCd(String plCd)
	{
		this.plCd = plCd;
	}
	public String getPlTt()
	{
		return plTt;
	}
	public void setPlTt(String plTt)
	{
		this.plTt = plTt;
	}
	public String getPlStt()
	{
		return plStt;
	}
	public void setPlStt(String plStt)
	{
		this.plStt = plStt;
	}
	public String getPlStrtDt()
	{
		return plStrtDt;
	}
	public void setPlStrtDt(String plStrtDt)
	{
		this.plStrtDt = plStrtDt;
	}
	public String getPlEndDt()
	{
		return plEndDt;
	}
	public void setPlEndDt(String plEndDt)
	{
		this.plEndDt = plEndDt;
	}
	public String getPlPpl()
	{
		return plPpl;
	}
	public void setPlPpl(String plPpl)
	{
		this.plPpl = plPpl;
	}
	public String getOpenCd()
	{
		return openCd;
	}
	public void setOpenCd(String openCd)
	{
		this.openCd = openCd;
	}
	public String getMemCd()
	{
		return memCd;
	}
	public void setMemCd(String memCd)
	{
		this.memCd = memCd;
	}
	
	public static PlanResponseDTO buildFromPlanDTO(PlanDTO plan) {
		PlanResponseDTO dto = new PlanResponseDTO();
		dto.setPlCd(plan.getPL_CD());
		dto.setMemCd(plan.getMEM_CD());
		dto.setOpenCd(plan.getOPEN_CD());
		dto.setPlTt(plan.getPL_TT());
		dto.setPlStt(plan.getPL_STT());
		dto.setPlStrtDt(plan.getPL_STRT_DT());
		dto.setPlEndDt(plan.getPL_END_DT());
		dto.setPlPpl(plan.getPL_PPL());
		return dto;
	}
	
}
