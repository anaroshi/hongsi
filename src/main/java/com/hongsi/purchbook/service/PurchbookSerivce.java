package com.hongsi.purchbook.service;

import java.util.List;

import com.hongsi.purchbook.vo.PurchbookVO;

public interface PurchbookSerivce {
	
	public List<PurchbookVO> list();
	
	public Integer buyProcess(PurchbookVO vo);
	
	public List<PurchbookVO> selectIgdTotalList();
	
	

}
