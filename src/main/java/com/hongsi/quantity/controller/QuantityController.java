package com.hongsi.quantity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hongsi.item.service.ItemService;
import com.hongsi.itemqtytype.service.ItemqtytypeService;
import com.hongsi.quantity.service.QuantityService;
import com.hongsi.quantity.vo.QuantityVO;

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
		
		// 재료함량 화면에서 제품 목록 EARLGREY, ORIGINAL, SWEETNSALTY
		model.addAttribute("itemList", itemService.list());
		// 제품별 목록 구성 비교 근거 & 제품 g
		model.addAttribute("itemTypeList", itemqtytypeService.itemTypeList());
		//log.info("hongsi..............................."+itemService.itemTypeList());
		// 제품 100g당 함량 리스트
		model.addAttribute("qtyList", quantityService.list());
		return MODULE+"/list";
	}
	
	// 제품생산 화면 - 제품 100g당 재료량과 로스팅 1회당 재료량 구하기
	@GetMapping("product.do")
	public String product(Model model) {
		log.info(".............................product..");
		
		model.addAttribute("itemList", itemService.list());			
		return MODULE+"/product";
	}
	
	// 제품생산에서 item 선택시 재고값과 item의 함류량 값 가져오기
	@ResponseBody
	@PostMapping("productProcess.do")
	public List<QuantityVO> productProcess(String code) {
		log.info(".............................productProcess..");
		List<QuantityVO> result = quantityService.selectTotalByItem(code);
		//log.info(".............................productProcess..result : "+ result);
		return result;
	}
}
