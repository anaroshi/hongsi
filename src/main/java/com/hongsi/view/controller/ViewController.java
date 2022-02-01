package com.hongsi.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.lang.Nullable;
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

	// --------------------------------------- 재료 구매 -----------------------------------------------
	
	@GetMapping("view/buyModify.do")
	public String buyModify(Integer cno, Model model) {
		log.info(".............................buyModify..");
		// 재료 list
		model.addAttribute("ingreList", ingredientService.list());
		// 재료 구매한 정보
		model.addAttribute("buyInfo", purchIngSerivce.selectBuyInfoByCno(cno));
		return "view/buyModify";
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
	@Nullable  // null 허용
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
	
	
	// --------------------------------------- 재료 입출고 -----------------------------------------------
	
	@GetMapping("view/storageModify.do")
	public String storageUpdate(Integer cno, Model model) {
		log.info(".............................storageUpdate..");
		// 재료 list
//		model.addAttribute("ingreList", ingredientService.list());
		// 재료 구매한 정보
//		model.addAttribute("buyInfo", purchIngSerivce.selectBuyInfoByCno(cno));
		return "view/storageModify";
	}

	// 주문 삭제 처리
	@ResponseBody
	@PostMapping("view/storageDelete.do")
	public String storageDelete(Integer cno, RedirectAttributes rttr) {
		log.info(".............................storageDelete..");
		int result = purchIngSerivce.deleteBuyInfoByCno(cno);
		if (result == 1) {
			return "ok";
		}
		return "";
	}

	// 주문 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/storageUpdate.do")
	public String storageUpdate(PurchIngVO vo) {
		log.info(".............................storageUpdate..vo:" + vo);
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
	
	
	// --------------------------------------- 생산 -----------------------------------------------
	
	@GetMapping("view/productModify.do")
	public String productModify(Integer cno, Model model) {
		log.info(".............................productModify..");
		// 재료 list
		model.addAttribute("ingreList", ingredientService.list());
		// 재료 구매한 정보
		model.addAttribute("buyInfo", purchIngSerivce.selectBuyInfoByCno(cno));
		return "view/productModify";
	}

	// 주문 삭제 처리
	@ResponseBody
	@PostMapping("view/productDelete.do")
	public String productDelete(Integer cno, RedirectAttributes rttr) {
		log.info(".............................productDelete..");
		int result = purchIngSerivce.deleteBuyInfoByCno(cno);
		if (result == 1) {
			return "ok";
		}
		return "";
	}

	// 주문 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/productUpdate.do")
	public String productUpdate(PurchIngVO vo) {
		log.info(".............................productUpdate..vo:" + vo);
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
	

	// --------------------------------------- 주문 -----------------------------------------------
	
	@GetMapping("view/orderModify.do")
	public String orderModify(Integer cno, Model model) {
		log.info(".............................orderModify..");
		// 재료 list
		model.addAttribute("ingreList", ingredientService.list());
		// 재료 구매한 정보
		model.addAttribute("buyInfo", purchIngSerivce.selectBuyInfoByCno(cno));
		return "view/orderModify";
	}

	// 주문 삭제 처리
	@ResponseBody
	@PostMapping("view/orderDelete.do")
	public String orderDelete(Integer cno, RedirectAttributes rttr) {
		log.info(".............................orderDelete..");
		int result = purchIngSerivce.deleteBuyInfoByCno(cno);
		if (result == 1) {
			return "ok";
		}
		return "";
	}

	// 주문 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/orderUpdate.do")
	public String orderUpdate(PurchIngVO vo) {
		log.info(".............................orderUpdate..vo:" + vo);
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
	
	
	// --------------------------------------- 판매 -----------------------------------------------
	
	@GetMapping("view/saleModify.do")
	public String saleModify(Integer cno, Model model) {
		log.info(".............................saleModify..");
		// 재료 list
		model.addAttribute("ingreList", ingredientService.list());
		// 재료 구매한 정보
		model.addAttribute("buyInfo", purchIngSerivce.selectBuyInfoByCno(cno));
		return "view/saleModify";
	}

	// 주문 삭제 처리
	@ResponseBody
	@PostMapping("view/saleDelete.do")
	public String saleDelete(Integer cno, RedirectAttributes rttr) {
		log.info(".............................saleDelete..");
		int result = purchIngSerivce.deleteBuyInfoByCno(cno);
		if (result == 1) {
			return "ok";
		}
		return "";
	}

	// 주문 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/saleUpdate.do")
	public String saleUpdate(PurchIngVO vo) {
		log.info(".............................saleUpdate..vo:" + vo);
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
