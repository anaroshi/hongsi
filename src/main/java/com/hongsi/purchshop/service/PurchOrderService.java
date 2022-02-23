package com.hongsi.purchshop.service;

import java.util.List;

import com.hongsi.purchshop.vo.PurchOrderVO;
import com.hongsi.util.PageObject;

public interface PurchOrderService {
	
	public int insertPurchshopOrder(PurchOrderVO vo) throws Exception;

	public int deleteOrderInfoByCno(long cno) throws Exception;

	public int updateOrderInfoByCno(PurchOrderVO vo) throws Exception;
	
	public PurchOrderVO selectItemTotSum() throws Exception;	
	public PurchOrderVO selectOrderSum() throws Exception;

	public List<PurchOrderVO> selectOrderListSuntSat() throws Exception;
	
	public List<PurchOrderVO> selectOrderList(PageObject pageObject) throws Exception;	
	public PurchOrderVO selectProductStock() throws Exception;

	public PurchOrderVO selectOrderByCno(int cno) throws Exception;

	public int updatePurchshopOrder(long cno) throws Exception;

	public PurchOrderVO selectOrderStock() throws Exception;

	public List<PurchOrderVO> selectOrderListWaitSale() throws Exception;

	public PurchOrderVO selectOrderInfoByCno(int cno) throws Exception;

	
}
