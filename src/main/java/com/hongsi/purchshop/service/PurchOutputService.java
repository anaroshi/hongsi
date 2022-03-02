package com.hongsi.purchshop.service;

import java.util.List;

import com.hongsi.purchshop.vo.PurchOutputVO;
import com.hongsi.util.PageObject;

public interface PurchOutputService {

	public int insertOutput(PurchOutputVO vo);
	
	public int deleteOutputInfoByCno(long cno);
	
	public int updateOutputInfoByCno(PurchOutputVO vo);
	
	public List<PurchOutputVO> selectOutputList(PageObject pageObject);

	public PurchOutputVO selectOutputInfoByCno(int cno);

}
