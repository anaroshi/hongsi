package com.hongsi.purchshop.service;

import java.util.List;

import com.hongsi.purchshop.vo.PurchSaleVO;
import com.hongsi.util.PageObject;

public interface PurchSaleService {

	public int insertSale(PurchSaleVO vo);
	
	public int deleteSaleInfoByCno(int cno);

	public int updateSaleInfoByCno(PurchSaleVO vo);

	public List<PurchSaleVO> selectSaleList(PageObject pageObject);	
	
	public PurchSaleVO getWeekDay();

	public PurchSaleVO selectStock();

	public PurchSaleVO selectSaleStock();

	public PurchSaleVO selectSaleInfoByCno(int cno);

}