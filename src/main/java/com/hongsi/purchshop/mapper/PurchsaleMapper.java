package com.hongsi.purchshop.mapper;

import java.util.List;

import com.hongsi.purchshop.vo.PurchsaleVO;

public interface PurchsaleMapper {

	int insertPurchsale(PurchsaleVO vo);

	List<PurchsaleVO> selectSaleList();

}
