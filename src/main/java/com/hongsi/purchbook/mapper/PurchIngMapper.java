package com.hongsi.purchbook.mapper;

import java.util.List;

import com.hongsi.purchbook.vo.PurchIngVO;

public interface PurchIngMapper {

	List<PurchIngVO> list();

	List<PurchIngVO> selectNonInDate();
	
	Integer buyProcess(PurchIngVO vo);

	List<PurchIngVO> selectIgdTotalList();

	int updateInDate(PurchIngVO vo);

	int insertStorage(PurchIngVO vo);

	List<PurchIngVO> selectStorageInOut();

	int deleteBuyStorageInfoByCno(PurchIngVO vo);

	int updateBuyInfoByCno(PurchIngVO vo);

	int insertBuyTrace(PurchIngVO vo);

//	PurchIngVO selectStorageInfoByCno(Integer cno);

	int updateStorageInfoByCno(PurchIngVO vo);

	PurchIngVO selectBuyStorageInfoByCno(PurchIngVO vo);

	int insertStorageTrace(PurchIngVO vo);

}