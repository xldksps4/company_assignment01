package com.nd.assignment.ndboard.biz;

import com.nd.assignment.ndboard.dto.HibernateStaffDto;

public interface HibernateBiz {

	// 회원정보 하나만 보기
	public HibernateStaffDto selectOne(int staffno);
	
	// 회원정보 조회(insert / update 구분)
	public HibernateStaffDto selectJumin(HibernateStaffDto dto);
	
	// 회원정보 등록하기 1-1, 1-2
	public int insertInfo(HibernateStaffDto dto);
	
	// 회원정보 수정하기 2-1, 2-2
	public int updateInfo(HibernateStaffDto dto);
	
	// 회원정보 삭제하기 
	public int deleteInfo(int staffno);
}
