package com.hongsi.purchshop.service;

import java.util.List;

import com.hongsi.purchshop.vo.PurchSaleVO;

public interface PurchSaleService {

	public int insertSale(PurchSaleVO vo);
	public int insertSaleTrace(PurchSaleVO vo);
	
	public int deleteSaleInfoByCno(int cno);
	public int deleteSaleInfoByCnoTrace(int cno);

	public int updateSaleInfoByCno(PurchSaleVO vo);

	public List<PurchSaleVO> selectSaleList();	
	
	public PurchSaleVO getWeekDay();

	public PurchSaleVO selectStock();

	public PurchSaleVO selectSaleStock();

	public PurchSaleVO selectSaleInfoByCno(int cno);

}