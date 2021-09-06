package com.leggo.myphoto;

public interface IMyPhotoDAO
{
	// 작성한 사진 게시글 목록 조회
	public MyPhotoDTO MyPhotoSelect(String mem_id);
}
