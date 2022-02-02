package com.hongsi.purchshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.purchshop.mapper.PurchProductMapper;
import com.hongsi.purchshop.vo.PurchProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("purchProductServiceImpl")
@AllArgsConstructor
@Log4j
public class PurchProductServiceImpl implements PurchProductService {

	public PurchProductMapper mapper;
	
	// 생산품 등록
	@Override
	public int insertProduct(PurchProductVO vo) {
		log.info("Gubun:"+vo.getGubun());		
		if(vo.getGubun().equals("생산")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");		
		log.info("---impl: vo"+vo);
		return mapper.insertProduct(vo);
	}

	// Trace : 생산품 등록
	@Override
	public int insertProductTrace(PurchProductVO vo) {
		log.info("Gubun:"+vo.getGubun());		
		if(vo.getGubun().equals("생산")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");		
		log.info("---impl: vo"+vo);
		return mapper.insertProductTrace(vo);
	}

	// 리스트 화면에서 선택하여 실제 삭제가 아닌 UPDATE 처리함 FLAG = 4
	@Override
	public int deleteProductInfoByCno(int cno) {
		log.info("impl deleteProduct cno:"+cno);
		return mapper.deleteProductInfoByCno(cno);
	}
	
	// Trace : 리스트 화면에서 선택하여 실제 삭제가 아닌 UPDATE 처리함 FLAG = 4
	@Override
	public int deleteProductInfoByCnoTrace(int cno) {
		log.info("impl deleteProductTrace cno:"+cno);
		return mapper.deleteProductInfoByCnoTrace(cno);
	}
	
	
	// 리스트 화면에서 선택하여 생산 수정 FLAG = 2
	@Override
	public int updateProductInfoByCno(PurchProductVO vo) {		
		if(vo.getGubun().equals("생산")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");		
		log.info("---impl: vo"+vo);		
		return mapper.updateProductInfoByCno(vo);
	}
	
	// 생산품 등록 리스트
	@Override
	public List<PurchProductVO> selectProductList() {
		return mapper.selectProductList();
	}

	@Override
	public PurchProductVO selectProductStock() {
		return mapper.selectProductStock();
	}

	@Override
	public PurchProductVO selectProductInfoByCno(int cno) {
		log.info("impl cno:"+cno);
		return mapper.selectProductInfoByCno(cno);
	}

}
