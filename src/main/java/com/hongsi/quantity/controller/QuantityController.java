package com.hongsi.quantity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hongsi.item.service.ItemService;
import com.hongsi.itemqtytype.service.ItemqtytypeService;
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

	@Autowired
	@Qualifier("itemServiceImpl")
	private ItemService itemService;

	@Autowired
	@Qualifier("itemqtytypeServiceImpl")
	private ItemqtytypeService itemqtytypeService;
	
	@GetMapping("list.do")
	public String list(Model model) {
		log.info("hongsi...............................");
		
		model.addAttribute("itemList", itemService.list());		
		model.addAttribute("itemTypeList", itemqtytypeService.itemTypeList());
		//log.info("hongsi..............................."+itemService.itemTypeList());
		model.addAttribute("qtyList", quantityService.list());
		return MODULE+"/list";
	}

}
