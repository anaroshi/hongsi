package com.hongsi.quantity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hongsi.quantity.service.QuantityService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("quantity")
@Log4j
public class QuantityController {
	
	private final String MODULE = "quantity";
	
	@Autowired
	@Qualifier("quantityServiceImpl")
	private QuantityService quantityService;
	
	@GetMapping("list.do")
	public String list(Model model) {
		log.info("hongsi...............................");
		model.addAttribute("resultList", quantityService.list());
		return MODULE+"/list";
	}

}
