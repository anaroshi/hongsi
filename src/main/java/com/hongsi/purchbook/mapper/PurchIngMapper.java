package com.hongsi.purchbook.mapper;

import java.util.List;

import com.hongsi.purchbook.vo.PurchIngVO;

public interface PurchIngMapper {

	List<PurchIngVO> list();

	List<PurchIngVO> selectNonInDate();

	int insertIng(PurchIngVO vo);

	int updateInDate(PurchIngVO vo);	
	
	List<PurchIngVO> selectIgdTotalList();

	List<PurchIngVO> selectStorageInOut();

	int deleteIng(PurchIngVO vo);

	int updateIng(PurchIngVO vo);

	PurchIngVO selectBuyStorageInfoByCno(PurchIngVO vo);

}