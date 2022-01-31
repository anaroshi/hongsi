package com.hongsi.purchshop.mapper;

import java.util.List;

import com.hongsi.purchshop.vo.PurchSaleVO;

public interface PurchSaleMapper {

	int insertPurchsale(PurchSaleVO vo);

	List<PurchSaleVO> selectSaleList();
	
	int insertProduct(PurchSaleVO vo);
	
	List<PurchSaleVO> selectProductList();
	
	PurchSaleVO getWeekDay();

	PurchSaleVO selectStock();

	PurchSaleVO selectSaleStock();

}
