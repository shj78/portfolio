/*========================
 * IPlanDAO.java
	- 인터페이스
==========================*/

package com.leggo.plan;

import java.util.List;

public interface IPlanDAO
{
	  int insertplan(PlanDTO p);
	  int insertaddloc(PlanADTO a);
	  List<PlanDTO> selectPlanList();
	  PlanDTO selectPlan(String pl_cd);
	  List<PlanADTO> selectLocationList(String pl_cd);
}
