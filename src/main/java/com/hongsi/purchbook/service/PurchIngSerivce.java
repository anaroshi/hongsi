package com.hongsi.purchbook.service;

import java.util.List;

import com.hongsi.purchbook.vo.PurchIngVO;

public interface PurchIngSerivce {
	
	public List<PurchIngVO> list();

	public List<PurchIngVO> selectNonInDate();
	
	public Integer buyProcess(PurchIngVO vo);
	
	public List<PurchIngVO> selectIgdTotalList();
	
	public int updateInDate(PurchIngVO vo);
	
	public int insertStorage(PurchIngVO vo);

	public List<PurchIngVO> selectStorageInOut();

	public int deleteBuyStorageInfoByCno(PurchIngVO vo);

	public int updateBuyInfoByCno(PurchIngVO vo);

	public int insertBuyTrace(PurchIngVO vo);

//	public PurchIngVO selectStorageInfoByCno(Integer cno);

	public PurchIngVO selectBuyStorageInfoByCno(PurchIngVO vo);

	public int updateStorageInfoByCno(PurchIngVO vo);
	
	public int insertStorageTrace(PurchIngVO vo);

}
