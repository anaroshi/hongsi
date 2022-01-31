package com.hongsi.purchshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.purchshop.mapper.PurchOrderMapper;
import com.hongsi.purchshop.vo.PurchOrderVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("productionServiceImpl")
@AllArgsConstructor
@Log4j
public class PurchOrderServiceImpl implements PurchOrderService {
	
	public PurchOrderMapper mapper;

	@Override
	public int insertPurchshopOrder(PurchOrderVO vo) {
		log.info("Impl vo : "+vo);
		// 주문 들어온 상품에 대한 생산 준비
//		vo.setOrderDate(vo.getOrderDate().replace("/", ""));
//		vo.setOrderDate(vo.getOrderDate().replace(".", ""));
//		vo.setOrderDate(vo.getOrderDate().replace("-", ""));
		if(vo.getGubun().equals("주문")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");
		return mapper.insertPurchshopOrder(vo);
	}

	@Override
	public PurchOrderVO selectItemTotSum() {
		return mapper.selectItemTotSum();
	}
	
	@Override
	public PurchOrderVO selectOrderSum() {
		return mapper.selectOrderSum();
	}

	@Override
	public List<PurchOrderVO> selectOrderList() {
		// 주문 리스트
		return mapper.selectOrderList();
	}
	
	@Override
	public List<PurchOrderVO> selectOrderListSuntSat() {
		// 주문 리스트 일요일 ~ 토요일
		return mapper.selectOrderListSuntSat();
	}

	// 완제품 재고 현황
	@Override
	public PurchOrderVO selectProductStock() {		
		return  mapper.selectProductStock();
	}

	// 주문 화면에서 주문 리스트에서 주문을 선택
	// 판매 정보에 넘겨주기 위함.
	@Override
	public PurchOrderVO selectOrderByCno(int cno) {
		return mapper.selectOrderByCno(cno);
	}

	@Override
	public int updatePurchshopOrder(long cno) {		
		return mapper.updatePurchshopOrder(cno);
	}

	@Override
	public PurchOrderVO selectOrderStock() {
		return mapper.selectOrderStock();
	}

	@Override
	public List<PurchOrderVO> selectOrderListWaitSale() {
		return mapper.selectOrderListWaitSale();
	}


}
