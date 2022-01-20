package com.hongsi.purchbook.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PurchbookVO {

	private long cno;
	private Date buyDate;
	private String item;
	private String purcode;
	private String purname;
	private long qty;
	private long minqty;
	private String unit;
	private Date inDate;
	private String comm;
	private Date rDate;
	
}