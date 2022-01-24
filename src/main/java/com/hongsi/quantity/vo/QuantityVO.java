package com.hongsi.quantity.vo;

import lombok.Data;

@Data
public class QuantityVO {
	
	private long 	cno;
	private String 	code;
	private String 	name;
	private long 	amount;
	private String 	ingredient;
	private String 	igt_code;
	private long 	qty;
	private String 	item;
	private long 	total;
	
	private String 	kname;
	private String 	ename;
	private long 	ori_qty;
	private long 	erl_qty;
	private long 	sns_qty;
	
}

