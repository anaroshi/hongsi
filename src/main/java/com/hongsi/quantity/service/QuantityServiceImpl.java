package com.hongsi.quantity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.quantity.mapper.QuantityMapper;
import com.hongsi.quantity.vo.QuantityVO;

import lombok.AllArgsConstructor;

@Service
@Qualifier("quantityServiceImpl")
@AllArgsConstructor
public class QuantityServiceImpl implements QuantityService {
	
	private QuantityMapper mapper;

	@Override
	public List<QuantityVO> list() {
		return mapper.list();
	}
	
	

}
