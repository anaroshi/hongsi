package com.hongsi.purchshop.service;

import java.util.List;

import com.hongsi.purchshop.vo.PurchsaleVO;

public interface PurchsaleService {

	public int insertPurchsale(PurchsaleVO vo);

	public List<PurchsaleVO> selectSaleList();
}
