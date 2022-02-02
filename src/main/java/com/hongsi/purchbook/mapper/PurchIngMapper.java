package com.hongsi.purchbook.mapper;

import java.util.List;

import com.hongsi.purchbook.vo.PurchIngVO;

public interface PurchIngMapper {

	List<PurchIngVO> list();

	List<PurchIngVO> selectNonInDate();

	int insertIng(PurchIngVO vo);
	int insertIngTrace(PurchIngVO vo);

	int updateInDate(PurchIngVO vo);
	int insertInDateTrace(PurchIngVO vo);
	
	List<PurchIngVO> selectIgdTotalList();

	List<PurchIngVO> selectStorageInOut();

	int deleteIng(PurchIngVO vo);
	int deleteIngTrace(PurchIngVO vo);

	int updateIng(PurchIngVO vo);
	int updateIngTrace(PurchIngVO vo);

//	PurchIngVO selectStorageInfoByCno(Integer cno);

	PurchIngVO selectBuyStorageInfoByCno(PurchIngVO vo);

}