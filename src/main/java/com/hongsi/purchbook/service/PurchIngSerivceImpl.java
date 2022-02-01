package com.hongsi.purchbook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.purchbook.mapper.PurchIngMapper;
import com.hongsi.purchbook.vo.PurchIngVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("purchIngSerivceImpl")
@AllArgsConstructor
@Log4j
public class PurchIngSerivceImpl implements PurchIngSerivce {
	
	private PurchIngMapper mapper;
	
	@Override
	public List<PurchIngVO> list() {
		log.info("------------------- purchIngSerivceImpl - List<PurchbookVO> ");
		return mapper.list();
	}

	@Override
	public List<PurchIngVO> selectNonInDate() {
		return mapper.selectNonInDate();
	}

	@Override
	public Integer buyProcess(PurchIngVO vo) {		
		vo.setInDate(vo.getInDate().replace("/", ""));
		vo.setInDate(vo.getInDate().replace(".", ""));
		vo.setInDate(vo.getInDate().replace("-", ""));
		if(vo.getGubun().equals("구매")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");

		return mapper.buyProcess(vo);
	}

	@Override
	public List<PurchIngVO> selectIgdTotalList() {		
		return mapper.selectIgdTotalList();
	}

	@Override
	public int updateInDate(PurchIngVO vo) {
		return mapper.updateInDate(vo);
	}

	@Override
	public int insertStorage(PurchIngVO vo) {		
		if(vo.getGubun().equals("출고")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("입고_office")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("입고_cafe")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");
		log.info("impl: vo"+vo);
		return mapper.insertStorage(vo);
	}

	@Override
	public List<PurchIngVO> selectStorageInOut() {
		return mapper.selectStorageInOut();
	}

	// 재료 구매 & 입출고 정보 삭제
	@Override
	public int deleteBuyStorageInfoByCno(PurchIngVO vo) {
		return mapper.deleteBuyStorageInfoByCno(vo);
	}

	@Override
	public int updateBuyInfoByCno(PurchIngVO vo) {		
		vo.setInDate(vo.getInDate().replace("/", ""));
		vo.setInDate(vo.getInDate().replace(".", ""));
		vo.setInDate(vo.getInDate().replace("-", ""));
		if(vo.getGubun().equals("구매")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");
		log.info("impl: vo"+vo);		
		return mapper.updateBuyInfoByCno(vo);
	}

	@Override
	public int insertBuyTrace(PurchIngVO vo) {
		if(vo.getGubun().equals("구매")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");
		log.info("impl: vo"+vo);		
		return mapper.insertBuyTrace(vo);
	}

	// 재료 입출고 수정을 위한 cno에 해당하는 정보 가져오기
//	@Override
//	public PurchIngVO selectStorageInfoByCno(Integer cno) {		
//		return mapper.selectStorageInfoByCno(cno);
//	}

	// 재료 입출고 수정
	@Override
	public int updateStorageInfoByCno(PurchIngVO vo) {
		if(vo.getGubun().equals("출고")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("입고_office")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("입고_cafe")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");
		log.info("impl: vo"+vo);
		return mapper.updateStorageInfoByCno(vo);
	}

	// 재료 입출고 수정을 위한 cno에 해당하는 정보 가져오기
	@Override
	public PurchIngVO selectBuyStorageInfoByCno(PurchIngVO vo) {
		return mapper.selectBuyStorageInfoByCno(vo);
	}

	@Override
	public int insertStorageTrace(PurchIngVO vo) {
		if(vo.getGubun().equals("구매")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("교환")) vo.setGubunCode("out");
		else if(vo.getGubun().equals("반품")) vo.setGubunCode("in");
		else if(vo.getGubun().equals("손실")) vo.setGubunCode("out");
		log.info("impl: vo"+vo);		
		return mapper.insertStorageTrace(vo);
	}

}
