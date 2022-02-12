package com.hongsi.purchshop.mapper;

import java.util.List;

import com.hongsi.purchshop.vo.PurchSaleVO;

public interface PurchSaleMapper {

	int insertSale(PurchSaleVO vo);

	int deleteSaleInfoByCno(int cno);

	int updateSaleInfoByCno(PurchSaleVO vo);
	
	List<PurchSaleVO> selectSaleList();
	
	List<PurchSaleVO> selectProductList();
	
	PurchSaleVO getWeekDay();

	PurchSaleVO selectStock();

	PurchSaleVO selectSaleStock();

	PurchSaleVO selectSaleInfoByCno(int cno);

}
