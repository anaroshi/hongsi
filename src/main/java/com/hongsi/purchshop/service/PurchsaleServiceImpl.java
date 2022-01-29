package com.hongsi.purchshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.purchshop.mapper.PurchsaleMapper;
import com.hongsi.purchshop.vo.PurchsaleVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("purchsaleServiceImpl")
@AllArgsConstructor
@Log4j
public class PurchsaleServiceImpl implements PurchsaleService {

	public PurchsaleMapper mapper;
	
	@Override
	public int insertPurchsale(PurchsaleVO vo) {
		if(vo.getGubun().equals("판매")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("샘플")) vo.setGubunCode("out");
		log.info("PurchsaleServiceImpl vo:"+vo);
		return mapper.insertPurchsale(vo);
	}

	@Override
	public List<PurchsaleVO> selectSaleList() {
		return mapper.selectSaleList();
	}

}
