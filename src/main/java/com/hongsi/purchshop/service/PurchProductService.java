package com.hongsi.purchshop.service;

import java.util.List;

import com.hongsi.purchshop.vo.PurchProductVO;
import com.hongsi.util.PageObject;

public interface PurchProductService {

	public int insertProduct(PurchProductVO vo);
	
	public int deleteProductInfoByCno(long cno);
	
	public int updateProductInfoByCno(PurchProductVO vo);
	
	public List<PurchProductVO> selectProductList(PageObject pageObject);

	public PurchProductVO selectProductStock();

	public PurchProductVO selectProductInfoByCno(int cno);


}
