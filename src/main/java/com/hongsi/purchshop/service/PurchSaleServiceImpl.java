package com.hongsi.purchshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.purchshop.mapper.PurchSaleMapper;
import com.hongsi.purchshop.vo.PurchSaleVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("purchsaleServiceImpl")
@AllArgsConstructor
@Log4j
public class PurchSaleServiceImpl implements PurchSaleService {

	public PurchSaleMapper mapper;
	
	// 판매 정보 등록
	@Override
	public int insertPurchsale(PurchSaleVO vo) {
		if(vo.getGubun().equals("판매")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("샘플")) vo.setGubunCode("out");
		log.info("PurchsaleServiceImpl vo:"+vo);
		return mapper.insertPurchsale(vo);
	}

	@Override
	public List<PurchSaleVO> selectSaleList() {
		return mapper.selectSaleList();
	}
	
	@Override
	public PurchSaleVO getWeekDay() {
		// 생산의 기준이 되는 이번주의 시작 일요일과 마지막인 토요일 구하기
		return mapper.getWeekDay();
	}

	// 제품 재고
	@Override
	public PurchSaleVO selectStock() {
		return mapper.selectStock();
	}

	@Override
	public PurchSaleVO selectSaleStock() {
		return mapper.selectSaleStock();
	}


}
