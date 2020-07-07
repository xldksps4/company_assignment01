package com.nd.assignment.ndboard.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nd.assignment.ndboard.dto.HibernateStaffDto;

@Repository
public class HibernateDaoImpl implements HibernateDao {

	private static final Logger logger = LoggerFactory.getLogger(HibernateDaoImpl.class);

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public HibernateStaffDto selectOne(int staffno) {
		logger.info("[DaoImpl]____selectOne입니다. staffno >>> " + staffno);
		return sqlSession.selectOne(NAMESPACE+"selectOne", staffno);
	}

}
