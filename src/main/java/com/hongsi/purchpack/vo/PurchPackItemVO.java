package com.hongsi.purchpack.vo;

import lombok.Data;

@Data
public class PurchPackItemVO {

	private String 	pack_code;	// 구매품 대분류 코드
	private String 	pack_name;	// 구매품 대분류 명
	private String 	code;		// 구매품 소분류 코드
	private String 	name;		// 구매품 소분류 명
}
