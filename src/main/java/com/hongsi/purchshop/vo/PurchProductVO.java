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
	private long 	sns_250;	// sns_250 생산 갯수
	private long 	sns_500;	// sns_500 생산 갯수
	private long 	sns_1000;	// sns_1000 생산 갯수
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
	private String 	sns_250_format;		// sns_250 생산 갯수 포맷형   SNS_250 : 999,999,999 개,
	private String 	sns_500_format;		// sns_500 생산 갯수 포맷형   SNS_500 : 999,999,999 개,
	private String 	sns_1000_format;	// sns_1000 생산 갯수 포맷형   SNS_1000 : 999,999,999 개,

	private long 	ori_250_sum;	// ori_250 생산 갯수
	private long 	ori_500_sum;	// ori_500 생산 갯수
	private long 	ori_1000_sum;	// ori_1000 생산 갯수
	private long 	erl_250_sum;	// erl_250 생산 갯수
	private long 	erl_500_sum;	// erl_500 생산 갯수
	private long 	erl_1000_sum;	// erl_1000 생산 갯수
	private long 	sns_250_sum;	// sns_250 생산 갯수
	private long 	sns_500_sum;	// sns_500 생산 갯수
	private long 	sns_1000_sum;	// sns_1000 생산 갯수
 	private long 	ori_sum;		
	private long 	erl_sum;
	private long 	sns_sum;
	
}


/*

CREATE TABLE PURCHPRODUCT (
	CNO NUMBER NOT NULL PRIMARY KEY,
	PRODUCTDATE DATE NOT NULL,
	ORI_250 NUMBER DEFAULT 0,
	ORI_500 NUMBER DEFAULT 0,
	ORI_1000 NUMBER DEFAULT 0,
	ERL_250 NUMBER DEFAULT 0,
	ERL_500 NUMBER DEFAULT 0,
	ERL_1000 NUMBER DEFAULT 0,
	SNS_250 NUMBER DEFAULT 0,
	SNS_500 NUMBER DEFAULT 0,
	SNS_1000 NUMBER DEFAULT 0,
	GUBUN VARCHAR2(50),	
	COMM VARCHAR2(50),
	MANAGER VARCHAR2(30),
	GUBUNCODE VARCHAR2(30),
	STATUS VARCHAR2(30),	
	RDATE DATE DEFAULT SYSDATE 
);

CREATE SEQUENCE PURCHPRODUCT_PK
INCREMENT BY 1
START WITH 1
MAXVALUE 99999;		

*/		
