/*========================
 * IPlanDAO.java
	- 인터페이스
==========================*/

package com.leggo.plan;


public interface IPlanDAO
{
	  public int insertplan(PlanDTO dto);
	  public int insertaddloc(PlanDTO dto);
}
