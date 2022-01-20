package com.hongsi.item.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.item.mapper.ItemMapper;
import com.hongsi.item.vo.ItemVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("itemServiceImpl")
@AllArgsConstructor
@Log4j
public class ItemServiceImpl implements ItemService {

	private ItemMapper mapper;
	
	@Override
	public List<ItemVO> list() {	
		log.info("------------------- List<ItemVO>");
		return mapper.list();
	}
	

}
