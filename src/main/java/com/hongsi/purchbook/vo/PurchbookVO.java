package com.hongsi.purchbook.vo;

import lombok.Data;

@Data
public class PurchbookVO {

	private long 	cno;		// unq
	private String 	buyDate;	// 구매일자
	private String 	item;		// 구매품
	private String 	gubun;		// 입출고구분
	private long 	content;	// 구매단위양
	private long 	qty;		// 구매갯수 / 수량
	private String 	unit;		// 단위
	private long 	price;		// 구매금액
	private String 	purShop; 	// 구매 / 거래처	
	private String 	inDate;		// 입고일자
	private String 	comm;		// 내역 / 비고
	private String 	buyer;		// 구매자
	private String 	rDate;		// 입력일
	
	private String  kname;		// 구매품 이름
	private long 	inTotal;	// 입고 수량
	private long 	outTotal;	// 출고 수량
	private long 	disTotal;	// 폐기 수량
	private long 	total;		// 입고 수량
	
}