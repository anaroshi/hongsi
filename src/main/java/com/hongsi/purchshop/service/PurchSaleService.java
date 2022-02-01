package com.hongsi.purchshop.service;

import java.util.List;

import com.hongsi.purchshop.vo.PurchSaleVO;

public interface PurchSaleService {

	public int insertPurchsale(PurchSaleVO vo);

	public List<PurchSaleVO> selectSaleList();	
	
	public PurchSaleVO getWeekDay();

	public PurchSaleVO selectStock();

	public PurchSaleVO selectSaleStock();

	public PurchSaleVO selectSaleInfoByCno(int cno);

	public int deleteSaleInfoByCno(int cno);

	public int updateSaleInfoByCno(PurchSaleVO vo);
}
