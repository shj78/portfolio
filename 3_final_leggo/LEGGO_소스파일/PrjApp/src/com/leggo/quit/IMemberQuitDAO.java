/*========================
 * IPlanDAO.java
	- 인터페이스
==========================*/

package com.leggo.quit;


public interface IMemberQuitDAO
{
	  public int InsertQuitMember(String mem_id);
	  public int DeleteQuitMember(String mem_id);
}
