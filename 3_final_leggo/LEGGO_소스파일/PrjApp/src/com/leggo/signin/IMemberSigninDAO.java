package com.leggo.signin;

public interface IMemberSigninDAO
{
	// 회원가입
	public void SigninMember();
	public void SigninMemberData(MemberSigninDTO dto);
}