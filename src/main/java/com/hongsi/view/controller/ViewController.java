package com.hongsi.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hongsi.ingredient.service.IngredientService;
import com.hongsi.purchbook.service.PurchIngSerivce;
import com.hongsi.purchbook.vo.PurchIngVO;
import com.hongsi.purchpack.service.PurchPackService;
import com.hongsi.purchshop.service.PurchOrderService;
import com.hongsi.purchshop.service.PurchOutputService;
import com.hongsi.purchshop.service.PurchProductService;
import com.hongsi.purchshop.service.PurchSaleService;
import com.hongsi.purchshop.vo.PurchOrderVO;
import com.hongsi.purchshop.vo.PurchOutputVO;
import com.hongsi.purchshop.vo.PurchProductVO;
import com.hongsi.purchshop.vo.PurchSaleVO;
import com.hongsi.util.PageObject;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ViewController {

	@Autowired
	@Qualifier("purchIngSerivceImpl")
	private PurchIngSerivce purchIngSerivce;
	
	@Autowired
	@Qualifier("purchPackSerivceImpl")
	private PurchPackService purchpackSerivce;

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

	@Autowired
	@Qualifier("purchOutputServiceImpl")	
	private PurchOutputService purchOutputService;
	
	// --------------------------------------- 재료 구매 -----------------------------------------------
	
	// 재료 구매 정보 보기 (재료구매에서)
	@GetMapping("view/buyModify.do")
	public String buyModify(PurchIngVO vo, Model model, @ModelAttribute PageObject object) throws Exception {
		log.info(".............................buyModify..vo:"+vo);
		log.info(".............................buyModify..object:"+object);
		log.info(".............................buyModify..locate:"+vo.getLocate());

		// 재료 list
		model.addAttribute("ingreList", ingredientService.list());

		// 재료 구매한 정보
		vo.setStatus("purch");
		model.addAttribute("buyInfo", purchIngSerivce.selectBuyStorageInfoByCno(vo));
		model.addAttribute("locate", vo.getLocate()); // 1 : buy.jsp, 2:buyAllList.jsp, 3:ingAllList.jsp
		return "view/buyModify";
	}

	// 재료 구매 삭제 처리
	@ResponseBody
	@PostMapping("view/buyDelete.do")
	public String buyDelete(PurchIngVO vo) throws Exception {
		log.info(".............................buyDelete..");
		vo.setStatus("purch");
		
		int result = purchIngSerivce.deleteIng(vo);
		log.info(".............................buyDelete..result:"+result);
		if (result == 1) {
			return "ok";
		}
		return "";
	}

	// 재료 구매 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/buyUpdate.do")
	public String buyUpdate(PurchIngVO vo, PageObject object) throws Exception {
		log.info(".............................buyUpdate..vo:" + object);
		vo.setFlag(2);
		vo.setStatus("purch");
		int result = purchIngSerivce.updateIng(vo);
		log.info("............................result:"+result); 
		if (result==1) {
			 if (vo.getLocate()==1) {
				 return "ok1";
			 } else if (vo.getLocate()==2) {
				 return "ok2";
			 } else {
				 return "ok3";
			 }
		}
		return "fail";
	}
	
	
	// --------------------------------------- 부자재 구매 -----------------------------------------------
	
	// 부자재 구매 정보 보기 (부자재에서)
	@GetMapping("view/packModify.do")
	public String packModify(PurchIngVO vo, Model model, @ModelAttribute PageObject object) throws Exception {
		log.info(".............................packModify..vo:"+vo);
		log.info(".............................packModify..object:"+object);
		log.info(".............................packModify..locate:"+vo.getLocate());
		
		// 부자재 list
		//model.addAttribute("ingreList", ingredientService.list());
		
		// 부자재 구매한 정보
		//model.addAttribute("packInfo", purchpackSerivce.selectPackInfoByCno(vo));
		//model.addAttribute("locate", vo.getLocate()); // 1 : pack.jsp, 2:packAllList.jsp, 3:ingAllList.jsp
		return "view/packModify";
	}
	
	// 부자재 구매 삭제 처리
	@ResponseBody
	@PostMapping("view/packDelete.do")
	public String packDelete(PurchIngVO vo) throws Exception {
		log.info(".............................packDelete..");
		//vo.setStatus("purch");
		
//		int result = purchpackSerivce.deletePack(vo);
		int result = 1;
		log.info(".............................packDelete..result:"+result);
		if (result == 1) {
			return "ok";
		}
		return "";
	}
	
	// 부자재 구매 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/packUpdate.do")
	public String packUpdate(PurchIngVO vo, PageObject object) throws Exception {
		log.info(".............................packUpdate..vo:" + object);
//		vo.setFlag(2);
//		vo.setStatus("purch");
//		int result = purchpackSerivce.updatePack(vo);
		int result = 1;
		log.info("............................result:"+result); 
		if (result==1) {
			return "ok1";
		}
		return "fail";
	}
	
	
	// --------------------------------------- 재료 입출고 -----------------------------------------------
	
	// 재료 입출고 정보 보기 (재료 입출고에서)
	@GetMapping("view/storageModify.do") 
	public String storageModify(PurchIngVO vo, Model model, @ModelAttribute PageObject object) throws Exception {
		log.info(".............................storageModify..cno:"+vo);
		
		// 재료 list
		model.addAttribute("ingreList", ingredientService.list());
		
		// 재료 입출고한 정보
		vo.setStatus("storage");
		model.addAttribute("storageInfo", purchIngSerivce.selectBuyStorageInfoByCno(vo));
		model.addAttribute("locate", vo.getLocate()); // 1 : storage.jsp, 2:storageAllList.jsp, 3:ingAllList.jsp
		return "view/storageModify";
	}

	// 재료 입출고 삭제 처리
	@ResponseBody
	@PostMapping("view/storageDelete.do")
	public String storageDelete(PurchIngVO vo) throws Exception {
		vo.setStatus("storage");
		log.info(".............................storageDelete..vo:"+vo);
		int result = purchIngSerivce.deleteIng(vo);
		log.info(".............................storageDelete..result:"+result);
		if (result == 1) {
			return "ok";
		}
		return "";
	}

	// 재료 입출고 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/storageUpdate.do")
	public String storageUpdate(PurchIngVO vo, PageObject object) throws Exception {
		log.info(".............................storageUpdate..vo:" + vo);
		vo.setQty(1);
		vo.setStatus("storage");
		vo.setFlag(2);
		
		int result = purchIngSerivce.updateIng(vo);
		log.info("............................result:"+result); 
		if (result==1) {
			 if (vo.getLocate()==1) {
				 return "ok1";
			 } else if (vo.getLocate()==2) {
				 return "ok2";
			 } else {
				 return "ok3";
			 }
		}
		return "fail";
	}
	
	
	// --------------------------------------- 생산 -----------------------------------------------
	
	// 생산 정보
	@GetMapping("view/productModify.do")
	public String productModify(int cno, int locate, Model model) throws Exception {
		log.info(".............................productModify..");
		model.addAttribute("productInfo", purchProductService.selectProductInfoByCno(cno));
		model.addAttribute("locate", locate);
		return "view/productModify";
	}

	// 생산 삭제 처리
	@ResponseBody
	@PostMapping("view/productDelete.do")
	public String productDelete(PurchProductVO vo) throws Exception {
		log.info(".............................productDelete..");
		int result = purchProductService.deleteProductInfoByCno(vo.getCno());
		if (result == 1) {
			if (vo.getLocate()==1) {
				return "ok1";
			} else {
				return "ok2";
			}			
		}
		return "";
	}

	// 생산 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/productUpdate.do")
	public String productUpdate(PurchProductVO vo, PageObject object) throws Exception {
		log.info(".............................productUpdate..vo:" + vo);
		vo.setStatus("product");
		vo.setFlag(2);

		int result = purchProductService.updateProductInfoByCno(vo);
		log.info(".........................productUpdate...result:"+result); 
		if (result==1) {
			 if (vo.getLocate()==1) {
				 return "ok1";
			 } else {
				 return "ok2";
			 }
		}
		return "fail";
	}
	

	// --------------------------------------- 주문 -----------------------------------------------
	
	@GetMapping("view/orderModify.do")
	public String orderModify(int cno, int locate, Model model) throws Exception {
		log.info(".............................orderModify..locate : "+locate);
		// 재료 list
		model.addAttribute("ingreList", ingredientService.list());
		// 재료 구매한 정보
		model.addAttribute("orderInfo", purchOrderService.selectOrderInfoByCno(cno));
		model.addAttribute("locate", locate);
		return "view/orderModify";
	}

	// 주문 삭제 처리
	@ResponseBody
	@PostMapping("view/orderDelete.do")
	public String orderDelete(PurchOrderVO vo) throws Exception {
		log.info(".............................orderDelete..vo:"+vo);
		int result = purchOrderService.deleteOrderInfoByCno(vo.getCno());
		
		log.info(".............................orderDelete..result:" + result);
		if (result==1) {			 
			if (vo.getLocate()==1) {
				return "ok1";
			} else {
				return "ok2";
			}			
		}
		return "fail";
	}

	// 주문 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/orderUpdate.do")
	public String orderUpdate(PurchOrderVO vo, PageObject object) throws Exception {
		log.info(".............................orderUpdate..vo:" + vo);
		vo.setStatus("product");
		vo.setFlag(2);

		 int result = purchOrderService.updateOrderInfoByCno(vo);
		 log.info("............................result:"+result); 
		 if (result==1) {
			 if (vo.getLocate()==1) {
				 return "ok1";
			 } else {
				 return "ok2";
			 }
		 }
		 return "fail";
	}
	
	
	// --------------------------------------- 판매 -----------------------------------------------
	
	@GetMapping("view/saleModify.do")
	public String saleModify(int cno, int locate, Model model) throws Exception {
		log.info(".............................saleModify..");
		// 재료 list
		model.addAttribute("ingreList", ingredientService.list());
		// 재료 구매한 정보
		model.addAttribute("saleInfo", purchSaleService.selectSaleInfoByCno(cno));
		model.addAttribute("locate", locate);
		return "view/saleModify";
	}

	// 주문 삭제 처리
	@ResponseBody
	@PostMapping("view/saleDelete.do")
	public String saleDelete(PurchSaleVO vo) throws Exception {
		log.info(".............................saleDelete..");
		int result = purchSaleService.deleteSaleInfoByCno(vo.getCno());
		if (result==1) {
			 if (vo.getLocate()==1) {
				 return "ok1";
			 } else {
				 return "ok2";
			 }
		 }
		 return "fail";
	}

	// 주문 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/saleUpdate.do")
	public String saleUpdate(PurchSaleVO vo, PageObject object) throws Exception {
		log.info(".............................saleUpdate..vo:" + vo);
		vo.setStatus("sale");
		vo.setFlag(2);

		int result = purchSaleService.updateSaleInfoByCno(vo);
		log.info("............................result:"+result); 
		if (result==1) {
			 if (vo.getLocate()==1) {
				 return "ok1";
			 } else {
				 return "ok2";
			 }
		 }
		 return "fail";
	}		

	// --------------------------------------- M생산 -----------------------------------------------
	
	// M생산 정보
	@GetMapping("view/outputModify.do")
	public String outputModify(int cno, int locate, Model model) throws Exception {
		log.info(".............................outputModify..");
		model.addAttribute("outputInfo", purchOutputService.selectOutputInfoByCno(cno));
		model.addAttribute("locate", locate);
		return "view/outputModify";
	}

	// M생산 삭제 처리
	@ResponseBody
	@PostMapping("view/outputDelete.do")
	public String outputDelete(PurchOutputVO vo) throws Exception {
		log.info(".............................outputDelete..");
		int result = purchOutputService.deleteOutputInfoByCno(vo.getCno());
		if (result == 1) {
			if (vo.getLocate()==1) {
				return "ok1";
			} else {
				return "ok2";
			}			
		}
		return "";
	}

	// M생산 수정 처리
	@Nullable  // null 허용
	@ResponseBody
	@PostMapping("view/outputUpdate.do")
	public String outputUpdate(PurchOutputVO vo, PageObject object) throws Exception {
		log.info(".............................outputUpdate..vo:" + vo);
		vo.setStatus("output");
		vo.setFlag(2);

		int result = purchOutputService.updateOutputInfoByCno(vo);
		log.info(".........................outputUpdate...result:"+result); 
		if (result==1) {
			 if (vo.getLocate()==1) {
				 return "ok1";
			 } else {
				 return "ok2";
			 }
		}
		return "fail";
	}
}
