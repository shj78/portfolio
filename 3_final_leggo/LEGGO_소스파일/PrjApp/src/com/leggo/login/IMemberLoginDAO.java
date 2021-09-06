package com.leggo.login;

import java.util.Map;

public interface IMemberLoginDAO
{
	// 로그인
	public MemberLoginDTO Login(MemberLoginDTO dto);

	// 카카오 로그인
	public MemberLoginDTO KakaoLogin(MemberLoginDTO dto);
	
	// 회원상태 확인(정상, 차단)
	public String MemAcctCck(String mem_id);
	
	// 자동로그인 등록
	public void AutoLoginUpdate(MemberAutoLoginDTO dto);
	
	// 자동로그인 확인
	public MemberAutoLoginDTO AutoLoginCck(String session_id);
	
	// 자동로그인 삭제
	public void AutoLoginDel(String session_id);
	
	// 회원가입 인증필요 여부 확인
	//public String SigninAuthCck(String mem_id);
	
	// 회원가입 인증 완료
	//public void SigninAuthUpdate(String mem_id);
	
	// 프로필 사진 가져오기
	public String getMemImg(String mem_id);
}
