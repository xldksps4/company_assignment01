package com.nd.assignment.ndboard.dao;

import com.nd.assignment.ndboard.dto.HibernateStaffDto;

public interface HibernateDao {

	String NAMESPACE = "totalstaff.";
	
	// 글 하나만 보기
	public HibernateStaffDto selectOne(int staffno);
}
