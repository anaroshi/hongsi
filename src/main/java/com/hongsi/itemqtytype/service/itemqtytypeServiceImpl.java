package com.hongsi.itemqtytype.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.itemqtytype.mapper.ItemqtytypeMapper;
import com.hongsi.itemqtytype.vo.ItemQtyTypeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("itemServiceImpl")
@AllArgsConstructor
@Log4j
public class itemqtytypeServiceImpl implements ItemqtytypeService {

	private ItemqtytypeMapper mapper;
	
	@Override
	public List<ItemQtyTypeVO> itemTypeList() {
		log.info("------------------- List<ItemQtyTypeVO> ");
		//log.info(mapper.itemTypeList());
		return mapper.itemTypeList();
	}
	
	

}
