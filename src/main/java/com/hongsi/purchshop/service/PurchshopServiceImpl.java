package com.hongsi.purchshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.purchshop.mapper.PurchshopMapper;
import com.hongsi.purchshop.vo.PurchshopVO;

import lombok.AllArgsConstructor;
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
		if(vo.getGubun().equals("주문")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");
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

	@Override
	public List<PurchshopVO> selectOrderList() {
		// 주문 리스트
		return mapper.selectOrderList();
	}
	
	@Override
	public List<PurchshopVO> selectOrderListSuntSat() {
		// 주문 리스트 일요일 ~ 토요일
		return mapper.selectOrderListSuntSat();
	}

	@Override
	public PurchshopVO getWeekDay() {
		// 생산의 기준이 되는 이번주의 시작 일요일과 마지막인 토요일 구하기
		return mapper.getWeekDay();
	}

	@Override
	public int insertProduct(PurchshopVO vo) {
		log.info("Gubun:"+vo.getGubun());
		log.info("OrderDate:"+vo.getOrderDate());
		if(vo.getGubun().equals("생산")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");
		vo.setDDate(vo.getOrderDate());
		log.info("---impl: vo"+vo);
		return mapper.insertProduct(vo);
	}

	@Override
	public List<PurchshopVO> selectProductList() {
		return mapper.selectProductList();
	}

	// 완제품 재고 현황
	@Override
	public PurchshopVO selectProductStock() {		
		return  mapper.selectProductStock();
	}

	// 주문 화면에서 주문 리스트에서 주문을 선택
	// 판매 정보에 넘겨주기 위함.
	@Override
	public PurchshopVO selectOrderByCno(int cno) {
		return mapper.selectOrderByCno(cno);
	}


}
