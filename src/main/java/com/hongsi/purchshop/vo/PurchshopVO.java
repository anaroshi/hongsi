package com.hongsi.purchshop.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PurchshopVO {
	
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
	
	private String 	ori_250_order;	// ori_250 주문갯수
	private String 	ori_500_order;	// ori_500 주문갯수
	private String 	ori_1000_order;	// ori_1000 주문갯수
	private String 	erl_250_order;	// erl_250 주문갯수
	private String 	erl_500_order;	// erl_500 주문갯수
	private String 	erl_1000_order;	// erl_1000 주문갯수
	private String 	sns_250_order;	// sns_250 주문갯수
	private String 	sns_500_order;	// sns_500 주문갯수
	private String 	sns_1000_order;	// sns_1000 주문갯수
	
	private String  startDate;		// 기준되는 한주의 시작 일요일 구하기
	private String  endDate;		// 기준되는 한주의 시작 토요일 구하기
	private String  toDate;			// 기준되는 한주의 시작 토요일 구하기
	
	private String  gubunCode;		// 제품 재고에 더할 값인지 뺄 값인지 구하기 위함 (더할 값: in/ 뺄 값: out )
	private String  status;			// 제품 판매(shop)에서 입력되는지. 생산 입출고(product)에서 입력되는지 구분을 위한 값 (shop/product)
	private Date 	dDate;			// 입출고일자 
}


/*
CREATE TABLE PURCHSHOP (
		CNO number not null primary key,
		ORDERDATE  DATE not null,
		ORI_250 NUMBER DEFAULT 0,
		ORI_500 NUMBER DEFAULT 0,
		ORI_1000 NUMBER DEFAULT 0,
		ERL_200 NUMBER DEFAULT 0,
		ERL_500 NUMBER DEFAULT 0,
		ERL_1000 NUMBER DEFAULT 0,
		SNS_250 NUMBER DEFAULT 0,
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

CNO
ORDER_CNO
SALEDATE
ORI_250
ORI_500
ORI_1000
ERL_200
ERL_500
ERL_1000
SNS_250
SNS_500
SNS_1000
GUBUN
ORDERPATH
SALEPATH
DELEVERYPATH
DELEVERYDATE
ORDERER
COMM
MANAGER
RDATE
	
*/		
