package com.hongsi.purchshop.mapper;

import java.util.List;

import com.hongsi.purchshop.vo.PurchOrderVO;
import com.hongsi.util.PageObject;

public interface PurchOrderMapper {

	int insertPurchshopOrder(PurchOrderVO vo);
	
	int deleteOrderInfoByCno(long cno);
	
	int updateOrderInfoByCno(PurchOrderVO vo);

	PurchOrderVO selectItemTotSum();
	
	PurchOrderVO selectOrderSum();

	List<PurchOrderVO> selectOrderList(PageObject pageObject);

	int getOrderTotalRow();
	
	List<PurchOrderVO> selectOrderListSuntSat();

	PurchOrderVO selectProductStock();

	PurchOrderVO selectOrderByCno(int cno);

	int updatePurchshopOrder(long cno);

	PurchOrderVO selectOrderStock();

	List<PurchOrderVO> selectOrderListWaitSale();

	PurchOrderVO selectOrderInfoByCno(int cno);

	List<PurchOrderVO> selectProductOrderSaleAllInfo(PageObject pageObject);

	int getProductOrderSaleAllTotalRow(PageObject pageObject);

	List<PurchOrderVO> excelProductOrderSaleAllInfo(PageObject pageObject);


}
