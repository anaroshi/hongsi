package com.hongsi.quantity.mapper;

import java.util.List;

import com.hongsi.quantity.vo.QuantityVO;

public interface QuantityMapper {

	List<QuantityVO> list();

	List<QuantityVO> selectItemQty(String name);

	List<QuantityVO> selectTotalByItem(String code_100);

	List<QuantityVO> selectAllIngreStock();

	List<QuantityVO> selectTotalNeedFinal();

}
