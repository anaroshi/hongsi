package com.hongsi.purchshop.mapper;

import java.util.List;

import com.hongsi.purchshop.vo.PurchshopVO;

public interface PurchshopMapper {

	int insertPurchshopOrder(PurchshopVO vo);

	PurchshopVO selectItemTotSum();
	
	PurchshopVO selectItemSum();

	List<PurchshopVO> selectOrderList();

	List<PurchshopVO> selectOrderListSuntSat();

	PurchshopVO getWeekDay();

	int insertProduct(PurchshopVO vo);

	List<PurchshopVO> selectProductList();

	PurchshopVO selectProductStock();

}
