package com.hongsi.purchbook.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.purchbook.mapper.PurchbookMapper;
import com.hongsi.purchbook.vo.PurchbookVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("purchbookSerivceImpl")
@AllArgsConstructor
@Log4j
public class PurchbookSerivceImpl implements PurchbookSerivce {
	
	private PurchbookMapper mapper;
	
	@Override
	public List<PurchbookVO> list() {
		log.info("------------------- PurchbookSerivceImpl - List<PurchbookVO> ");
		return mapper.list();
	}

	@Override
	public List<PurchbookVO> selectNonInDate() {
		return mapper.selectNonInDate();
	}

	@Override
	public Integer buyProcess(PurchbookVO vo) {
		vo.setBuyDate(vo.getBuyDate().replace("/", ""));
		vo.setBuyDate(vo.getBuyDate().replace(".", ""));
		vo.setBuyDate(vo.getBuyDate().replace("-", ""));
		vo.setInDate(vo.getInDate().replace("/", ""));
		vo.setInDate(vo.getInDate().replace(".", ""));
		vo.setInDate(vo.getInDate().replace("-", ""));
		return mapper.buyProcess(vo);
	}

	@Override
	public List<PurchbookVO> selectIgdTotalList() {		
		return mapper.selectIgdTotalList();
	}


}
