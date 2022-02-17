package com.hongsi.purchshop.mapper;

import java.util.List;

import com.hongsi.purchshop.vo.PurchProductVO;
import com.hongsi.util.PageObject;


public interface PurchProductMapper {

	int insertProduct(PurchProductVO vo);

	int deleteProductInfoByCno(int cno);

	int updateProductInfoByCno(PurchProductVO vo);
	
	List<PurchProductVO> selectProductList(PageObject pageObject);
	
	int getProductTotalRow();
	
	PurchProductVO selectProductStock();
	
	PurchProductVO selectProductInfoByCno(int cno);

	
}
