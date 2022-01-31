package com.hongsi.purchshop.service;

import java.util.List;

import com.hongsi.purchshop.vo.PurchOrderVO;

public interface PurchOrderService {
	
	public int insertPurchshopOrder(PurchOrderVO vo);
	
	public PurchOrderVO selectItemTotSum();
	
	public PurchOrderVO selectOrderSum();

	public List<PurchOrderVO> selectOrderListSuntSat();
	
	public List<PurchOrderVO> selectOrderList();
	
	public PurchOrderVO selectProductStock();

	public PurchOrderVO selectOrderByCno(int cno);

	public int updatePurchshopOrder(long cno);

	public PurchOrderVO selectOrderStock();

	public List<PurchOrderVO> selectOrderListWaitSale();
	
}
