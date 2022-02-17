package com.hongsi.purchshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hongsi.purchshop.service.PurchProductService;
import com.hongsi.purchshop.service.PurchSaleService;
import com.hongsi.purchshop.service.PurchOrderService;
import com.hongsi.purchshop.vo.PurchProductVO;
import com.hongsi.purchshop.vo.PurchSaleVO;
import com.hongsi.util.PageObject;
import com.hongsi.purchshop.vo.PurchOrderVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("purchshop")
@Log4j
public class PurchshopController {

	private final String MODULE = "purchshop";
	
	// 주문
	@Autowired
	@Qualifier("purchOrderServiceImpl")
	private PurchOrderService purchOrderService;

	// 판매
	@Autowired
	@Qualifier("purchSaleServiceImpl")
	private PurchSaleService purchSaleService;
	
	// 생산
	@Autowired
	@Qualifier("purchProductServiceImpl")
	private PurchProductService purchProductService;
	
	
// ----------------------------------------------------- 주문 -----------------------------------------------------

	// 주문 입력 화면 (정보 일요일 ~ 토요일 주문 내역)
	@GetMapping("order.do")
	public String order(PurchOrderVO vo, Model model) throws Exception {
		log.info(".............................orderList..");
		model.addAttribute("orderList", purchOrderService.selectOrderListSuntSat());
		return MODULE + "/order";
	}

	// 주문 정보 저장
	@PostMapping("order.do")
	public String insertPurchshopOrder(PurchOrderVO vo, RedirectAttributes rttr) throws Exception {
		log.info("insertOrder vo :" + vo);
		vo.setStatus("order");
		vo.setFlag(1);
		int result = purchOrderService.insertPurchshopOrder(vo);
		if (result == 1) {
			rttr.addFlashAttribute("msg", "주문 완료");
		}
		return "redirect:/purchshop/order.do";
	}
	

	// 주문 내역
	@GetMapping("orderAllList.do")
	public String orderAllList(PurchOrderVO vo, Model model, @ModelAttribute PageObject pageObject) throws Exception {
		log.info(".............................orderAllList..");
		model.addAttribute("orderList", purchOrderService.selectOrderList(pageObject));
		//model.addAttribute("orderStock", purchOrderService.selectOrderStock());
		return MODULE + "/orderAllList";
	}

// ----------------------------------------------------- 생산 -----------------------------------------------------	
	
	// 생산 정보 입력 화면
	@GetMapping("product.do")
	public String product(PurchProductVO vo, Model model, @ModelAttribute PageObject pageObject) throws Exception {
		log.info(".............................product..vo:"+vo);
		// 생산 정보 리스트
		model.addAttribute("productList", purchProductService.selectProductList(pageObject));
		// 이번주 주문량
		model.addAttribute("orderSum", purchOrderService.selectOrderSum());
				
		// 제품 재고 수량
		model.addAttribute("stockSum", purchSaleService.selectStock());
		
		// 일자 & 한주간 일자 
		model.addAttribute("weekDay", purchSaleService.getWeekDay());
		return MODULE + "/product";
	}

	// 생산 정보 저장
	@PostMapping("product.do")
	public String insertProduct(PurchProductVO vo, RedirectAttributes rttr) throws Exception {
		log.info("insertProduct vo :" + vo);
		vo.setStatus("product");
		vo.setFlag(1);
		int result = purchProductService.insertProduct(vo);
		if (result == 1) {
			rttr.addFlashAttribute("msg", "생산 완료");
		}
		return "redirect:/purchshop/product.do";
	}

	// 생산 정보 리스트 화면
	@GetMapping("productAllList.do")
	public String productAllList(Model model, @ModelAttribute PageObject pageObject) throws Exception {
		model.addAttribute("productList", purchProductService.selectProductList(pageObject));
		//model.addAttribute("productStock", purchProductService.selectProductStock());
		return MODULE + "/productAllList";
	}
	
	// ----------------------------------------------------- 판매 -----------------------------------------------------	
	
	// 판매 정보 입력 화면
	@GetMapping("sale.do")
	public String sale(PurchOrderVO vo, Model model, @ModelAttribute PageObject pageObject, @RequestParam(required = false, defaultValue = "0") int order_cno) throws Exception {
		log.info(".............................sale..cno:"+order_cno);
		
		// 주문 정보(주문게시판에서 주문 클릭시 주문에 대한 정보를 가져와 판매 정보에 넣어준다.)
		if (order_cno > 0) {
			model.addAttribute("vo", purchOrderService.selectOrderByCno(order_cno));
		}
		// 주문 정보 리스트
		model.addAttribute("orderList", purchOrderService.selectOrderListWaitSale());
		
		// 판매 정보 리스트
		model.addAttribute("saleList", purchSaleService.selectSaleList(pageObject));
		return MODULE + "/sale";
	}

	// 판매 정보 저장
	@PostMapping("sale.do")
	public String insertSale(PurchSaleVO vo, RedirectAttributes rttr) throws Exception {
		log.info("insertPurchsale vo :" + vo);
		vo.setStatus("sale");
		vo.setFlag(1);
		
		// 주문 정보에서 값을 가져와 판매 처리할 경우
		// PURCHORDER 테이블에 STATUS에 'done' 입력하여 주문완료 처리를 해준다. 		
		if (vo.getOrder_cno() > 0 ) {
			long cno = vo.getOrder_cno();
			int resuleUpdate = purchOrderService.updatePurchshopOrder(cno);
			log.info("resuleUpdate: "+resuleUpdate);
		}
		
		// 판매 테이블에 주문 정보 저장
		int result = purchSaleService.insertSale(vo);		
		if (result == 1) { 
			rttr.addFlashAttribute("msg", "판매 완료"); 
		}

		return "redirect:/purchshop/sale.do";
	}
	
	// 판매 정보 리스트 화면
	@GetMapping("saleAllList.do")
	public String saleAllList(Model model, @ModelAttribute PageObject pageObject) throws Exception {
		log.info(".............................saleAllList");
		// 판매 정보 리스트
		model.addAttribute("saleList", purchSaleService.selectSaleList(pageObject));	
		//model.addAttribute("saleStock", purchSaleService.selectSaleStock());	
		return MODULE + "/saleAllList";
	}
}
