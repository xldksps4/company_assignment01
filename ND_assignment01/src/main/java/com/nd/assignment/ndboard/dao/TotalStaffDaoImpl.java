package com.nd.assignment.ndboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nd.assignment.ndboard.dto.TotalStaffDto;

@Repository
public class TotalStaffDaoImpl implements TotalStaffDao {

	private static final Logger logger = LoggerFactory.getLogger(TotalStaffDaoImpl.class);

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getTotalBoard(TotalStaffDto dto) {
		logger.info("[DaoImpl]____getTotalBoard입니다. dto >>> " + dto);
		return sqlSession.selectOne(NAMESPACE + "getTotalBoard", dto);
	}

	@Override
	public List<TotalStaffDto> boardList(TotalStaffDto dto) {
		logger.info("[DaoImpl]____boardList입니다. dto >>> " + dto);
		return sqlSession.selectList(NAMESPACE + "boardList", dto);
	}
	
	@Override
	public List<TotalStaffDto> boardListAsc(TotalStaffDto dto) {
		logger.info("[DaoImpl]____boardListAsc입니다. dto >>> " + dto);
		return sqlSession.selectList(NAMESPACE + "boardListAsc", dto);
	}


	@Override
	public TotalStaffDto selectOne(int staffno) {
		logger.info("[DaoImpl]____selectOne입니다. staffno >>> " + staffno);
		return sqlSession.selectOne(NAMESPACE+"selectOne", staffno);
	}


	
}
