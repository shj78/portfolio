package com.leggo.follow;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface IFollowDAO
{
	// 팔로워 목록 조회
	public List<FollowDTO> FollowerSelect(String mem_id);
	
	// 팔로잉 목록 조회
	public List<FollowDTO> FollowingSelect(String mem_id);
	
	// 맞팔 여부 확인
	public int followbackCck(@Param("mem_ing_id") String mem_ing_id, @Param("mem_ed_id") String mem_ed_id);
	
	// 팔로우
	public int Follow(@Param("mem_ing_id") String mem_ing_id, @Param("mem_ed_id") String mem_ed_id);

	// 언팔로우
	public int Unfollow(@Param("mem_ing_id") String mem_ing_id, @Param("mem_ed_id") String mem_ed_id);
	
	// 팔로잉 유저 작성 게시글 조회
	public FollowPostDTO FollowingPost(String mem_id);
}
