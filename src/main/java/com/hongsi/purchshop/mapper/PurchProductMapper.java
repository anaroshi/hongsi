package com.hongsi.purchshop.mapper;

import java.util.List;

import com.hongsi.purchshop.vo.PurchProductVO;


public interface PurchProductMapper {

	int insertProduct(PurchProductVO vo);
	
	List<PurchProductVO> selectProductList();

	PurchProductVO selectProductStock();

	PurchProductVO selectProductInfoByCno(int cno);

	int deleteProductInfoByCno(int cno);

	int updateProductInfoByCno(PurchProductVO vo);
	
}
