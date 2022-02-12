package com.hongsi.purchshop.service;

import java.util.List;

import com.hongsi.purchshop.vo.PurchProductVO;

public interface PurchProductService {

	public int insertProduct(PurchProductVO vo);
	
	public int deleteProductInfoByCno(int cno);
	
	public int updateProductInfoByCno(PurchProductVO vo);
	
	public List<PurchProductVO> selectProductList();

	public PurchProductVO selectProductStock();

	public PurchProductVO selectProductInfoByCno(int cno);


}
