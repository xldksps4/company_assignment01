package com.nd.assignment.ndboard.biz;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nd.assignment.ndboard.dao.TotalStaffDao;
import com.nd.assignment.ndboard.dto.TotalStaffDto;

@Service
public class TotalStaffBizImpl implements TotalStaffBiz {

	private Logger logger = LoggerFactory.getLogger(TotalStaffBizImpl.class);
	
	@Autowired
	private TotalStaffDao totalstaffDao;

	
	@Override
	   public int getTotalBoard(TotalStaffDto dto) {
	      logger.info("[BizImpl]____getTotalBoard입니다. dto: "+dto);
	      return totalstaffDao.getTotalBoard(dto);
	}
	
	@Override
	public List<TotalStaffDto> boardList(TotalStaffDto dto) {
		logger.info("[BizImpl]____boardList입니다. dto: "+dto);
		return totalstaffDao.boardList(dto);
	}
	
	
	
}
