package com.leggo.plan;

import java.util.List;

public class PlanRequestDTO
{
	private PlanDTO plan;
	private List<PlanADTO> locationList;
	
	public PlanDTO getPlan()
	{
		return plan;
	}
	public void setPlan(PlanDTO plan)
	{
		this.plan = plan;
	}
	public List<PlanADTO> getLocationList()
	{
		return locationList;
	}
	public void setLocationList(List<PlanADTO> locationList)
	{
		this.locationList = locationList;
	}
	
	@Override
	public String toString()
	{
		return "PlanRequestDTO [plan=" + plan + ", locationListSize=" + locationList.size() + "]";
	}
	
	
}
