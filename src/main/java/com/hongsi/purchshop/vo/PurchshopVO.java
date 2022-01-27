package com.hongsi.purchshop.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PurchshopVO {
	
	// 주문이 오면 생산에 들어가 위해 사용
	private long 	cno;		// cno
	private Date 	orderDate;	// 주문일자 
	private long 	ori_200;	// ori_200 주문갯수
	private long 	ori_500;	// ori_500 주문갯수
	private long 	ori_1000;	// ori_1000 주문갯수
	private long 	erl_200;	// erl_200 주문갯수
	private long 	erl_500;	// erl_500 주문갯수
	private long 	erl_1000;	// erl_1000 주문갯수
	private long 	sns_200;	// sns_200 주문갯수
	private long 	sns_500;	// sns_500 주문갯수
	private long 	sns_1000;	// sns_1000 주문갯수
	private String  gubun;		// 주문 구분 : 판매
	private String  salePath;		// 주문경로 : 개별구매, Naver쇼핑, 홈페이지
	private String 	orderer;	// 주문자
	private String 	comm;		// 비고
	private String 	manager;	// 담당자
	
	private long 	ori_200_sum;	// ori_200 주단위 주문갯수
	private long 	ori_500_sum;	// ori_500 주단위 주문갯수
	private long 	ori_1000_sum;	// ori_1000 주단위 주문갯수
	private long 	erl_200_sum;	// erl_200 주단위 주문갯수
	private long 	erl_500_sum;	// erl_500 주단위 주문갯수
	private long 	erl_1000_sum;	// erl_1000 주단위 주문갯수
	private long 	sns_200_sum;	// sns_200 주단위 주문갯수
	private long 	sns_500_sum;	// sns_500 주단위 주문갯수
	private long 	sns_1000_sum;	// sns_1000 주단위 주문갯수
 	private long 	ori_sum;		
	private long 	erl_sum;
	private long 	sns_sum;
	
	private String 	ori_200_order;	// ori_200 주문갯수
	private String 	ori_500_order;	// ori_500 주문갯수
	private String 	ori_1000_order;	// ori_1000 주문갯수
	private String 	erl_200_order;	// erl_200 주문갯수
	private String 	erl_500_order;	// erl_500 주문갯수
	private String 	erl_1000_order;	// erl_1000 주문갯수
	private String 	sns_200_order;	// sns_200 주문갯수
	private String 	sns_500_order;	// sns_500 주문갯수
	private String 	sns_1000_order;	// sns_1000 주문갯수
	
	private String  startDate;		// 기준되는 한주의 시작 일요일 구하기
	private String  endDate;		// 기준되는 한주의 시작 토요일 구하기
	private String  toDate;			// 기준되는 한주의 시작 토요일 구하기
	
}


/*
CREATE TABLE PURCHSHOP (
		CNO number not null primary key,
		ORDERDATE  DATE not null,
		ORI_200 NUMBER DEFAULT 0,
		ORI_500 NUMBER DEFAULT 0,
		ORI_1000 NUMBER DEFAULT 0,
		ERL_200 NUMBER DEFAULT 0,
		ERL_500 NUMBER DEFAULT 0,
		ERL_1000 NUMBER DEFAULT 0,
		SNS_200 NUMBER DEFAULT 0,
		SNS_500 NUMBER DEFAULT 0,
		SNS_1000 NUMBER DEFAULT 0,
		GUBUN varchar2(20),	
		SALEPATH varchar2(20),	
		ORDERER varchar2(40),
		COMM varchar2(200),
		MANAGER varchar2(20),
		RDATE timestamp default sysdate );
		
create sequence  PURCHSHOP_PK
increment by 1
start with 1
maxvalue 99999;		
*/		
