package com.hongsi.purchshop.mapper;

import java.util.List;

import com.hongsi.purchshop.vo.PurchOutputVO;
import com.hongsi.util.PageObject;

public interface PurchOutputMapper {

	public int insertOutput(PurchOutputVO vo);
	
	public int deleteOutputInfoByCno(long cno);
	
	public int updateOutputInfoByCno(PurchOutputVO vo);
	
	public List<PurchOutputVO> selectOutputList(PageObject pageObject);
	
	int getOutputTotalRow();

	public PurchOutputVO selectOutputInfoByCno(int cno);

}
