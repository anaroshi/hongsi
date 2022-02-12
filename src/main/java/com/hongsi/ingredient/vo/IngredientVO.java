package com.hongsi.ingredient.vo;

import lombok.Data;

@Data
public class IngredientVO {
	
	public String code;
	public String kname;
	public String ename;

}

/*
CREATE TABLE INGREDIENT (
CNO NUMBER NOT NULL PRIMARY KEY,
KNAME VARCHAR2(50),
ENAME VARCHAR2(50),
CODE VARCHAR2(10),
RDATE DATE DEFAULT SYSDATE);

CREATE SEQUENCE INGREDIENT_PK
INCREMENT BY 1
START WITH 1
MAXVALUE 99999;

Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'오트밀','Oatmeal','in_001', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'아가베시럽','AgaveSyrup','in_002', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'아몬드','Amond','in_003', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'아몬드분말','Amond_Powder','in_004', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'아몬드슬라이스','Amond_Slice','in_005', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'브라질너트','Brazil_Nut','in_006', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'피칸_반태','Broken_Pican','in_007', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'호두_반태','Broken_Walnut','in_008', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'카카오닙스','Cacao_Nips','in_009', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'카카오파우더','Cacao_Power','in_010', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'카놀라유','Canola_Oil','in_011', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'카라멜소스','Caramel_Sauce','in_012', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'캐슈넛','Cashewnut','in_013', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'코코넛칩','Coconut_Flakes','in_014', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'코코넛오일','Coconut_Oil','in_015', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'콘후레이크','Corn_Flakes','in_016', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'크랜베리','Cranberry','in_017', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'다크초콜릿','Dark_Chocolate','in_018', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'반건조망고','Dried_Mango','in_019', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'얼그레이','Earl_Grey','in_020', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'헤이즐넛','Hazelnuts','in_021', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'마카다미아','Macadamia','in_022', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'메이플시럽','Maple_Syrup','in_023', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'피칸','Pican','in_024', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'소금','Salt','in_025', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'해바라기씨','Sunflower_Seed','in_026', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'호두','Walnut','in_027', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'통밀가루','Whole_Wheat','in_028', sysdate);
Insert into INGREDIENT (CNO,KNAME,ENAME,CODE,RDATE) values (INGREDIENT_PK.NEXTVAL,'물','Water','in_029', sysdate);
*/