package com.nd.assignment.controller;

import java.util.ArrayList;
import java.util.Arrays;
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

	// 리스트 페이지로 가기
	@RequestMapping(value = "/goboardlist.do")
	public String goBoardList(Model model, TotalStaffDto totalstaffDto,
			@RequestParam(value = "currentPage", defaultValue = "0") int currentPage) {
		logger.info("[Controller]____goBoardList TotalStaffDto >>>> : " + totalstaffDto);
		logger.info("[\" :>>>> \", currentPage]" + currentPage);
		if (currentPage < 1) {
			logger.info("[Controller]____goBoardList 첫 화면 집입");
			return "staff_search_form";
		} else {
			// 게시물 개수
			int totalBoard = totalstaffBiz.getTotalBoard(totalstaffDto);
			logger.info("[Controller]__[총개시물 개수] >>>>>>>>>>>> : " + totalBoard);

			OraclePagination pagination = new OraclePagination(5, 5, totalBoard, currentPage);
			totalstaffDto.setStartBoardNo(pagination.getStartBoardNo());
			totalstaffDto.setEndBoardNo(pagination.getEndBoardNo());

			// 페이징 처리된 게시물 가져오기
			List<TotalStaffDto> totalList = totalstaffBiz.boardList(totalstaffDto);

			logger.info("[Controller]__totalDto 값 >>> " + totalList);

			model.addAttribute("totalList", totalList);
			model.addAttribute("pagination", pagination);

		}
		return "staff_search_form";
	}

	// 글작성페이지로 가기
	@RequestMapping(value = "/goboardwrite.do")
	public String goBoardInsert(Model model) {

		HibernateStaffDto hibernateList = new HibernateStaffDto();
		model.addAttribute("hibernateList", hibernateList);
		return "staff_updel_form";
	}

	// 글작성 완료

	// 글 수정페이지로 가기
	@RequestMapping(value = "/goboardupdate.do", method = RequestMethod.GET)
	public String goBoardUpdate(Model model, @RequestParam("staffno") int staffno, TotalStaffDto totalstaffDto) {
		logger.info("[Controller]____goBoardUpdate staffno >>>> " + staffno);
		logger.info("[Controller]____goBoardUpdate totalstaffDto >>>> " + totalstaffDto);

		// 글번호 조회
		totalstaffDto = totalstaffBiz.selectOne(staffno);
		logger.info("[Controller]__[DB_Result]__hibernateList 값 >>>" + totalstaffDto);

		/* 추가 : 날자 형식 변환 1983-12-21 00:00:00 >>> 1983-12-21 */

		totalstaffDto.setGraduateday(totalstaffDto.getGraduateday().substring(0, 10));

		// 글수정 페이지 구분자 dummyUpdateDto
		String dummyUpdateDto = totalstaffDto.getJuminno();

		model.addAttribute("hibernateList", totalstaffDto);
		model.addAttribute("dummyUpdateDto", dummyUpdateDto);

		return "staff_updel_form";
	}

	// 글 수정 완료
	@RequestMapping(value = "/inputstaff.do")
	public String inputStaff(Model model, @ModelAttribute("hibernateList") @Valid HibernateStaffDto hibernateList,
			BindingResult result) {
		logger.info("[Controller]____inputStaff입니다. dto값 >>>>" + hibernateList);

		if (result.hasErrors()) {
			logger.info("유효성검사 >>>> 실행 hibernateList >>>" + hibernateList);
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError error : list) {
				logger.info("에러 실행중 >>>> error >>>>" + error);
				System.out.println(error);
			}
			logger.info("유효성검사 >>>> 실패");

			// model.addAttribute("hibernateList", hibernateList); 필요없음 뷰로 리턴시 @Valid가 자동으로
			// 해줌
			return "staff_updel_form";

		} else {
			logger.info("유효성 검사 >>>> 통과  : " + hibernateList);

			// [#1 유효성 검사 이후 ] >>>>> DB에 값 추가전에 [String skillname] => [List<String>
			// skillnameList]
			if (hibernateList.getSkillname() != null) {

				String[] skillnameArray = hibernateList.getSkillname().split(",");
				logger.info("skillnameArray >>>" + Arrays.toString(skillnameArray));
				List<String> skillnameList = new ArrayList<String>();

				for (int j = 0; j < skillnameArray.length; j++) {
					skillnameList.add(skillnameArray[j]);
				}

				hibernateList.setSkillnameList(skillnameList);

			}
			// String JUMIN_NO = biz.selectOne(skillnameList.getJUMIN_NO());

			// [#2 유효성 검사 이후 ] >>>>> 주민번호 조회 등록 유무로 insert, update 판단.
			logger.info("juminDto 검사시작");
			HibernateStaffDto juminDto = hibernateBiz.selectJumin(hibernateList);
			logger.info("juminDto 검사종료");
		

			if (juminDto == null) { // [#3 유효성 검사 이후 ] >>>>> insert
				logger.info("등록되어 있지 않음 >>>>> insert!!");
				int insertRes = hibernateBiz.insertInfo(hibernateList);
				logger.info("[DB]글작성 성공여부. insertRes : " + hibernateList); // <<<<<<<<<<<성공, 1

				if (insertRes > 0) {
					logger.info("[Controller]__[DB_Result]__infoUpdate 성공 >>>> ");
//					HibernateStaffDto hibernateStaffDtoRes = totalstaffBiz.selectOne(sduserDto.getSduemail());
					// HibernateStaffDto hibernateStaffDtoRes =
					// hibernateBiz.selectOne(hibernateList.getStaffno());

					// model.addAttribute("totalList", hibernateStaffDtoRes);
					// logger.info("작성 성공 후 화면 전환 직전 값 확인" + hibernateStaffDtoRes); //
					// <<<<<<<<<<<<<얘는 null
					logger.info("작성 성공 후 화면 전환 직전 값 확인");
					return "redirect:/goboardlist.do";
				}

			} else if (juminDto != null) { // [#4 유효성 검사 이후 ] >>>>> update
				logger.info("등록되어 있지 않음 >>>>> update!!");
				int updateRes = hibernateBiz.updateInfo(hibernateList);
				logger.info("[DB]글작성 업데이트 성공여부. updateRes : " + hibernateList); // <<<<<<<<<<<성공, 1
				if (updateRes > 0) {
					logger.info("[Controller]__[DB_Result]__infoUpdate 성공 >>>> ");
//					HibernateStaffDto hibernateStaffDtoRes = totalstaffBiz.selectOne(sduserDto.getSduemail());
					// HibernateStaffDto hibernateStaffDtoRes =
					// hibernateBiz.selectOne(hibernateList.getStaffno());

					// model.addAttribute("totalList", hibernateStaffDtoRes);
					// logger.info("작성 성공 후 화면 전환 직전 값 확인" + hibernateStaffDtoRes); //
					// <<<<<<<<<<<<<얘는 null
					logger.info("작성 성공 후 화면 전환 직전 값 확인");
					return "redirect:/goboardlist.do";
				}

			}

		}

		return "redirect:/goboardlist.do";
	}

	// 글 삭제 완료

}
