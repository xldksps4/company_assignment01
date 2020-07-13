package com.nd.assignment.ndboard.dto;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class TotalStaffDto {
	
	
	/*---------- TB_code_skill ----------*/
	private int skillcode;
	private String skillname;
	
	private List<String> skillnameList;				// > 중복
	
	
	/*---------- TB_code_department ----------*/
	private int departmentcode;
	private String departmentname;
	
	/*---------- TB_code_school ----------*/
	private int schoolcode;
	private String schoolname;
	
	/*---------- TB_staff ----------*/
	private int staffno;
	private String staffname;
	private String staffgender;
	private String juminno;
//	private int schoolcode;	
//	private int departmentcode;
	private String graduateday;
	
	private List<String> graduatedayList;
	
	/*---------- TB_staff_skill_seq ----------*/
	private int staffskillno;
//	private int staffno;
//	private int skillcode;
	
	/*================================== DB 컬럼과 일치하지 않는 추가된 항목 ================================ */
	
	/*---------- 검색 ----------*/
    private String category;
    private String keyword;
    
    /*---------- 페이징 ----------*/
    private int startBoardNo;
    private int endBoardNo;
    
    /*시작일 종료일 */
    private String startDate;
    private String endDate;
    
    private TotalStaffDto myDto;
		
    /*================================== 생성자 ================================ */
    
	public TotalStaffDto() {
		super();
	}

	public TotalStaffDto(int skillcode, String skillname, List<String> skillnameList, int departmentcode,
			String departmentname, int schoolcode, String schoolname, int staffno, String staffname, String staffgender,
			String juminno, String graduateday, List<String> graduatedayList, int staffskillno, String category,
			String keyword, int startBoardNo, int endBoardNo, String startDate, String endDate, TotalStaffDto myDto) {
		super();
		this.skillcode = skillcode;
		this.skillname = skillname;
		this.skillnameList = skillnameList;
		this.departmentcode = departmentcode;
		this.departmentname = departmentname;
		this.schoolcode = schoolcode;
		this.schoolname = schoolname;
		this.staffno = staffno;
		this.staffname = staffname;
		this.staffgender = staffgender;
		this.juminno = juminno;
		this.graduateday = graduateday;
		this.graduatedayList = graduatedayList;
		this.staffskillno = staffskillno;
		this.category = category;
		this.keyword = keyword;
		this.startBoardNo = startBoardNo;
		this.endBoardNo = endBoardNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.myDto = myDto;
	}

	public int getSkillcode() {
		return skillcode;
	}

	public void setSkillcode(int skillcode) {
		this.skillcode = skillcode;
	}

	public String getSkillname() {
		return skillname;
	}

	public void setSkillname(String skillname) {
		this.skillname = skillname;
	}

	public List<String> getSkillnameList() {
		return skillnameList;
	}

	public void setSkillnameList(List<String> skillnameList) {
		this.skillnameList = skillnameList;
	}

	public int getDepartmentcode() {
		return departmentcode;
	}

	public void setDepartmentcode(int departmentcode) {
		this.departmentcode = departmentcode;
	}

	public String getDepartmentname() {
		return departmentname;
	}

	public void setDepartmentname(String departmentname) {
		this.departmentname = departmentname;
	}

	public int getSchoolcode() {
		return schoolcode;
	}

	public void setSchoolcode(int schoolcode) {
		this.schoolcode = schoolcode;
	}

	public String getSchoolname() {
		return schoolname;
	}

	public void setSchoolname(String schoolname) {
		this.schoolname = schoolname;
	}

	public int getStaffno() {
		return staffno;
	}

	public void setStaffno(int staffno) {
		this.staffno = staffno;
	}

	public String getStaffname() {
		return staffname;
	}

	public void setStaffname(String staffname) {
		this.staffname = staffname;
	}

	public String getStaffgender() {
		return staffgender;
	}

	public void setStaffgender(String staffgender) {
		this.staffgender = staffgender;
	}

	public String getJuminno() {
		return juminno;
	}

	public void setJuminno(String juminno) {
		this.juminno = juminno;
	}

	public String getGraduateday() {
		return graduateday;
	}

	public void setGraduateday(String graduateday) {
		this.graduateday = graduateday;
	}

	public List<String> getGraduatedayList() {
		return graduatedayList;
	}

	public void setGraduatedayList(List<String> graduatedayList) {
		this.graduatedayList = graduatedayList;
	}

	public int getStaffskillno() {
		return staffskillno;
	}

	public void setStaffskillno(int staffskillno) {
		this.staffskillno = staffskillno;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getStartBoardNo() {
		return startBoardNo;
	}

	public void setStartBoardNo(int startBoardNo) {
		this.startBoardNo = startBoardNo;
	}

	public int getEndBoardNo() {
		return endBoardNo;
	}

	public void setEndBoardNo(int endBoardNo) {
		this.endBoardNo = endBoardNo;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public TotalStaffDto getMyDto() {
		return myDto;
	}

	public void setMyDto(TotalStaffDto myDto) {
		this.myDto = myDto;
	}

	@Override
	public String toString() {
		return "TotalStaffDto [skillcode=" + skillcode + ", skillname=" + skillname + ", skillnameList=" + skillnameList
				+ ", departmentcode=" + departmentcode + ", departmentname=" + departmentname + ", schoolcode="
				+ schoolcode + ", schoolname=" + schoolname + ", staffno=" + staffno + ", staffname=" + staffname
				+ ", staffgender=" + staffgender + ", juminno=" + juminno + ", graduateday=" + graduateday
				+ ", graduatedayList=" + graduatedayList + ", staffskillno=" + staffskillno + ", category=" + category
				+ ", keyword=" + keyword + ", startBoardNo=" + startBoardNo + ", endBoardNo=" + endBoardNo
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", myDto=" + myDto + "]";
	}

	




	
}
