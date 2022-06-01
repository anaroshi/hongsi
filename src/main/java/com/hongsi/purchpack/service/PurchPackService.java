package com.hongsi.purchpack.service;

import java.util.List;

import com.hongsi.purchpack.vo.PurchPackItemVO;
import com.hongsi.purchpack.vo.PurchPackVO;
import com.hongsi.util.PageObject;

public interface PurchPackService {
	
	public List<PurchPackItemVO> mainList() throws Exception;
	public List<PurchPackItemVO> subList(String pack_code) throws Exception;
	public int insertPurchpackOrder(PurchPackVO vo) throws Exception;
	public List<PurchPackVO> selectPackList(PageObject pageObject) throws Exception;
	public List<PurchPackVO> selectIndatePackList(PageObject pageObject) throws Exception;
	public PurchPackVO selectPackInfoByCno(PurchPackVO vo) throws Exception;
	public int deletePack(PurchPackVO vo) throws Exception;
	public int updatePack(PurchPackVO vo) throws Exception;

}
