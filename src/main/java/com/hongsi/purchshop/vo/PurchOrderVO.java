package com.hongsi.purchshop.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PurchOrderVO {
	
	// 주문이 오면 생산에 들어가 위해 사용
	private long 	cno;		// cno
	// 날짜 입력할 때만 해당된다.
	// 화면의 날짜 형식이 String이므로 날짜형식에 맞지 않아서 형식은 맞춰서 입력을 받아야 오류가 나지 않는다.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	orderDate;	// 주문일자 
	private long 	ori_250;	// ori_250 주문갯수
	private long 	ori_500;	// ori_500 주문갯수
	private long 	ori_1000;	// ori_1000 주문갯수
	private long 	erl_250;	// erl_250 주문갯수
	private long 	erl_500;	// erl_500 주문갯수
	private long 	erl_1000;	// erl_1000 주문갯수
	private long 	stc_250;	// stc_250 주문갯수
	private long 	stc_500;	// stc_500 주문갯수
	private long 	stc_1000;	// stc_1000 주문갯수
	private String  gubun;		// 주문 구분 : 판매
	private String  salePath;	// 주문경로 : 개별구매, Naver쇼핑, 홈페이지
	private String 	orderer;	// 주문자
	private String 	comm;		// 비고
	private String 	manager;	// 담당자
	private String 	admit;		// 판매처리 여부
	
	private long 	ori_250_sum;	// ori_250 주단위 주문갯수
	private long 	ori_500_sum;	// ori_500 주단위 주문갯수
	private long 	ori_1000_sum;	// ori_1000 주단위 주문갯수
	private long 	erl_250_sum;	// erl_250 주단위 주문갯수
	private long 	erl_500_sum;	// erl_500 주단위 주문갯수
	private long 	erl_1000_sum;	// erl_1000 주단위 주문갯수
	private long 	stc_250_sum;	// stc_250 주단위 주문갯수
	private long 	stc_500_sum;	// stc_500 주단위 주문갯수
	private long 	stc_1000_sum;	// stc_1000 주단위 주문갯수
 	private long 	ori_sum;		
	private long 	erl_sum;
	private long 	stc_sum;
	
	private String 	ori_250_format;	// ori_250 주문갯수
	private String 	ori_500_format;	// ori_500 주문갯수
	private String 	ori_1000_format;	// ori_1000 주문갯수
	private String 	erl_250_format;	// erl_250 주문갯수
	private String 	erl_500_format;	// erl_500 주문갯수
	private String 	erl_1000_format;	// erl_1000 주문갯수
	private String 	stc_250_format;	// stc_250 주문갯수
	private String 	stc_500_format;	// stc_500 주문갯수
	private String 	stc_1000_format;	// stc_1000 주문갯수
	
	private String  gubunCode;		// 제품 재고에 더할 값인지 뺄 값인지 구하기 위함 (더할 값: in/ 뺄 값: out)
	private String  status;			// 제품 판매(shop)에서 입력되는지. 생산 입출고(product)에서 입력되는지 구분을 위한 값 (shop/product)
	private long 	flag;			// 재료 입력 1 / 수정 2 / 삭제 4 여부 확인용
	
	private long 	locate;			// Modify 수정 or 삭제 처리 후 콜한 곳으로 가기 위한 값(1 :order.jsp / 2:orderAllList.jsp)
}


/*

CREATE TABLE PURCH_ORDER (
CNO  NUMBER NOT NULL PRIMARY KEY, 
ORDERDATE  DATE, 
ORI_250  NUMBER DEFAULT 0, 
ORI_500  NUMBER DEFAULT 0, 
ORI_1000  NUMBER DEFAULT 0, 
ERL_250  NUMBER DEFAULT 0, 
ERL_500  NUMBER DEFAULT 0, 
ERL_1000  NUMBER DEFAULT 0, 
STC_250  NUMBER DEFAULT 0, 
STC_500  NUMBER DEFAULT 0, 
STC_1000  NUMBER DEFAULT 0, 
GUBUN  VARCHAR2(20), 
SALEPATH  VARCHAR2(30), 
ORDERER  VARCHAR2(40), 
COMM  VARCHAR2(4000), 
MANAGER  VARCHAR2(20), 
GUBUNCODE  VARCHAR2(30), 
STATUS  VARCHAR2(30), 
ADMIT  VARCHAR2(10), 
RDATE  TIMESTAMP (6) DEFAULT SYSDATE, 
FLAG  NUMBER DEFAULT 0, 
UDATE  DATE DEFAULT SYSDATE );

CREATE SEQUENCE  PURCHORDER_PK
INCREMENT BY 1
START WITH 1;

SQL> SELECT SEQUENCE_NAME FROM USER_SEQUENCES;

SEQUENCE_NAME
------------------------------
INGREDIENT_PK
ITEM_PK
ITEM_QTY_TYPE_PK
PURCHORDER_PK
PURCHPRODUCT_PK
PURCHSALE_PK
PURCH_ING_PK
QUANTITY_PK

SQL> SELECT TABLE_NAME FROM USER_TABLES;

TABLE_NAME
------------------------------
ITEM
INGREDIENT
ITEM_QTY_TYPE
QUANTITY
PURCH_ING
PURCH_ORDER
PURCH_PRODUCT
PURCH_SALE

12 rows selected.	
	
*/		
