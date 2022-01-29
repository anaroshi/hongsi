package com.hongsi.purchshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String order() {
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
		return "redirect:/purchshop/orderList.do";
	}
	
	// 일요일 ~ 토요일 주문 내역
	@GetMapping("orderList.do")
	public String orderList(PurchshopVO vo, Model model) {
		log.info(".............................orderList..");
		model.addAttribute("orderList", purchshopService.selectOrderListSuntSat());
		return MODULE + "/orderList";
	}

	// 주문 내역
	@GetMapping("orderAllList.do")
	public String orderAllList(PurchshopVO vo, Model model) {
		log.info(".............................orderAllList..");
		model.addAttribute("orderList", purchshopService.selectOrderList());
		return MODULE + "/orderAllList";
	}
	
	// 생산 정보 입력 화면
	@GetMapping("product.do")
	public String product(PurchshopVO vo,Model model) {
		log.info(".............................product..vo:"+vo);
		model.addAttribute("productList", purchshopService.selectProductList());
		// 제품 재고 수량
		model.addAttribute("stockSum", purchshopService.selectProductStock());
		return MODULE + "/product";
	}

	// 생산 정보 저장
	@PostMapping("product.do")
	public String insertProduct(PurchshopVO vo, RedirectAttributes rttr) {
		log.info("insertProduct vo :" + vo);
		int result = purchshopService.insertProduct(vo);
		if (result == 1) {
			rttr.addFlashAttribute("msg", "생산입력완료");
		}
		return "redirect:/purchshop/product.do";
	}

	// 생산 정보 리스트 화면
	@GetMapping("productAllList.do")
	public String productAllList(PurchshopVO vo,Model model) {
		log.info(".............................product..vo:"+vo);
		model.addAttribute("productList", purchshopService.selectProductList());		
		return MODULE + "/productAllList";
	}
}
