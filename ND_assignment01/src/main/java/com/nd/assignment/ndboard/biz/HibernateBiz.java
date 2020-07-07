package com.nd.assignment.ndboard.biz;

import com.nd.assignment.ndboard.dto.HibernateStaffDto;

public interface HibernateBiz {

	// 글 하나만 보기
	public HibernateStaffDto selectOne(int staffno);
}
