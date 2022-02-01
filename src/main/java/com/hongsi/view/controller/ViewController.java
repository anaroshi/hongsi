package com.hongsi.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hongsi.ingredient.service.IngredientService;
import com.hongsi.purchbook.service.PurchIngSerivce;
import com.hongsi.purchbook.vo.PurchIngVO;
import com.hongsi.purchshop.service.PurchOrderService;
import com.hongsi.purchshop.service.PurchProductService;
import com.hongsi.purchshop.service.PurchSaleService;
import com.hongsi.purchshop.vo.PurchOrderVO;
import com.hongsi.purchshop.vo.PurchProductVO;
import com.hongsi.purchshop.vo.PurchSaleVO;

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
	
	@Autowired
	@Qualifier("purchSaleServiceImpl")
	private PurchSaleService purchSaleService;
	
	@Autowired
	@Qualifier("purchOrderServiceImpl")
	private PurchOrderService purchOrderService;
	
	@Autowired
	@Qualifier("purchProductServiceImpl")	
	private PurchProductService purchProductService;
	
	// --------------------------------------- 재료 구매 -----------------------------------------------
	
	@GetMapping("view/buyModify.do")
	public String buyModify(PurchIngVO vo, Model model) {
		log.info(".............................buyModify..");

		// 재료 list
		model.addAttribute("ingreList", ingredientService.list());

		// 재료 구매한 정보
		vo.setStatus("purch");
		model.addAttribute("buyInfo", purchIngSerivce.selectBuyStorageInfoByCno(vo));
		return "view/buyModify";
	}

	// 재료 구매 삭제 처리
	@ResponseBody
	@PostMapping("view/buyDelete.do")
	public String buyDelete(PurchIngVO vo) {
		log.info(".............................buyDelete..");
		vo.setStatus("purch");
		int result = purchIngSerivce.deleteBuyStorageInfoByCno(vo);
		if (result == 1) {
			return "ok";
		}
		return "";
	}

	// 재료 구매 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/buyUpdate.do")
	public String buyUpdate(PurchIngVO vo) {
		log.info(".............................buyUpdate..vo:" + vo);
		vo.setFlag(2);
		int result = purchIngSerivce.updateBuyInfoByCno(vo);
		log.info("............................result:"+result); 
		if (result==1) {
			purchIngSerivce.insertBuyTrace(vo); 
			return "ok"; 
		}
		return "fail";
	}
	
	
	// --------------------------------------- 재료 입출고 -----------------------------------------------
	
	@GetMapping("view/storageModify.do")
	public String storageModify(PurchIngVO vo, Model model) {
		log.info(".............................storageModify..cno:"+vo);
		
		// 재료 list
		model.addAttribute("ingreList", ingredientService.list());
		
		// 재료 입출고한 정보
		vo.setStatus("storage");
		model.addAttribute("storageInfo", purchIngSerivce.selectBuyStorageInfoByCno(vo));
		return "view/storageModify";
	}

	// 재료 입출고 삭제 처리
	@ResponseBody
	@PostMapping("view/storageDelete.do")
	public String storageDelete(PurchIngVO vo) {
		vo.setStatus("storage");
		log.info(".............................storageDelete..vo:"+vo);
		int result = purchIngSerivce.deleteBuyStorageInfoByCno(vo);
		if (result == 1) {
			return "ok";
		}
		return "";
	}

	// 재료 입출고 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/storageUpdate.do")
	public String storageUpdate(PurchIngVO vo) {
		log.info(".............................storageUpdate..vo:" + vo);
		vo.setFlag(2);

		int result = purchIngSerivce.updateStorageInfoByCno(vo);
		log.info("............................result:"+result); 
		if (result==1) {
			purchIngSerivce.insertStorageTrace(vo); 
			return "ok"; 
		}
		return "fail";
	}
	
	
	// --------------------------------------- 생산 -----------------------------------------------
	
	// 생산 정보
	@GetMapping("view/productModify.do")
	public String productModify(int cno, Model model) {
		log.info(".............................productModify..");
		model.addAttribute("productInfo", purchProductService.selectProductInfoByCno(cno));
		return "view/productModify";
	}

	// 주문 삭제 처리
	@ResponseBody
	@PostMapping("view/productDelete.do")
	public String productDelete(int cno) {
		log.info(".............................productDelete..");
		int result = purchProductService.deleteProductInfoByCno(cno);
		if (result == 1) {
			return "ok";
		}
		return "";
	}

	// 주문 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/productUpdate.do")
	public String productUpdate(PurchProductVO vo) {
		log.info(".............................productUpdate..vo:" + vo);
		vo.setFlag(2);
//		int result = purchProductService.updateProductInfoByCno(vo);	
//		log.info("............................result1:"+result);
//		result = purchProductService.insertTrace(vo);
//		log.info("............................result2:"+result);
//		return "ok";

		 int result = purchProductService.updateProductInfoByCno(vo);
		 log.info("............................result:"+result); 
		 if (result==1) {
//			 purchProductService.insertTrace(vo); 
			 return "ok"; 
		 }
		 return "fail";
	}
	

	// --------------------------------------- 주문 -----------------------------------------------
	
	@GetMapping("view/orderModify.do")
	public String orderModify(int cno, Model model) {
		log.info(".............................orderModify..");
		// 재료 list
		model.addAttribute("ingreList", ingredientService.list());
		// 재료 구매한 정보
		model.addAttribute("orderInfo", purchOrderService.selectOrderInfoByCno(cno));
		return "view/orderModify";
	}

	// 주문 삭제 처리
	@ResponseBody
	@PostMapping("view/orderDelete.do")
	public String orderDelete(int cno) {
		log.info(".............................orderDelete..");
		int result = purchOrderService.deleteOrderInfoByCno(cno);
		if (result == 1) {
			return "ok";
		}
		return "";
	}

	// 주문 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/orderUpdate.do")
	public String orderUpdate(PurchOrderVO vo) {
		log.info(".............................orderUpdate..vo:" + vo);
		vo.setFlag(2);
//		int result = purchOrderService.updateOrderInfoByCno(vo);	
//		log.info("............................result1:"+result);
//		result = purchOrderService.insertTrace(vo);
//		log.info("............................result2:"+result);
//		return "ok";

		 int result = purchOrderService.updateOrderInfoByCno(vo);
		 log.info("............................result:"+result); 
		 if (result==1) {
//			 purchOrderService.insertTrace(vo); 
			 return "ok"; 
		 }
		 return "fail";
	}
	
	
	// --------------------------------------- 판매 -----------------------------------------------
	
	@GetMapping("view/saleModify.do")
	public String saleModify(int cno, Model model) {
		log.info(".............................saleModify..");
		// 재료 list
		model.addAttribute("ingreList", ingredientService.list());
		// 재료 구매한 정보
		model.addAttribute("saleInfo", purchSaleService.selectSaleInfoByCno(cno));
		return "view/saleModify";
	}

	// 주문 삭제 처리
	@ResponseBody
	@PostMapping("view/saleDelete.do")
	public String saleDelete(int cno) {
		log.info(".............................saleDelete..");
		int result = purchSaleService.deleteSaleInfoByCno(cno);
		if (result == 1) {
			return "ok";
		}
		return "";
	}

	// 주문 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/saleUpdate.do")
	public String saleUpdate(PurchSaleVO vo) {
		log.info(".............................saleUpdate..vo:" + vo);
		vo.setFlag(2);
//		int result = purchSaleService.updateSaleInfoByCno(vo);	
//		log.info("............................result1:"+result);
//		result = purchSaleService.insertTrace(vo);
//		log.info("............................result2:"+result);
//		return "ok";

		 int result = purchSaleService.updateSaleInfoByCno(vo);
		 log.info("............................result:"+result); 
		 if (result==1) {
//			 purchSaleService.insertTrace(vo); 
			 return "ok"; 
		 }
		 return "fail";
	}	

}
