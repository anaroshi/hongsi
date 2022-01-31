package com.hongsi.purchbook.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class PurchIngVO {

	private long 	cno;		// unq
	private Date 	buyDate;	// 구매일자
	private String 	item;		// 구매품
	private String 	gubun;		// 입출고구분
	private long 	content;	// 구매단위양
	private long 	qty;		// 구매갯수 / 수량
	private long 	price;		// 구매금액
	private String 	purShop; 	// 구매 / 거래처	
	private String 	inDate;		// 입고일자
	private String 	comm;		// 내역 / 비고
	private String 	buyer;		// 구매자
	private Date 	rDate;		// 입력일
	
	private String  kname;		// 구매품 이름
	private long 	inTotal;	// 입고 수량
	private long 	outTotal;	// 출고 수량
	private long 	disTotal;	// 폐기 수량
	private long 	total;		// 입고 수량
	
	private String  gubunCode;	// 재료 재고에 더할 값인지 뺄 값인지 구하기 위함 (더할 값: in/ 뺄 값: out )
	private String  status;		// 재료 구매(purch)에서 입력되는지. 재료 입출고(storage)에서 입력되는지 구분을 위한 값 (purch/storage)
	private long 	flag;		// 재료 입력 1 / 수정 2 / 삭제 4 여부 확인용
}

/*

CREATE TABLE PURCHASE_BOOK (
CNO number not null primary key,
BUYDATE  DATE not null,
ITEM varchar2(50) not null,
PURCODE  varchar2(20) not null,
PURNAME varchar2(50) not null,
QTY NUMBER NOT NULL,
MINQTY NUMBER NOT NULL,
UNIT varchar2(20) not null,
INDATE DATE,
COMM varchar2(100),
RDATE timestamp default sysdate
);

create sequence  PURCHASE_BOOK_PK
increment by 1
start with 1
maxvalue 999;

-------------------------------------------------

CREATE TABLE PURCH_ING_TRACE (
	UNQ number not null primary key,
	CNO number,
	BUYDATE  DATE not null,
	ITEM varchar2(20) not null,
	GUBUN varchar2(20) not null,
	CONTENT NUMBER NOT NULL,
	QTY NUMBER NOT NULL,
	PRICE NUMBER NOT NULL,
	PURSHOP varchar2(30),
	INDATE DATE,
	COMM varchar2(100),
	BUYER varchar2(100),
	SUMQTY number,
	STATUS  varchar2(10),
	GUBUNCODE varchar2(10),
	FLAG NUMBER DEFAULT 0,
	RDATE DATE default sysdate
);

create sequence  PURCH_ING_TRACE_PK
increment by 1
start with 1;

*/