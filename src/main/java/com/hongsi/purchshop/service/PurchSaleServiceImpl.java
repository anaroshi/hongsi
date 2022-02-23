package com.hongsi.purchshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.purchshop.mapper.PurchSaleMapper;
import com.hongsi.purchshop.vo.PurchSaleVO;
import com.hongsi.util.PageObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("purchSaleServiceImpl")
@AllArgsConstructor
@Log4j
public class PurchSaleServiceImpl implements PurchSaleService {

	public PurchSaleMapper mapper;
	
	// 판매 정보 등록
	@Override
	public int insertSale(PurchSaleVO vo) {
		if(vo.getGubun().equals("판매")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("경비")) vo.setGubunCode("out");
		log.info("PurchsaleServiceImpl vo:"+vo);
		return mapper.insertSale(vo);
	}

	// 판매 정보 리스트
	@Override
	public List<PurchSaleVO> selectSaleList(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getSaleTotalRow());	
		return mapper.selectSaleList(pageObject);
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

	@Override
	public PurchSaleVO selectSaleInfoByCno(int cno) {
		return mapper.selectSaleInfoByCno(cno);
	}

	@Override
	public int deleteSaleInfoByCno(long cno) {
		log.info("-----------impl-------------deleteSale :"+cno);
		return mapper.deleteSaleInfoByCno(cno);
	}

	@Override
	public int updateSaleInfoByCno(PurchSaleVO vo) {
		vo.setOrderDate(vo.getOrderDate().replace("/", ""));
		vo.setOrderDate(vo.getOrderDate().replace(".", ""));
		vo.setOrderDate(vo.getOrderDate().replace("-", ""));
		vo.setDeleveryDate(vo.getDeleveryDate().replace("/", ""));
		vo.setDeleveryDate(vo.getDeleveryDate().replace(".", ""));
		vo.setDeleveryDate(vo.getDeleveryDate().replace("-", ""));
		if(vo.getGubun().equals("판매")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("교환출고")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("교환입고")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("교환손실")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("경비")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("주문취소")) vo.setGubunCode("cancle");
		log.info("PurchsaleServiceImpl vo:"+vo);
		
		return mapper.updateSaleInfoByCno(vo);
	}


}
