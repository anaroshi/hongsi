package com.hongsi.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hongsi.ingredient.service.IngredientService;
import com.hongsi.purchbook.service.PurchIngSerivce;
import com.hongsi.purchbook.vo.PurchIngVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ViewController {

	@Autowired
	@Qualifier("purchIngSerivceImpl")
	private PurchIngSerivce purchIngSerivce;

	@Autowired
	@Qualifier("ingredientServiceImpl")
	private IngredientService ingredientService;

	@GetMapping("view/buyModi.do")
	public String buyUpdate(Integer cno, Model model) {
		log.info(".............................buyUpdate..");
		// 재료 list
		model.addAttribute("ingreList", ingredientService.list());
		// 재료 구매한 정보
		model.addAttribute("buyInfo", purchIngSerivce.selectBuyInfoByCno(cno));
		return "view/buyModi";
	}

	// 주문 삭제 처리
	@ResponseBody
	@PostMapping("view/buyDelete.do")
	public String buyDelete(Integer cno, RedirectAttributes rttr) {
		log.info(".............................buyDelete..");
		int result = purchIngSerivce.deleteBuyInfoByCno(cno);
		if (result == 1) {
			return "ok";
		}
		return "";
	}

	// 주문 수정 처리
	@ResponseBody
	@PostMapping("view/buyUpdate.do")
	public String buyUpdate(PurchIngVO vo) {
		log.info(".............................buyUpdate..vo:" + vo);
		vo.setFlag(2);
//		int result = purchIngSerivce.updateBuyInfoByCno(vo);	
//		log.info("............................result1:"+result);
//		result = purchIngSerivce.insertTrace(vo);
//		log.info("............................result2:"+result);
//		return "ok";

		 int result = purchIngSerivce.updateBuyInfoByCno(vo);
		 log.info("............................result:"+result); 
		 if (result==1) {
			 purchIngSerivce.insertTrace(vo); 
			 return "ok"; 
		 }
		 return "fail";
	}

}
