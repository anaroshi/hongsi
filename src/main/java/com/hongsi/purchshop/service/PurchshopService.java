package com.hongsi.purchshop.service;

import com.hongsi.purchshop.vo.PurchshopVO;

public interface PurchshopService {
	
	public int insertPurchshopOrder(PurchshopVO vo);
	
	public PurchshopVO selectItemTotSum();
	
	public PurchshopVO selectItemSum();

}
