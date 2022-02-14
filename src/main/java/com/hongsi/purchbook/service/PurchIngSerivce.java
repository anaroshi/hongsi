package com.hongsi.purchbook.service;

import java.util.List;

import com.hongsi.purchbook.vo.PurchIngVO;

public interface PurchIngSerivce {
	
	public List<PurchIngVO> list() throws Exception;

	public List<PurchIngVO> selectNonInDate() throws Exception;

	public int insertIng(PurchIngVO vo) throws Exception;
	
	public int updateInDate(PurchIngVO vo) throws Exception;
	
	public List<PurchIngVO> selectIgdTotalList() throws Exception;
	
	public List<PurchIngVO> selectStorageInOut() throws Exception;

	public int deleteIng(PurchIngVO vo) throws Exception;

	public int updateIng(PurchIngVO vo) throws Exception;

	public PurchIngVO selectBuyStorageInfoByCno(PurchIngVO vo) throws Exception;

	public List<PurchIngVO> selectNeedCafe() throws Exception;

}
