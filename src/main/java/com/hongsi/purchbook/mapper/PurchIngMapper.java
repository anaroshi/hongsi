package com.hongsi.purchbook.mapper;

import java.util.List;

import com.hongsi.purchbook.vo.PurchIngVO;
import com.hongsi.util.PageObject;

public interface PurchIngMapper {

	List<PurchIngVO> list(PageObject pageObject);

	int getBuyTotalRow();

	List<PurchIngVO> selectNonInDate();

	int insertIng(PurchIngVO vo);

	int updateInDate(PurchIngVO vo);	
	
	List<PurchIngVO> selectIgdTotalList();

	List<PurchIngVO> selectStorageInOut(PageObject pageObject);

	int getStorageInOutTotalRow();
	
	int deleteIng(PurchIngVO vo);

	int updateIng(PurchIngVO vo);

	PurchIngVO selectBuyStorageInfoByCno(PurchIngVO vo);

	List<PurchIngVO> selectNeedCafe();


}