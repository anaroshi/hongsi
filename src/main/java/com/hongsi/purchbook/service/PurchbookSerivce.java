package com.hongsi.purchbook.service;

import java.util.List;

import com.hongsi.purchbook.vo.PurchbookVO;
import com.hongsi.purchshop.vo.PurchshopVO;

public interface PurchbookSerivce {
	
	public List<PurchbookVO> list();

	public List<PurchbookVO> selectNonInDate();
	
	public Integer buyProcess(PurchbookVO vo);
	
	public List<PurchbookVO> selectIgdTotalList();
	
	public int updateInDate(PurchbookVO vo);
	
	public int insertStorage(PurchbookVO vo);

	public List<PurchbookVO> selectStorageInOut();
}
