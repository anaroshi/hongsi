package com.hongsi.purchpack.mapper;

import java.util.List;

import com.hongsi.purchpack.vo.PurchPackItemVO;
import com.hongsi.purchpack.vo.PurchPackVO;
import com.hongsi.util.PageObject;

public interface PurchPackMapper {

	public List<PurchPackItemVO> mainList();
	public List<PurchPackItemVO> subList(String pack_code);
	public int insertPurchpackOrder(PurchPackVO vo);
	public List<PurchPackVO> selectPackList(PageObject pageObject);
	public List<PurchPackVO> selectIndatePackList(PageObject pageObject);
	public int getPackTotalRow(PageObject pageObject);
	public int getIndatePackTotalRow(PageObject pageObject);
	public PurchPackVO selectPackInfoByCno(PurchPackVO vo);
	public int deletePack(PurchPackVO vo);
	public int updatePack(PurchPackVO vo);

}