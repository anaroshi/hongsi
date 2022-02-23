package com.hongsi.purchshop.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PurchProductVO {
	
	// 생산 정보
	private long 	cno;		// cno	
	private Date 	productDate;	// 생산일자 
	private long 	ori_250;	// ori_250 생산 갯수
	private long 	ori_500;	// ori_500 생산 갯수
	private long 	ori_1000;	// ori_1000 생산 갯수
	private long 	erl_250;	// erl_250 생산 갯수
	private long 	erl_500;	// erl_500 생산 갯수
	private long 	erl_1000;	// erl_1000 생산 갯수
	private long 	stc_250;	// stc_250 생산 갯수
	private long 	stc_500;	// stc_500 생산 갯수
	private long 	stc_1000;	// stc_1000 생산 갯수
	private String  gubun;		// 생산 구분 : 생산, 교환, 반품, 손실, 샘플
	private String 	comm;		// 비고
	private String 	manager;	// 담당자	
	private String 	gubunCode;	// 담당자	
	private String 	status;		// 담당자	
	
	private String 	ori_250_format;		// ori_250 생산 갯수 포맷형   ORI_250 : 999,999,999 개,
	private String 	ori_500_format;		// ori_500 생산 갯수 포맷형   ORI_250 : 999,999,999 개,
	private String 	ori_1000_format;	// ori_1000 생산 갯수 포맷형   ORI_250 : 999,999,999 개,
	private String 	erl_250_format;		// erl_250 생산 갯수 포맷형   ERL_250 : 999,999,999 개,
	private String 	erl_500_format;		// erl_500 생산 갯수 포맷형   ERL_500 : 999,999,999 개,
	private String 	erl_1000_format;	// erl_1000 생산 갯수 포맷형   ERL_1000 : 999,999,999 개,
	private String 	stc_250_format;		// stc_250 생산 갯수 포맷형   STC_250 : 999,999,999 개,
	private String 	stc_500_format;		// stc_500 생산 갯수 포맷형   STC_500 : 999,999,999 개,
	private String 	stc_1000_format;	// stc_1000 생산 갯수 포맷형   STC_1000 : 999,999,999 개,

	private long 	ori_250_sum;	// ori_250 생산 갯수
	private long 	ori_500_sum;	// ori_500 생산 갯수
	private long 	ori_1000_sum;	// ori_1000 생산 갯수
	private long 	erl_250_sum;	// erl_250 생산 갯수
	private long 	erl_500_sum;	// erl_500 생산 갯수
	private long 	erl_1000_sum;	// erl_1000 생산 갯수
	private long 	stc_250_sum;	// stc_250 생산 갯수
	private long 	stc_500_sum;	// stc_500 생산 갯수
	private long 	stc_1000_sum;	// stc_1000 생산 갯수
 	private long 	ori_sum;		
	private long 	erl_sum;
	private long 	stc_sum;

	private long 	flag;			// 재료 입력 1 / 수정 2 / 삭제 4 여부 확인용
	private long 	locate;			// Modify 수정 or 삭제 처리 후 콜한 곳으로 가기 위한 값(1 :product.jsp / 2:productAllList.jsp)
	
}


/*

CREATE TABLE PURCH_PRODUCT ( 
CNO NUMBER NOT NULL PRIMARY KEY, 
PRODUCTDATE DATE, 
ORI_250 NUMBER DEFAULT 0, 
ORI_500 NUMBER DEFAULT 0, 
ORI_1000 NUMBER DEFAULT 0, 
ERL_250 NUMBER DEFAULT 0, 
ERL_500 NUMBER DEFAULT 0, 
ERL_1000 NUMBER DEFAULT 0, 
STC_250 NUMBER DEFAULT 0, 
STC_500 NUMBER DEFAULT 0, 
STC_1000 NUMBER DEFAULT 0, 
GUBUN VARCHAR2(50), 
COMM VARCHAR2(4000), 
MANAGER VARCHAR2(30), 
GUBUNCODE VARCHAR2(30), 
STATUS VARCHAR2(30), 
RDATE DATE DEFAULT SYSDATE, 
FLAG NUMBER DEFAULT 0, 
UDATE DATE DEFAULT SYSDATE );

CREATE SEQUENCE PURCHPRODUCT_PK
INCREMENT BY 1
START WITH 1
MAXVALUE 99999;		

*/		
