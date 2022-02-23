package com.hongsi.purchshop.mapper;

import java.util.List;

import com.hongsi.purchshop.vo.PurchSaleVO;
import com.hongsi.util.PageObject;

public interface PurchSaleMapper {

	int insertSale(PurchSaleVO vo);

	int deleteSaleInfoByCno(long cno);

	int updateSaleInfoByCno(PurchSaleVO vo);
	
	List<PurchSaleVO> selectSaleList(PageObject pageObject);
	
	int getSaleTotalRow();
	
	List<PurchSaleVO> selectProductList();
	
	PurchSaleVO getWeekDay();

	PurchSaleVO selectStock();

	PurchSaleVO selectSaleStock();

	PurchSaleVO selectSaleInfoByCno(int cno);


}
