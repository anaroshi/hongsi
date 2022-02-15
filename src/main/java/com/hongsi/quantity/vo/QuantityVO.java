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
	private long 	stc_qty;
	
	private long 	ori_qty_2week;
	private long 	erl_qty_2week;
	private long 	stc_qty_2week;
	private long 	needSum;
	private long 	ori_need2week;
	private long 	erl_need2week;
	private long 	stc_need2week;
	private long 	need2week;
	private long 	sumCafe;
	private long 	sumOffice;

	private long 	finalTotal;
	private long 	finalNeed;
}

/*

CREATE TABLE QUANTITY ( 
CNO NUMBER NOT NULL PRIMARY KEY, 
CODE VARCHAR2(20), 
NAME VARCHAR2(50), 
AMOUNT NUMBER DEFAULT 0, 
INGREDIENT VARCHAR2(50), 
IGT_CODE VARCHAR2(20), 
QTY NUMBER DEFAULT 0, 
RDATE DATE DEFAULT SYSDATE );
  
CREATE SEQUENCE QUANTITY_PK
INCREMENT BY 1
START WITH 1
MAXVALUE 99999;  

INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_100_001','ORI_100',100,'Oatmeal','in_001',39);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_100_001','ORI_100',100,'Amond','in_003',12);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_100_001','ORI_100',100,'Canola Oil','in_011',5);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_100_001','ORI_100',100,'Cashewnut','in_013',12);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_100_001','ORI_100',100,'Coconut Flakes','in_014',5);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_100_001','ORI_100',100,'Cranberry','in_017',5);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_100_001','ORI_100',100,'Maple Syrup','in_023',24);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_100_001','ORI_100',100,'Pican','in_024',6);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_100_001','ORI_100',100,'Walnut','in_027',6);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_100_001','ORI_100',100,'Whole Wheat','in_028',4);

INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_100_001','ERL_100',100,'Oatmeal','in_001',40);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_100_001','ERL_100',100,'AgaveSyrup','in_002',15);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_100_001','ERL_100',100,'Amond','in_003',8);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_100_001','ERL_100',100,'Canola Oil','in_011',6);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_100_001','ERL_100',100,'Cashewnut','in_013',4);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_100_001','ERL_100',100,'Coconut Flakes','in_014',4);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_100_001','ERL_100',100,'Dried Mango','in_019',5);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_100_001','ERL_100',100,'Earl Grey','in_020',2);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_100_001','ERL_100',100,'Macadamia','in_022',4);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_100_001','ERL_100',100,'Maple Syrup','in_023',20);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_100_001','ERL_100',100,'Pican','in_024',8);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_100_001','ERL_100',100,'Whole Wheat','in_028',3);

INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_100_001','STC_100',100,'Oatmeal','in_001',30);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_100_001','STC_100',100,'Amond','in_003',11);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_100_001','STC_100',100,'Caramel Sauce','in_012',18);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_100_001','STC_100',100,'Cashewnut','in_013',11);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_100_001','STC_100',100,'Coconut Oil','in_015',6);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_100_001','STC_100',100,'Corn Flakes','in_016',14);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_100_001','STC_100',100,'Cranberry','in_017',7);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_100_001','STC_100',100,'Maple Syrup','in_023',14);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_100_001','STC_100',100,'Pican','in_024',6);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_100_001','STC_100',100,'Salt','in_025',1);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_100_001','STC_100',100,'Walnut','in_027',6);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_100_001','STC_100',100,'Whole Wheat','in_028',4);

-------------------------------------------------ROASTING------------------------------------------

INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_ROAST_001','ORI_ROAST',1,'Oatmeal','in_001',875);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_ROAST_001','ORI_ROAST',1,'Amond','in_003',250);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_ROAST_001','ORI_ROAST',1,'Canola Oil','in_011',100);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_ROAST_001','ORI_ROAST',1,'Cashewnut','in_013',250);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_ROAST_001','ORI_ROAST',1,'Coconut Flakes','in_014',100);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_ROAST_001','ORI_ROAST',1,'Cranberry','in_017',100);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_ROAST_001','ORI_ROAST',1,'Maple Syrup','in_023',525);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_ROAST_001','ORI_ROAST',1,'Pican','in_024',125);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_ROAST_001','ORI_ROAST',1,'Walnut','in_027',125);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_ROAST_001','ORI_ROAST',1,'Whole Wheat','in_028',75);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ORI_ROAST_001','ORI_ROAST',1,'Water','in_029',200);

INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_ROAST_001','ERL_ROAST',1,'Oatmeal','in_001',800);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_ROAST_001','ERL_ROAST',1,'AgaveSyrup','in_002',150);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_ROAST_001','ERL_ROAST',1,'Amond','in_003',300);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_ROAST_001','ERL_ROAST',1,'Canola Oil','in_011',120);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_ROAST_001','ERL_ROAST',1,'Cashewnut','in_013',75);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_ROAST_001','ERL_ROAST',1,'Coconut Flakes','in_014',75);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_ROAST_001','ERL_ROAST',1,'Dried Mango','in_019',100);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_ROAST_001','ERL_ROAST',1,'Earl Grey','in_020',20);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_ROAST_001','ERL_ROAST',1,'Macadamia','in_022',75);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_ROAST_001','ERL_ROAST',1,'Maple Syrup','in_023',400);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_ROAST_001','ERL_ROAST',1,'Pican','in_024',150);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_ROAST_001','ERL_ROAST',1,'Whole Wheat','in_028',60);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'ERL_ROAST_001','ERL_ROAST',1,'Water','in_029',200);

INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_ROAST_001','STC_ROAST',1,'Oatmeal','in_001',600);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_ROAST_001','STC_ROAST',1,'Amond','in_003',220);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_ROAST_001','STC_ROAST',1,'Caramel Sauce','in_012',350);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_ROAST_001','STC_ROAST',1,'Cashewnut','in_013',220);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_ROAST_001','STC_ROAST',1,'Coconut Oil','in_015',120);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_ROAST_001','STC_ROAST',1,'Corn Flakes','in_016',275);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_ROAST_001','STC_ROAST',1,'Cranberry','in_017',125);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_ROAST_001','STC_ROAST',1,'Maple Syrup','in_023',275);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_ROAST_001','STC_ROAST',1,'Pican','in_024',110);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_ROAST_001','STC_ROAST',1,'Salt','in_025',20);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_ROAST_001','STC_ROAST',1,'Walnut','in_027',110);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_ROAST_001','STC_ROAST',1,'Whole Wheat','in_028',70);
INSERT INTO QUANTITY (CNO, CODE, NAME, AMOUNT,INGREDIENT,IGT_CODE,QTY) VALUES (QUANTITY_PK.NEXTVAL,'STC_ROAST_001','STC_ROAST',1,'Water','in_029',120);
*/
