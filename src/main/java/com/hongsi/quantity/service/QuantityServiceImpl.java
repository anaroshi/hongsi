package com.hongsi.quantity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.quantity.mapper.QuantityMapper;
import com.hongsi.quantity.vo.QuantityVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("quantityServiceImpl")
@AllArgsConstructor
@Log4j
public class QuantityServiceImpl implements QuantityService {
	
	private QuantityMapper mapper;

	@Override
	public List<QuantityVO> list() {
		log.info("------------------- List<QuantityVO>");
		return mapper.list();
	}

	@Override
	public List<QuantityVO> selectItemQty(String name) {
		return mapper.selectItemQty(name);
	}

	@Override
	public List<QuantityVO> selectTotalByItem(String code) {
		// 100g 기본 정보 보여주기 위함
				String code_100 = code+"_100_001";
		return mapper.selectTotalByItem(code_100);
	}

	@Override
	public List<QuantityVO> selectAllIngreStock() {
		// 전체 재료, original 재료량, earlgrey 재료량, sweet&salty 재료량, 전체 재고 쿼리
		return mapper.selectAllIngreStock();
	}
	
	

}
