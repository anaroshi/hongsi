package com.hongsi.ingredient.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.hongsi.ingredient.mapper.IngredientMapper;
import com.hongsi.ingredient.vo.IngredientVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Qualifier("ingredientServiceImpl")
@AllArgsConstructor
@Log4j
public class IngredientServiceImpl implements IngredientService {
	
	public IngredientMapper mapper;
	
	@Override
	public List<IngredientVO> list() {
		log.info("--------------------------IngredientServiceImpl");
		return mapper.list();
	}

}
