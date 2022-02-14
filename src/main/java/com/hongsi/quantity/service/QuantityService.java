package com.hongsi.quantity.service;

import java.util.List;

import com.hongsi.quantity.vo.QuantityVO;

public interface QuantityService {
	
	public List<QuantityVO> list() throws Exception;

	public List<QuantityVO> selectItemQty(String name) throws Exception;

	public List<QuantityVO> selectTotalByItem(String code) throws Exception;

	public List<QuantityVO> selectAllIngreStock() throws Exception;

	public List<QuantityVO> selectTotalNeedFinal() throws Exception;

}
