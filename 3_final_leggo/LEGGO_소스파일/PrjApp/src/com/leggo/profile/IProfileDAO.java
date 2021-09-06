package com.leggo.profile;

public interface IProfileDAO
{
	// 내 프로필 조회
	public ProfileDTO ProfileSelect(String mem_id);
	
	// 프로필 수정용 조회
	public ProfileDTO ProfileSetting(String mem_id);
	
	// 프로필 수정(프로필 이미지)
	public void ProfileSettingImg(ProfileDTO dto);

	// 프로필 수정(별명)
	public void ProfileSettingNnm(ProfileDTO dto);
	
	// 존재하는 별명인지 확인
	public int MemNnmCck(ProfileDTO dto);

	// 프로필 수정(자기소개)
	public void ProfileSettingIntro(ProfileDTO dto);
}
