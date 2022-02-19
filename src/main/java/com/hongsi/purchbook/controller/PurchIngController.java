package com.hongsi.purchbook.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hongsi.ingredient.service.IngredientService;
import com.hongsi.purchbook.service.PurchIngSerivce;
import com.hongsi.purchbook.vo.PurchIngVO;
import com.hongsi.quantity.service.QuantityService;
import com.hongsi.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("purchbook")
@Log4j
public class PurchIngController {
	
	private final String MODULE = "purchbook";
	
	@Autowired
	@Qualifier("purchIngSerivceImpl")
	private PurchIngSerivce purchIngSerivce;
	
	@Autowired
	@Qualifier("ingredientServiceImpl")
	private IngredientService ingredientService;
	
	@Autowired
	@Qualifier("quantityServiceImpl")
	private QuantityService quantityService;
	
	@GetMapping("buy.do")
	public String buy(Model model, @ModelAttribute PageObject pageObject) throws Exception {
		log.info(".............................purchbookController..buy"+pageObject);
		model.addAttribute("ingreList", ingredientService.list());
		model.addAttribute("resultList", quantityService.selectTotalNeedFinal());
		model.addAttribute("buyList", purchIngSerivce.selectNonInDate());
		model.addAttribute("buyInList", purchIngSerivce.selectInDate(pageObject));
		return MODULE + "/buy";
	}	
	
	// 재료구매 저장
	@PostMapping("buy.do")
	public String insertIng(PurchIngVO vo, RedirectAttributes rttr) throws Exception {
		log.info(".............................buyProcess.vo:"+vo);

		vo.setStatus("purch");
		vo.setFlag(1); // 1: 저장

		int result = purchIngSerivce.insertIng(vo);
		if (result == 1) {
			log.info(".............................저장성공");
			rttr.addFlashAttribute("msg", "입력되었습니다.");
		}
		return "redirect:buy.do";
	}	

	// 재료구매 리스트 화면
	@GetMapping("buyAllList.do")
	public String buyAllList(Model model, @ModelAttribute PageObject pageObject) throws Exception {
		log.info(".............................buyList..buy");
		log.info(".............................pageObject..:"+pageObject);
		// 재료 리스트 (select)
		model.addAttribute("ingreList", ingredientService.list());
		// 재료 구매 리스트
		model.addAttribute("resultList", purchIngSerivce.list(pageObject));
		return MODULE + "/buyAllList";
	}

	@GetMapping("stockList.do")
	public String selectIgdTotalList(Model model) throws Exception {
		log.info(".............................purchbookController..buy");
		model.addAttribute("ingreTotalList", purchIngSerivce.selectIgdTotalList());
		return MODULE + "/stockList";
	}
	
	// 입고일 저장
	@PostMapping("inDateSave.do")
	public String updateInDate(PurchIngVO vo, RedirectAttributes rttr) throws Exception {
		log.info(".............................insertInDate..:"+vo);
		
		int result = purchIngSerivce.updateInDate(vo); 
		log.info("............updateInDate..result:"+result);
		if (result==1) {		  
			rttr.addFlashAttribute("msg", "입고일 완료"); 
		}		 
		return "redirect:buy.do";
	}
	
	// 재료 입출고 화면
	@GetMapping("storage.do")
	public String storage(Model model, @ModelAttribute PageObject pageObject) throws Exception {
		log.info(".............................buyList..buy");
		// 재료 리스트 (select)
		model.addAttribute("ingreList", ingredientService.list());
		// 재료 재고
		//model.addAttribute("ingreTotalList", purchIngSerivce.selectIgdTotalList());
		model.addAttribute("ingreTotalList", purchIngSerivce.selectNeedCafe());
		// 재료 입출고 리스트
		model.addAttribute("resultList", purchIngSerivce.selectStorageInOut(pageObject));
		
		return MODULE + "/storage";
	}
	
	// 재료 입출고 저장
	@PostMapping("storage.do")
	public String insertStorage(PurchIngVO vo, RedirectAttributes rttr) throws Exception {		
		vo.setQty(1);
		vo.setStatus("storage");
		vo.setFlag(1);
		log.info(".............................insertStorage..:"+vo);
		int result = purchIngSerivce.insertIng(vo); 
		log.info(".............................insertStorage..result:"+result);		
		if (result==1) {
			log.info(".......................");
			rttr.addFlashAttribute("msg", "입출고 완료"); 
		}		
		return "redirect:storage.do";
	}
	
	@GetMapping("storageAllList.do")
	public String storageAllList(Model model, @ModelAttribute PageObject pageObject) throws Exception {
		log.info(".............................storageAllList..pageObject:"+pageObject);
		// 재료 리스트 (select)
		model.addAttribute("ingreList", ingredientService.list());
		// 재료 입출고 리스트
		model.addAttribute("resultList", purchIngSerivce.selectStorageInOut(pageObject));
		return MODULE + "/storageAllList";
	}

}
