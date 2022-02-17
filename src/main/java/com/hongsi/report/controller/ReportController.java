package com.hongsi.report.controller;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hongsi.purchbook.service.PurchIngSerivce;
import com.hongsi.purchshop.service.PurchOrderService;
import com.hongsi.purchshop.service.PurchProductService;
import com.hongsi.purchshop.service.PurchSaleService;
import com.hongsi.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("report")
public class ReportController {	
	
	private final String MODULE = "report"; 
	
	// 재료
	@Autowired
	@Qualifier("purchIngSerivceImpl")
	private PurchIngSerivce purchIngSerivce;
	
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
	
	@GetMapping("report.do")
	public String report() {
		log.info("-------------------report--");
		return MODULE+"/report";		
	}
	
	@GetMapping("excelDownload")
	public String excelDownload(@RequestParam Map<String, Object> paramMap, Model model, PageObject pageObject, HttpServletResponse res) throws Exception {
		log.info("-------------------excelDownload--");
		
		res.setHeader("Content-disposition", "attachment; filename= hongsiMarket.xlsx");
		
		// 재료구매 리스트 화면
		log.info(".............................buyAllList..");
		model.addAttribute("buyList", purchIngSerivce.list(pageObject));
		
		// 재료 입출고 리스트
		log.info(".............................storageAllList..");
		model.addAttribute("inOutList", purchIngSerivce.selectStorageInOut(pageObject));
		
		// 주문 내역
		log.info(".............................orderAllList..");
		model.addAttribute("orderList", purchOrderService.selectOrderList(pageObject));
		
		// 생산 정보 리스트
		log.info(".............................productAllList..");
		model.addAttribute("productList", purchProductService.selectProductList(pageObject));
		
		// 판매 정보 리스트
		log.info(".............................saleAllList..");
		model.addAttribute("saleList", purchSaleService.selectSaleList(pageObject));		
		
		return "excelView";		
	}

	@PostMapping("uploadExcel")
	public String uploadExcel() {
		log.info("-------------------uploadExcel--");
		return MODULE+"/report";		
	}

}
