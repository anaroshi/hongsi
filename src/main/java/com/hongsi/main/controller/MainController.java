package com.hongsi.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hongsi.purchshop.service.PurchSaleService;
import com.hongsi.purchshop.service.PurchOrderService;
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
	@Qualifier("purchOrderServiceImpl")
	private PurchOrderService purchOrderService;
	
	@Autowired
	@Qualifier("purchSaleServiceImpl")
	private PurchSaleService purchSaleService;
	
	// 전체 재료, original 재료량, earlgrey 재료량, SaltCaramel 재료량, 전체 재고 보기
	@GetMapping("main.do")
	public String selectAllIngreStock(Model model) throws Exception {
		log.info(".............................selectAllIngreStock..");		
		
		// 재료 (ori 필요 & erl 필요 & stc 필요 & 현재재고 & 금주필요 & 최종재고 & 주문필요)
		model.addAttribute("resultList", quantityService.selectTotalNeedFinal());
		
		// 이번주에 생산해야할 필요량 g으로 환산
		model.addAttribute("itemTotSum", purchOrderService.selectItemTotSum());
		
		// 이번주 주문량
		model.addAttribute("itemSum", purchOrderService.selectOrderSum());
		
		// 제품 재고 수량
		model.addAttribute("stockSum", purchSaleService.selectStock());
		
		// 오늘 일자 & 한주간 일자
		model.addAttribute("weekDay", purchSaleService.getWeekDay());
		return MODULE+"/main";
	}

}
