package com.hongsi.purchbook.service;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.purchbook.mapper.PurchIngMapper;
import com.hongsi.purchbook.vo.PurchIngVO;
import com.hongsi.util.PageObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("purchIngSerivceImpl")
@AllArgsConstructor
@Log4j
public class PurchIngSerivceImpl implements PurchIngSerivce {
	
	private PurchIngMapper mapper;
	
	@Override
	public List<PurchIngVO> list(PageObject pageObject) throws Exception {
		// log.info("------------------- purchIngSerivceImpl - List<PurchbookVO> ");
		pageObject.setTotalRow(mapper.getBuyTotalRow(pageObject));
		log.info("------------------- purchIngSerivceImpl - pageObject :"+pageObject);
		return mapper.list(pageObject);
	}

	// 주문리스트(입고일 미입력)
	@Override
	public List<PurchIngVO> selectNonInDate() throws Exception {
		return mapper.selectNonInDate();
	}

	// 주문리스트(입고일 입력된 주문 리스트)
	@Override
	public List<PurchIngVO> selectInDate(PageObject pageObject) {
		pageObject.setTotalRow(mapper.getInTotalRow());
		return mapper.selectInDate(pageObject);
	}

	// 주문 정보 저장
	@Override
	public int insertIng(PurchIngVO vo) throws Exception {	
		
		String status 	= vo.getStatus();
		String gubun 	= vo.getGubun();

		if (status.equals("purch")) {
		// 재료 주문
			if(gubun.equals("구매")) vo.setGubunCode("in");
			else if(gubun.equals("구매_office")) vo.setGubunCode("in");
			else if(gubun.equals("구매_cafe")) vo.setGubunCode("in");
			else if(gubun.equals("교환")) vo.setGubunCode("out");
			else if(gubun.equals("반품")) vo.setGubunCode("in");
			else if(gubun.equals("손실")) vo.setGubunCode("out");
			else if(gubun.equals("취소")) vo.setGubunCode("out");
			
			String inDate = vo.getInDate();
			vo.setInDate(inDate.replace("/", ""));
			vo.setInDate(inDate.replace(".", ""));
			vo.setInDate(inDate.replace("-", ""));
		}
		
		if (status.equals("storage")) {
		// 재료 입출고		
			if(gubun.equals("출고")) vo.setGubunCode("out");
			else if(gubun.equals("출고_office")) vo.setGubunCode("out");
			else if(gubun.equals("출고_cafe")) vo.setGubunCode("out");
			else if(gubun.equals("입고_office")) vo.setGubunCode("in");
			else if(gubun.equals("입고_cafe")) vo.setGubunCode("in");
			else if(gubun.equals("손실")) vo.setGubunCode("out");
			else if(gubun.equals("취소")) vo.setGubunCode("out");
			vo.setPurShop("");
			vo.setInDate(new SimpleDateFormat("yyyyMMdd").format(vo.getBuyDate()));
		}		
		log.info("------------------ing impl vo:"+vo);
		return mapper.insertIng(vo);
	}

	@Override
	public List<PurchIngVO> selectIgdTotalList() throws Exception {		
		return mapper.selectIgdTotalList();
	}

	// 입고일 저장
	@Override
	public int updateInDate(PurchIngVO vo) throws Exception {
		log.info("입고일 저장 ----impl--------vo:"+vo);
		return mapper.updateInDate(vo);
	}

	// 재료 입출고 리스트
	@Override
	public List<PurchIngVO> selectStorageInOut(PageObject pageObject) throws Exception {
		pageObject.setTotalRow(mapper.getStorageInOutTotalRow(pageObject));
		return mapper.selectStorageInOut(pageObject);
	}

	// 재료 구매 & 입출고 정보 삭제
	@Override
	public int deleteIng(PurchIngVO vo) throws Exception {
		return mapper.deleteIng(vo);
	}
	
	// 재료 구입 / 입출고 수정
	@Override
	public int updateIng(PurchIngVO vo) throws Exception {
		log.info("------------------updateIng impl vo:"+vo);
		String status 	= vo.getStatus();
		String gubun 	= vo.getGubun();

		if (status.equals("purch")) {
		// 재료 주문
			if(gubun.equals("구매")) vo.setGubunCode("in");
			else if(gubun.equals("구매_office")) vo.setGubunCode("in");
			else if(gubun.equals("구매_cafe")) vo.setGubunCode("in");
			else if(gubun.equals("교환")) vo.setGubunCode("out");
			else if(gubun.equals("반품")) vo.setGubunCode("in");
			else if(gubun.equals("손실")) vo.setGubunCode("out");
			else if(gubun.equals("취소")) vo.setGubunCode("out");
			
			String inDate = vo.getInDate();
			vo.setInDate(inDate.replace("/", ""));
			vo.setInDate(inDate.replace(".", ""));
			vo.setInDate(inDate.replace("-", ""));
		}
		
		if (status.equals("storage")) {
		// 재료 입출고		
			if(gubun.equals("출고")) vo.setGubunCode("out");
			else if(gubun.equals("출고_office")) vo.setGubunCode("out");
			else if(gubun.equals("출고_cafe")) vo.setGubunCode("out");
			else if(gubun.equals("입고_office")) vo.setGubunCode("in");
			else if(gubun.equals("입고_cafe")) vo.setGubunCode("in");
			else if(gubun.equals("손실")) vo.setGubunCode("out");
			else if(gubun.equals("취소")) vo.setGubunCode("out");
			vo.setPurShop("");
			vo.setInDate(new SimpleDateFormat("yyyyMMdd").format(vo.getBuyDate()));
		}		
		log.info("------------------ing impl vo:"+vo);
		return mapper.updateIng(vo);
	}
	

	// 재료 입출고 수정을 위한 cno에 해당하는 정보 가져오기
	@Override
	public PurchIngVO selectBuyStorageInfoByCno(PurchIngVO vo) throws Exception {
		return mapper.selectBuyStorageInfoByCno(vo);
	}

	// 재료입출고 수량파악
	@Override
	public List<PurchIngVO> selectNeedCafe() throws Exception {
		return mapper.selectNeedCafe();
	}
}
