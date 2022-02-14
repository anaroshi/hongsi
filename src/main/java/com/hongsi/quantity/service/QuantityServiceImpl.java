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
	public List<QuantityVO> list() throws Exception {
		log.info("------------------- List<QuantityVO>");
		return mapper.list();
	}

	@Override
	public List<QuantityVO> selectItemQty(String name) throws Exception {
		return mapper.selectItemQty(name);
	}

	@Override
	public List<QuantityVO> selectTotalByItem(String code) throws Exception {		
		return mapper.selectTotalByItem(code);
	}

	@Override
	public List<QuantityVO> selectAllIngreStock() throws Exception {
		// 전체 재료, original 재료량, earlgrey 재료량, sweet&salty 재료량, 전체 재고 쿼리
		return mapper.selectAllIngreStock();
	}

	@Override
	public List<QuantityVO> selectTotalNeedFinal() throws Exception {
		// 전체 재료, 전체 재고, 한주 주문된 필요재료량, 최종재고, 최종 주문해야할 2주분 확보량 쿼리
		return mapper.selectTotalNeedFinal();
	}	

}
