package com.hongsi.purchshop.service;

import java.util.List;

import com.hongsi.purchshop.vo.PurchshopVO;

public interface PurchshopService {
	
	public int insertPurchshopOrder(PurchshopVO vo);
	
	public PurchshopVO selectItemTotSum();
	
	public PurchshopVO selectItemSum();

	public List<PurchshopVO> selectOrderListSuntSat();
	
	public List<PurchshopVO> selectOrderList();
	
	public PurchshopVO getWeekDay();
	
	public int insertProduct(PurchshopVO vo);
	
	public List<PurchshopVO> selectProductList();
	
	public PurchshopVO selectProductStock();

	public PurchshopVO selectOrderByCno(int cno);
}
