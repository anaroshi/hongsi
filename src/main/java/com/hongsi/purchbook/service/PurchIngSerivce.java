package com.hongsi.purchbook.service;

import java.util.List;

import com.hongsi.purchbook.vo.PurchIngVO;

public interface PurchIngSerivce {
	
	public List<PurchIngVO> list();

	public List<PurchIngVO> selectNonInDate();

	public int insertIng(PurchIngVO vo);
	
	public int updateInDate(PurchIngVO vo);
	
	public List<PurchIngVO> selectIgdTotalList();
	
	public List<PurchIngVO> selectStorageInOut();

	public int deleteIng(PurchIngVO vo);

	public int updateIng(PurchIngVO vo);

	public PurchIngVO selectBuyStorageInfoByCno(PurchIngVO vo);

}
