package com.hongsi.purchshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hongsi.purchshop.service.PurchshopService;
import com.hongsi.purchshop.vo.PurchshopVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("purchshop")
@Log4j
public class PurchshopController {

	private final String MODULE = "purchshop";
	
	@Autowired
	@Qualifier("purchshopServiceImpl")
	private PurchshopService purchshopService;

	@GetMapping("order.do")
	public String list() {
		log.info(".............................PurchshopController..");
		return MODULE + "/order";
	}

	// 주문 정보 저장
	@PostMapping("order.do")
	public String insertPurchshopOrder(PurchshopVO vo, RedirectAttributes rttr) {
		log.info("insertOrder vo :" + vo);
		int result = purchshopService.insertPurchshopOrder(vo);
		if (result == 1) {
			rttr.addFlashAttribute("msg", "생산주문저장완료");
		}
		return "redirect:/purchshop/order.do";
	}
}