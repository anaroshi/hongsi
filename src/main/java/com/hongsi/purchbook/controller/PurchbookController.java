package com.hongsi.purchbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hongsi.ingredient.service.IngredientService;
import com.hongsi.purchbook.service.PurchbookSerivce;
import com.hongsi.purchbook.vo.PurchbookVO;
import com.hongsi.quantity.service.QuantityService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("purchbook")
@Log4j
public class PurchbookController {
	
	private final String MODULE = "purchbook";
	
	@Autowired
	@Qualifier("purchbookSerivceImpl")
	private PurchbookSerivce purchbookSerivce;
	
	@Autowired
	@Qualifier("ingredientServiceImpl")
	private IngredientService ingredientService;
	
	@Autowired
	@Qualifier("quantityServiceImpl")
	private QuantityService quantityService;
	
	@GetMapping("buy.do")
	public String buy(Model model) {
		log.info(".............................purchbookController..buy");
		model.addAttribute("ingreList", ingredientService.list());
		model.addAttribute("resultList", quantityService.selectTotalNeedFinal());
		model.addAttribute("buyList", purchbookSerivce.selectNonInDate());
		return MODULE + "/buy";
	}
	
	@PostMapping("buy.do")
	public String buyProcess(PurchbookVO vo, RedirectAttributes rttr) {
		log.info(".............................buyProcess.vo:"+vo);
		Integer result = purchbookSerivce.buyProcess(vo);
		if (result == 1) {
			log.info(".............................저장성공");
			rttr.addFlashAttribute("msg", "입력되었습니다.");
		}
		return "redirect:buy.do";
	}

	@GetMapping("stockList.do")
	public String selectIgdTotalList(Model model) {
		log.info(".............................purchbookController..buy");
		model.addAttribute("ingreTotalList", purchbookSerivce.selectIgdTotalList());
		return MODULE + "/stockList";
	}
	
}
