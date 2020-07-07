package com.nd.assignment.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.nd.assignment.common.all.pagenation.OraclePagination;
import com.nd.assignment.ndboard.biz.HibernateBiz;
import com.nd.assignment.ndboard.biz.TotalStaffBiz;
import com.nd.assignment.ndboard.dto.HibernateStaffDto;
import com.nd.assignment.ndboard.dto.TotalStaffDto;



@Controller
public class NdboardController {

	private static final Logger logger = LoggerFactory.getLogger(NdboardController.class);

	@Autowired
	private TotalStaffBiz totalstaffBiz;
	
	@Autowired
	private HibernateBiz hibernateBiz;
	
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
	public String goBoardInsert(Model model) {
		
		HibernateStaffDto hibernateList = new HibernateStaffDto();
		model.addAttribute("hibernateList", hibernateList);
		return "staff_input_form";
	}
	
	//글작성 완료
	
	
	//글 수정페이지로 가기
	@RequestMapping(value = "/goboardupdate.do", method = RequestMethod.GET)
	public String goBoardUpdate(Model model, @RequestParam("staffno") int staffno, TotalStaffDto totalstaffDto){
		logger.info("[Controller]____goBoardUpdate staffno >>>> "+ staffno);
		logger.info("[Controller]____goBoardUpdate totalstaffDto >>>> "+ totalstaffDto);

		//글번호 조회
		totalstaffDto = totalstaffBiz.selectOne(staffno);
		logger.info("[Controller]__[DB_Result]__hibernateList 값 >>>"+totalstaffDto);
		
		//글수정 페이지 구분자 dummyUpdateDto
		String dummyUpdateDto = "dummy";
		
		model.addAttribute("hibernateList", totalstaffDto);
		model.addAttribute("dummyUpdateDto", dummyUpdateDto);
		
		return "staff_updel_form";
	}
	
	//글 수정 완료
	@RequestMapping(value = "/inputstaff.do")
	public String inputStaff(Model model, @ModelAttribute("hibernateStaffDto") @Valid HibernateStaffDto hibernateStaffDto,
			BindingResult result) {
		logger.info("[Controller]____inputStaff입니다. dto값 >>>>"+hibernateStaffDto);
		   //1) 유효성검사

//		   if(유효성 검사 불통과){
//		      받아온 데이터와 함께 뷰로 >>>
//		   } else {
//		   
//		      2) 유효성검사 통과시   >> 주민번호를 검사한다. 
//		      if(주민번호가 있다){
//		         insert
//		      } else{
//		         update
//		      }
//
//		   }
		
			// 하이버네이트유효성검사
			if (result.hasErrors()) {
			logger.info("유효성검사 >>>> 실행");
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				logger.info("에러 실행중 >>>> error >>>>"+ error);
				System.out.println(error);
				}
			logger.info("유효성검사 >>>> 실패");

			model.addAttribute("hibernateError", hibernateStaffDto);
			return "staff_updel_form";
			} else {
				logger.info("유효성 검사 >>>> 통과  : " + hibernateStaffDto);
				// ------------------------------
					
				// 로그인세션이 있다면,  관련 정보들 담아야겠지
//				int updateRes = totalstaffBiz.infoUpdate(dto);
				logger.info("[DB]글작성 업데이트 성공여부. updateRes : " + hibernateStaffDto);  // <<<<<<<<<<<성공, 1
					
//					if (updateRes > 0) {
						logger.info("[Controller]__[DB_Result]__infoUpdate 성공 >>>> ");
//						HibernateStaffDto hibernateStaffDtoRes = totalstaffBiz.selectOne(sduserDto.getSduemail());
						HibernateStaffDto hibernateStaffDtoRes = hibernateBiz.selectOne(hibernateStaffDto.getStaffno());
						
						model.addAttribute("totalList", hibernateStaffDtoRes);
						logger.info("작성 성공 후 화면 전환 직전 값 확인" + hibernateStaffDtoRes);	// <<<<<<<<<<<<<얘는 null
						
						return "redirect:/goboardlist.do";
//					}
					
				}
//				return"redirect:/goboardlist.do";		
	}
	
		
	
	
	//글 삭제 완료
	
	
	
	
	
	
	
	
	
	
	
	
	
}
