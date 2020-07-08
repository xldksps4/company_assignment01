package com.nd.assignment.ndboard.dao;

import java.util.Arrays;

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

	@Override
	public HibernateStaffDto selectJumin(HibernateStaffDto dto) {
		logger.info("[DaoImpl]____selectOne입니다. dto >>> " + dto);
		
		return sqlSession.selectOne(NAMESPACE+"selectJumin",dto);
	}

	@Override
	public int insertInfo(HibernateStaffDto dto) {
		logger.info("[DaoImpl]____insertInfo >>>>"+ dto);
		int res1 = 0;
		int[] res2 = new int[dto.getSkillnameList().size()] ;
		
		res1 = sqlSession.insert(NAMESPACE+"insertStaffOne",dto);
		//성공 후, 번호 조회해서 넣어주기
		dto.setStaffno(selectJumin(dto).getStaffno());
		logger.info("작성 res1 결과>>>>"+res1);
		
		if(res1 != 0) {
			if(dto.getSkillnameList().size()>0) {
				logger.info("작성 res1 결과>>>>"+dto.getSkillnameList().size());
				for(int i=0; i<dto.getSkillnameList().size(); i++) {
					logger.info(" 작성 res1 결과>>>>"+dto.getSkillnameList().get(i));
					dto.setSkillname(dto.getSkillnameList().get(i));
					res2[i] = sqlSession.insert(NAMESPACE+"insertStaffTwo",dto);
				}
			}
			
		}
		logger.info("res2 결과 >>>>"+Arrays.toString(res2));
		
		return res1;
	}

	@Override
	public int updateInfo(HibernateStaffDto dto) {
		logger.info("[DaoImpl]____updateInfo >>>>"+ dto);
		
		int res1 = 0;
		int[] res2 = new int[dto.getSkillnameList().size()] ;
		
		res1 = sqlSession.insert(NAMESPACE+"updateStaffOne",dto);
		logger.info("수정 res1 결과>>>>"+res1);
		
		if(res1 != 0) {
			if(dto.getSkillnameList().size()>0) {
				logger.info("수정 res1 결과>>>>"+dto.getSkillnameList().size());
				for(int i=0; i<dto.getSkillnameList().size(); i++) {
					logger.info(" 수정 res1 결과>>>>"+dto.getSkillnameList().get(i));
					dto.setSkillname(dto.getSkillnameList().get(i));
					res2[i] = sqlSession.insert(NAMESPACE+"updateStaffTwo",dto);
				}
			}
			
		}
		logger.info("res2 결과 >>>>"+Arrays.toString(res2));
		
		return res1;
	}


}
