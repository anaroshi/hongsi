package com.hongsi.purchbook.mapper;

import java.util.List;

import com.hongsi.purchbook.vo.PurchbookVO;

public interface PurchbookMapper {

	List<PurchbookVO> list();

	List<PurchbookVO> selectNonInDate();
	
	Integer buyProcess(PurchbookVO vo);

	List<PurchbookVO> selectIgdTotalList();

	int updateInDate(PurchbookVO vo);

	int insertStorage(PurchbookVO vo);

	List<PurchbookVO> selectStorageInOut();

}