package com.hongsi.purchshop.mapper;

import com.hongsi.purchshop.vo.PurchshopVO;

public interface PurchshopMapper {

	int insertPurchshopOrder(PurchshopVO vo);

	PurchshopVO selectItemTotSum();
	
	PurchshopVO selectItemSum();

}
