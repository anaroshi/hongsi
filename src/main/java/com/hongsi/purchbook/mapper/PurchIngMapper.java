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

	PurchIngVO selectBuyInfoByCno(Integer cno);

	int deleteBuyInfoByCno(Integer cno);

	int updateBuyInfoByCno(PurchIngVO vo);

	int insertTrace(PurchIngVO vo);

}