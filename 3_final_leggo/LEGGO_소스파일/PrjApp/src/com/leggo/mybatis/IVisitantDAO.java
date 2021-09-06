package com.leggo.mybatis;

import java.util.ArrayList;

public interface IVisitantDAO
{
	// 접속자 리스트
	public ArrayList<VisitantDTO> list();
	
	// 사이트 접속자 총 수
	public int totCount();
	
	// 5일전 ~ 오늘 접속자 수
	public ArrayList<VisitantDTO> dayList();
	
	// 현재 시간 부터 7시간 전 접속자 수
	public ArrayList<VisitantDTO> timeList();
	
	// 접속자 추가 
	public int add(VisitantDTO v);
}
