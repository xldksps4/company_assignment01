package com.nd.assignment.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nd.assignment.common.all.pagenation.OraclePagination;
import com.nd.assignment.ndboard.biz.TotalStaffBiz;
import com.nd.assignment.ndboard.dto.TotalStaffDto;


@Controller
public class NdboardController {

	private static final Logger logger = LoggerFactory.getLogger(NdboardController.class);

	@Autowired
	private TotalStaffBiz totalstaffBiz;
	
	//리스트 페이지로 가기
	@RequestMapping(value = "/goboardlist.do")
	public String goBoardList(Model model, TotalStaffDto totalstaffDto, @RequestParam(defaultValue = "1") int currentPage) {
		logger.info("[Controller]____goBoardList TotalStaffDto >>>> : " + totalstaffDto);
		
		//게시물 개수
		int totalBoard = totalstaffBiz.getTotalBoard(totalstaffDto);
		logger.info("[Controller]__[총개시물 개수] >>>>>>>>>>>> : " + totalBoard);  
		
		OraclePagination pagination = new OraclePagination(5, 5, totalBoard, currentPage);
		totalstaffDto.setStartBoardNo(pagination.getStartBoardNo());
		totalstaffDto.setEndBoardNo(pagination.getEndBoardNo());
		
		// 페이징 처리된 게시물 가져오기
		List<TotalStaffDto> totalList = totalstaffBiz.boardList(totalstaffDto);

		logger.info("[Controller]__totalDto 값 >>> "+ totalList);
		
		model.addAttribute("totalList", totalList);
		model.addAttribute("pagination", pagination);
		
		return "staff_search_form";
	}
	

	
	
	
	//글작성페이지로 가기
	@RequestMapping(value = "/goboardwrite.do")
	public String goBoardInsert() {
		
		
		return "staff_input_form";
	}
	
	//글작성 완료
	
	
	//글 수정페이지로 가기
	@RequestMapping(value = "/goboardupdate.do", method = RequestMethod.GET)
	public String goBoardUpdate(Model model, @RequestParam("staffno") int staffno, TotalStaffDto totalstaffDto){
		logger.info("[Controller]____goBoardUpdate staffno >>>> "+ staffno);
		
//		totalstaffDto = totalstaffBiz.();
//		model.addAttribute("totalList", totalstaffDto);
		
		return "staff_updel_form";
	}
	
	//글 수정 완료
	
	//글 삭제 완료
	
	
	
	
	
	
	
	
	
	
	
	
	
}
