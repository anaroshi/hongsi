package com.hongsi.purchshop.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PurchSaleVO {
	
	// 판매 정보
	private long 	cno;		// cno
	private long 	order_cno;	// 주문 cno
	private Date 	saleDate;	// 판매일자/생산일자 
	private long 	ori_250;	// ori_250 판매갯수
	private long 	ori_500;	// ori_500 판매갯수
	private long 	ori_1000;	// ori_1000 판매갯수
	private long 	erl_250;	// erl_250 판매갯수
	private long 	erl_500;	// erl_500 판매갯수
	private long 	erl_1000;	// erl_1000 판매갯수
	private long 	stc_250;	// stc_250 판매갯수
	private long 	stc_500;	// stc_500 판매갯수
	private long 	stc_1000;	// stc_1000 판매갯수
	private String  gubun;		// 판매 구분 : 판매, 교환, 반품, 손실, 샘플
	private long 	price;		// 금액
	private String 	paymentPath;// 지불방법
	private String  salePath;	// 판매경로 : 개별구매, Naver쇼핑, 홈페이지, 쎈인생블로거
	private String 	deleveryDate;	// 배송일 
	private String  deleveryPath;	// 배송방법 : 택배, 고객수령, 직접배송
	private String 	orderer;	// 주문자
	private String 	comm;		// 비고
	private String 	manager;	// 담당자	
	private String 	gubunCode;	// 담당자	
	private String 	status;		// 담당자	
	private String 	orderDate;	// 주문일 
	
	private long 	ori_250_sum;	// ori_250 판매 갯수
	private long 	ori_500_sum;	// ori_500 판매 갯수
	private long 	ori_1000_sum;	// ori_1000 판매 갯수
	private long 	erl_250_sum;	// erl_250 판매 갯수
	private long 	erl_500_sum;	// erl_500 판매 갯수
	private long 	erl_1000_sum;	// erl_1000 판매 갯수
	private long 	stc_250_sum;	// stc_250 판매 갯수
	private long 	stc_500_sum;	// stc_500 판매 갯수
	private long 	stc_1000_sum;	// stc_1000 판매 갯수
 	private long 	ori_sum;		
	private long 	erl_sum;
	private long 	stc_sum;
	
	private String  startDate;		// 기준되는 한주의 시작 일요일 구하기
	private String  endDate;		// 기준되는 한주의 시작 토요일 구하기
	private String  toDate;			// 기준되는 한주의 시작 토요일 구하기

	private long 	flag;			// 재료 입력 1 / 수정 2 / 삭제 4 여부 확인용
	private long 	locate;			// Modify 수정 or 삭제 처리 후 콜한 곳으로 가기 위한 값(1 :sale.jsp / 2:saleAllList.jsp)
}


/*

CREATE TABLE PURCH_SALE (
CNO NUMBER NOT NULL PRIMARY KEY, 
ORDER_CNO NUMBER, 
SALEDATE DATE, 
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
PRICE NUMBER DEFAULT 0, 
PAYMENTPATH VARCHAR2(50), 
SALEPATH VARCHAR2(50), 
DELEVERYPATH VARCHAR2(50), 
DELEVERYDATE DATE, 
ORDERER VARCHAR2(30), 
COMM VARCHAR2(4000), 
MANAGER VARCHAR2(30), 
GUBUNCODE VARCHAR2(30), 
STATUS VARCHAR2(30), 
RDATE DATE DEFAULT SYSDATE, 
FLAG NUMBER DEFAULT 0, 
UDATE DATE DEFAULT SYSDATE, 
ORDERDATE DATE ); 
   
CREATE SEQUENCE PURCHSALE_PK
INCREMENT BY 1
START WITH 1
MAXVALUE 99999;	

*/		
