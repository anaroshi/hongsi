package com.hongsi.purchpack.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PurchPackVO {

	private long 	cno;			// unq
	// 날짜 입력할 때만 해당된다.
	// 화면의 날짜 형식이 String이므로 날짜형식에 맞지 않아서 형식은 맞춰서 입력을 받아야 오류가 나지 않는다.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 		buyDate;		// 구매일자
	private String 		buyer;			// 구매자
	private String 		pack_code;		// 구매품 대분류 코드
	private String 		pack_name;		// 구매품 대분류 명
	private String 		code;			// 구매품 소분류 코드
	private String 		name;			// 구매품 소분류 명
	private long 		qty;			// 구매갯수 / 수량
	private long 		price;			// 구매금액	        
	private String 		purShop; 		// 구매 / 거래처
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 		inDate;			// 입고일자
	private String 		comm;			// 내역 / 비고
	private String  	gubun;			// 재료 재고에 더할 값인지 뺄 값인지 구하기 위함 (더할 값: in/ 뺄 값: out )
	private long 		flag;			// 재료 입력 1 / 수정 2 / 삭제 4 여부 확인용
	
	private String[] 	pack_codes;		// 구매품 대분류 코드
	private String[]	pack_names;		// 구매품 대분류 명
	private String[] 	codes;			// 구매품 소분류 코드
	private String[]	names;			// 구매품 소분류 명
	private long[] 		qtys;			// 구매갯수 / 수량
	private long[] 		prices;			// 구매금액	        
	private String[] 	purShops; 		// 구매 / 거래처
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date[] 		inDates;			// 입고일자

}

/*
CREATE TABLE PURCH_PACK ( 
CNO NUMBER NOT NULL PRIMARY KEY, 
BUYDATE DATE NOT NULL,
BUYER VARCHAR2(40),
PACK_CODE VARCHAR2(20), 
PACK_NAME VARCHAR2(50), 
CODE VARCHAR2(20), 
NAME VARCHAR2(50),
QTY NUMBER,
PRICE NUMBER,
PURSHOP VARCHAR2(30), 
INDATE DATE,
COMM VARCHAR2(400), 
GUBUN VARCHAR2(20),
FLAG NUMBER DEFAULT 0,
RDATE TIMESTAMP (6) DEFAULT SYSDATE, 
UDATE DATE DEFAULT SYSDATE ); 

CREATE SEQUENCE PURCH_PACK_PK
INCREMENT BY 1
START WITH 1;

*/