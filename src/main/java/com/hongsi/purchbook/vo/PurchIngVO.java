package com.hongsi.purchbook.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PurchIngVO {

	private long 	cno;			// unq
	// 날짜 입력할 때만 해당된다.
	// 화면의 날짜 형식이 String이므로 날짜형식에 맞지 않아서 형식은 맞춰서 입력을 받아야 오류가 나지 않는다.
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	buyDate;		// 구매일자
	private String 	item;			// 구매품
	private String 	gubun;			// 입출고구분
	private long 	content;		// 구매단위양
	private long 	qty;			// 구매갯수 / 수량
	private long 	sumQty;			// 구매갯수 / 수량
	private long 	price;			// 구매금액
	private String 	purShop; 		// 구매 / 거래처
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	inDate;			// 입고일자
	private String 	comm;			// 내역 / 비고
	private String 	buyer;			// 구매자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date 	rDate;			// 입력일
	
	private String  kname;			// 구매품 이름
	private long 	inTotal;		// 입고 수량
	private long 	outTotal;		// 출고 수량
	private long 	disTotal;		// 폐기 수량
	private long 	inCafeTotal;	// 카페 입고 수량
	private long 	outCafeTotal;	// 카페 출고 수량
	private long 	disCafeTotal;	// 카페 폐기 수량
	private long 	total;			// 입고 수량
	
	private String  gubunCode;		// 재료 재고에 더할 값인지 뺄 값인지 구하기 위함 (더할 값: in/ 뺄 값: out )
	private String  status;			// 재료 구매(purch)에서 입력되는지. 재료 입출고(storage)에서 입력되는지 구분을 위한 값 (purch/storage)
	private long 	flag;			// 재료 입력 1 / 수정 2 / 삭제 4 여부 확인용
	
	private long 	locate;			// Modify 수정 or 삭제 처리 후 콜한 곳으로 가기 위한 값(1 :buy.jsp / 2:buyAllList.jsp / 3:ingAllList.jsp)
}

/*

CREATE TABLE PURCH_ING ( 
CNO NUMBER NOT NULL PRIMARY KEY, 
BUYDATE DATE, 
ITEM VARCHAR2(20), 
GUBUN VARCHAR2(20), 
CONTENT NUMBER, 
QTY NUMBER, 
UNIT VARCHAR2(10), 
PRICE NUMBER, 
PURSHOP VARCHAR2(30), 
INDATE DATE, 
COMM VARCHAR2(4000), 
BUYER VARCHAR2(20), 
RDATE TIMESTAMP (6) DEFAULT SYSDATE, 
SUMQTY NUMBER, 
STATUS VARCHAR2(10), 
GUBUNCODE VARCHAR2(10), 
FLAG NUMBER, 
UDATE DATE DEFAULT SYSDATE);

CREATE SEQUENCE PURCH_ING_PK
INCREMENT BY 1
START WITH 1;


*/