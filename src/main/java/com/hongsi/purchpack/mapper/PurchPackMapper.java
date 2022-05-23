package com.hongsi.purchpack.mapper;

import java.util.List;

import com.hongsi.purchpack.vo.PurchPackItemVO;
import com.hongsi.purchpack.vo.PurchPackVO;

public interface PurchPackMapper {

	public List<PurchPackItemVO> mainList();
	public List<PurchPackItemVO> subList(String pack_code);
	public int insertPurchpackOrder(PurchPackVO vo);
	public List<PurchPackVO> selectPackList();
	public List<PurchPackVO> selectIndatePackList();

}