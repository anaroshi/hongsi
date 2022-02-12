package com.hongsi.purchshop.mapper;

import java.util.List;

import com.hongsi.purchshop.vo.PurchOrderVO;

public interface PurchOrderMapper {

	int insertPurchshopOrder(PurchOrderVO vo);
	
	int deleteOrderInfoByCno(int cno);
	
	int updateOrderInfoByCno(PurchOrderVO vo);

	PurchOrderVO selectItemTotSum();
	
	PurchOrderVO selectOrderSum();

	List<PurchOrderVO> selectOrderList();

	List<PurchOrderVO> selectOrderListSuntSat();

	PurchOrderVO selectProductStock();

	PurchOrderVO selectOrderByCno(int cno);

	int updatePurchshopOrder(long cno);

	PurchOrderVO selectOrderStock();

	List<PurchOrderVO> selectOrderListWaitSale();

	PurchOrderVO selectOrderInfoByCno(int cno);

}
