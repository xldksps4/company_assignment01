package com.nd.assignment.ndboard.biz;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nd.assignment.ndboard.dao.HibernateDao;
import com.nd.assignment.ndboard.dto.HibernateStaffDto;

@Service
public class HibernateBizImpl implements HibernateBiz {

	private Logger logger = LoggerFactory.getLogger(HibernateBizImpl.class);
	
	@Autowired
	private HibernateDao dao;

	
	@Override
	public HibernateStaffDto selectOne(int staffno) {
		logger.info("[BizImpl]__Hiber__selectOne입니다. staffno: "+staffno);
		return dao.selectOne(staffno);
	}
	
	@Override
	public HibernateStaffDto selectJumin(HibernateStaffDto dto) {
		// TODO Auto-generated method stub
		return dao.selectJumin(dto);
	}

	@Override
	public int insertInfo(HibernateStaffDto dto) {
		// TODO Auto-generated method stub
		return dao.insertInfo(dto);
	}


	@Override
	public int updateInfo(HibernateStaffDto dto) {
		logger.info("업데이트하러 갑니다 다오로~!!");
		return dao.updateInfo(dto);
	}




}
