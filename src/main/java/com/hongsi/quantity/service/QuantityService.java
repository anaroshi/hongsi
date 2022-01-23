package com.hongsi.quantity.service;

import java.util.List;

import com.hongsi.quantity.vo.QuantityVO;

public interface QuantityService {
	
	public List<QuantityVO> list();

	public List<QuantityVO> selectItemQty(String name);

	public List<QuantityVO> selectTotalByItem(String code);

}
