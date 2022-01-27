package com.hongsi.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hongsi.purchshop.service.PurchshopService;
import com.hongsi.quantity.service.QuantityService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("main")
@Log4j
public class MainController {
	
	private final String MODULE = "main";
	
	@Autowired
	@Qualifier("quantityServiceImpl")
	private QuantityService quantityService;
	
	@Autowired
	@Qualifier("purchshopServiceImpl")
	private PurchshopService purchshopService;
	
	// 전체 재료, original 재료량, earlgrey 재료량, sweet&salty 재료량, 전체 재고 보기
	@GetMapping("main.do")
	public String selectAllIngreStock(Model model) {
		log.info(".............................selectAllIngreStock..");		
		model.addAttribute("resultList", quantityService.selectTotalNeedFinal());
		model.addAttribute("itemTotSum", purchshopService.selectItemTotSum());		
		model.addAttribute("itemSum", purchshopService.selectItemSum());
		model.addAttribute("weekDay", purchshopService.getWeekDay());
		return MODULE+"/main";
	}

}
