package com.hongsi.purchshop.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PurchOutputVO {
	
	// 생산 정보
	private long 	cno;		// cno
	// 날짜 입력할 때만 해당된다.
	// 화면의 날짜 형식이 String이므로 날짜형식에 맞지 않아서 형식은 맞춰서 입력을 받아야 오류가 나지 않는다.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	outputDate;	// 생산일자 
	private long 	ori;		// ori 생산 gram
	private long 	erl;		// erl 생산 gram
	private long 	stc;		// stc 생산 gram
	private String  gubun;		// 생산 구분 : 생산, 교환, 반품, 손실, 샘플
	private String 	comm;		// 비고
	private String 	manager;	// 담당자	
	private String 	gubunCode;	// 	
	private String 	status;		// 상태	
	private long 	flag;		// 재료 입력 1 / 수정 2 / 삭제 4 여부 확인용
	
 	private long 	ori_sum;		
	private long 	erl_sum;
	private long 	stc_sum;	

	private long 	locate;			// Modify 수정 or 삭제 처리 후 콜한 곳으로 가기 위한 값(1 :product.jsp / 2:productAllList.jsp)
	
}
/*

CREATE TABLE PURCH_OUTPUT ( 
CNO NUMBER NOT NULL PRIMARY KEY, 
OUTPUTDATE DATE, 
ORI NUMBER DEFAULT 0, 
ERL NUMBER DEFAULT 0, 
STC NUMBER DEFAULT 0, 
GUBUN VARCHAR2(50), 
COMM VARCHAR2(4000), 
MANAGER VARCHAR2(30), 
GUBUNCODE VARCHAR2(30), 
STATUS VARCHAR2(30), 
RDATE DATE DEFAULT SYSDATE, 
FLAG NUMBER DEFAULT 0, 
UDATE DATE DEFAULT SYSDATE );

CREATE SEQUENCE PURCHOUTPUT_PK
INCREMENT BY 1
START WITH 1;		

*/		
