package eljl.factory.bean;

import java.util.Date;

import lombok.Data;

@Data
public class JunseoBean {
	//성적 목록
	String teId;
	String csCode;
	String opCode;
	String ssCode;
	String ssName;
	String sjCode;
	String stuId;
	String sjTitle;
	String stuTitle;
	Date createDate;
	//출결 목록
	String status;
	//상담일지 목록
	String contents;
	//전체요약 목록
	String teName;	
	String stuName;
	double allGrade;
	int absence;
	int coCount;
	
}
