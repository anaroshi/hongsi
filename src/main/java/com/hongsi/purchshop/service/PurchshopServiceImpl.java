package com.hongsi.purchshop.service;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.purchshop.mapper.PurchshopMapper;
import com.hongsi.purchshop.vo.PurchshopVO;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("productionServiceImpl")
@AllArgsConstructor
@Log4j
public class PurchshopServiceImpl implements PurchshopService {
	
	public PurchshopMapper mapper;

	@Override
	public int insertPurchshopOrder(PurchshopVO vo) {
		log.info("Impl vo : "+vo);
		// 주문 들어온 상품에 대한 생산 준비
//		vo.setOrderDate(vo.getOrderDate().replace("/", ""));
//		vo.setOrderDate(vo.getOrderDate().replace(".", ""));
//		vo.setOrderDate(vo.getOrderDate().replace("-", ""));
		return mapper.insertPurchshopOrder(vo);
	}

	@Override
	public PurchshopVO selectItemTotSum() {
		return mapper.selectItemTotSum();
	}
	
	@Override
	public PurchshopVO selectItemSum() {
		return mapper.selectItemSum();
	}
	

}
