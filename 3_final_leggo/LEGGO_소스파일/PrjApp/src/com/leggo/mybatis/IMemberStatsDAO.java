package com.leggo.mybatis;

import java.util.ArrayList;

public interface IMemberStatsDAO
{	
	// 회원 가입 통계 리스트
	public ArrayList<MemberStatsDTO> joinList();
	
	// 중복 날짜 제거 후 회원 가입일 수 
	public int joinCount();
	
	// 가입방식 통계 
	public MemberStatsDTO joinMtd();
	
	// 오늘부터 6일전까지 가입자 수 
	public ArrayList<MemberStatsDTO> joinDayList();
	
	// 탈퇴 통계 리스트
	public ArrayList<MemberStatsDTO> qrdList();
	
	// 중복 날짜 제거 후 탈퇴 일 수 
	public int qrdCount();
	
	// 탈퇴 사유 통계 
	public MemberStatsDTO qrdRsn();
	
	// 오늘부터 6일전까지 탈퇴자 수 
	public ArrayList<MemberStatsDTO> qrdDayList();
}
