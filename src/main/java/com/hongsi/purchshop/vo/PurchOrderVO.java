package com.hongsi.purchshop.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PurchOrderVO {
	
	// 주문이 오면 생산에 들어가 위해 사용
	private long 	cno;		// cno
	private Date 	orderDate;	// 주문일자 
	private long 	ori_250;	// ori_250 주문갯수
	private long 	ori_500;	// ori_500 주문갯수
	private long 	ori_1000;	// ori_1000 주문갯수
	private long 	erl_250;	// erl_250 주문갯수
	private long 	erl_500;	// erl_500 주문갯수
	private long 	erl_1000;	// erl_1000 주문갯수
	private long 	sns_250;	// sns_250 주문갯수
	private long 	sns_500;	// sns_500 주문갯수
	private long 	sns_1000;	// sns_1000 주문갯수
	private String  gubun;		// 주문 구분 : 판매
	private String  salePath;		// 주문경로 : 개별구매, Naver쇼핑, 홈페이지
	private String 	orderer;	// 주문자
	private String 	comm;		// 비고
	private String 	manager;	// 담당자
	
	private long 	ori_250_sum;	// ori_250 주단위 주문갯수
	private long 	ori_500_sum;	// ori_500 주단위 주문갯수
	private long 	ori_1000_sum;	// ori_1000 주단위 주문갯수
	private long 	erl_250_sum;	// erl_250 주단위 주문갯수
	private long 	erl_500_sum;	// erl_500 주단위 주문갯수
	private long 	erl_1000_sum;	// erl_1000 주단위 주문갯수
	private long 	sns_250_sum;	// sns_250 주단위 주문갯수
	private long 	sns_500_sum;	// sns_500 주단위 주문갯수
	private long 	sns_1000_sum;	// sns_1000 주단위 주문갯수
 	private long 	ori_sum;		
	private long 	erl_sum;
	private long 	sns_sum;
	
	private String 	ori_250_format;	// ori_250 주문갯수
	private String 	ori_500_format;	// ori_500 주문갯수
	private String 	ori_1000_format;	// ori_1000 주문갯수
	private String 	erl_250_format;	// erl_250 주문갯수
	private String 	erl_500_format;	// erl_500 주문갯수
	private String 	erl_1000_format;	// erl_1000 주문갯수
	private String 	sns_250_format;	// sns_250 주문갯수
	private String 	sns_500_format;	// sns_500 주문갯수
	private String 	sns_1000_format;	// sns_1000 주문갯수
	
	private String  gubunCode;		// 제품 재고에 더할 값인지 뺄 값인지 구하기 위함 (더할 값: in/ 뺄 값: out )
	private String  status;			// 제품 판매(shop)에서 입력되는지. 생산 입출고(product)에서 입력되는지 구분을 위한 값 (shop/product)
	private long 	flag;			// 재료 입력 1 / 수정 2 / 삭제 4 여부 확인용
	
}


/*
CREATE TABLE PURCHORDER (
		CNO number not null primary key,
		ORDERDATE  DATE not null,
		ORI_250 NUMBER DEFAULT 0,
		ORI_500 NUMBER DEFAULT 0,
		ORI_1000 NUMBER DEFAULT 0,
		ERL_250 NUMBER DEFAULT 0,
		ERL_500 NUMBER DEFAULT 0,
		ERL_1000 NUMBER DEFAULT 0,
		SNS_250 NUMBER DEFAULT 0,
		SNS_500 NUMBER DEFAULT 0,
		SNS_1000 NUMBER DEFAULT 0,
		GUBUN varchar2(20),	
		SALEPATH varchar2(30),	
		ORDERER varchar2(40),
		COMM varchar2(200),
		MANAGER varchar2(20),
		GUBUNCODE VARCHAR2(30),
		STATUS VARCHAR2(30),
		ADMIT VARCHAR2(10),
		RDATE timestamp default sysdate );
		
create sequence  PURCHORDER_PK
increment by 1
start with 1
maxvalue 99999;	
	
*/		
