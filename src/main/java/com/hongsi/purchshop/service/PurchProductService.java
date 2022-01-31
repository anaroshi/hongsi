package com.hongsi.purchshop.service;

import java.util.List;

import com.hongsi.purchshop.vo.PurchProductVO;

public interface PurchProductService {

	public int insertProduct(PurchProductVO vo);
	
	public List<PurchProductVO> selectProductList();

	public PurchProductVO selectProductStock();
}
