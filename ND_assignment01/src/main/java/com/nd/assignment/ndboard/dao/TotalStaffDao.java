package com.nd.assignment.ndboard.dao;

import java.util.List;

import com.nd.assignment.ndboard.dto.TotalStaffDto;

public interface TotalStaffDao {

	String NAMESPACE = "totalstaff.";

	/* 페이징 */
	// 전체 게시물 개수 가져오기
	public int getTotalBoard(TotalStaffDto dto);

	// 전체선택(검색+페이징)
	public List<TotalStaffDto> boardList(TotalStaffDto dto);
	
	// 글 하나만 보기
	public TotalStaffDto selectOne(int staffno);
}
