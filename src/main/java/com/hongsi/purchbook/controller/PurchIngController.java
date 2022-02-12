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
import com.hongsi.purchbook.service.PurchIngSerivce;
import com.hongsi.purchbook.vo.PurchIngVO;
import com.hongsi.quantity.service.QuantityService;

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
	public String buy(Model model) {
		log.info(".............................purchbookController..buy");
		model.addAttribute("ingreList", ingredientService.list());
		model.addAttribute("resultList", quantityService.selectTotalNeedFinal());
		model.addAttribute("buyList", purchIngSerivce.selectNonInDate());
		return MODULE + "/buy";
	}
/*
 * 
	// 카페 재고량
	SELECT A.ITEM, (NVL(A.SUMINCONTENT,0) - NVL(B.SUMOUTCONTENT,0) ) SUMCAFECONTENT
	FROM 
	(SELECT ITEM, SUM( NVL(CONTENT,0)) SUMINCONTENT FROM PURCH_ING
	WHERE STATUS = 'storage'
	AND GUBUNCODE = 'in' 
	AND GUBUN = '입고_cafe'
	GROUP BY ITEM) A
	FULL OUTER JOIN 
	( SELECT ITEM, SUM( NVL(CONTENT,0)) SUMOUTCONTENT FROM PURCH_ING
	WHERE  STATUS = 'storage'
	AND GUBUNCODE = 'out' 
	AND GUBUN = '입고_cafe'
	GROUP BY ITEM) B
	ON A.ITEM = B.ITEM ;
	
	// 해당 주 필요량
	SELECT N.CODE, N.KNAME,
			N.ORINEED, N.ERLNEED, N.SNSNEED, (NVL(N.ORINEED, 0) + NVL(N.ERLNEED, 0) + NVL(N.SNSNEED, 0)) NEEDSUM
			FROM 
			(
				SELECT  ING_ORI_ERL.CODE CODE, ING_ORI_ERL.KNAME KNAME, 
				ING_ORI_ERL.ORI_QTY, ING_ORI_ERL.ORISUM, ING_ORI_ERL.ORINEED ORINEED,
				ING_ORI_ERL.ERL_QTY, ING_ORI_ERL.ERLSUM, ING_ORI_ERL.ERLNEED ERLNEED,
				NVL(SNS.SNS_QTY,0) SNS_QTY, NVL(SNS.SNSSUM,0) SNSSUM, NVL(SNS.SNSNEED,0) SNSNEED
				FROM 
				(
					SELECT  ING_ORI.CODE, ING_ORI.KNAME, ING_ORI.ORI_IGT_CODE ORI_IGT_CODE, ING_ORI.ORI_QTY ORI_QTY, ING_ORI.ORISUM ORISUM, ING_ORI.ORINEED ORINEED,
					ERL.ERL_IGT_CODE ERL_IGT_CODE, NVL(ERL.ERL_QTY,0) ERL_QTY, NVL(ERL.ERLSUM,0) ERLSUM, NVL(ERL.ERLNEED,0) ERLNEED
					FROM 
					(	SELECT  ING.CODE, ING.KNAME, NVL(ORI.ORI_IGT_CODE,'') 
								ORI_IGT_CODE, NVL(ORI.ORI_QTY,0) ORI_QTY, 
								NVL(ORI.ORISUM,0) ORISUM, NVL(ORI.ORINEED,0) ORINEED
						FROM 
						(	<!-- 재료 정보 (재료코드, 한글명, 영문명) -->
							SELECT  CODE, KNAME, ENAME FROM INGREDIENT
						) ING
						LEFT OUTER JOIN 
						(
							SELECT QTY.IGT_CODE ORI_IGT_CODE, QTY.QTY ORI_QTY, PURCH.ORISUM, (QTY.QTY * (PURCH.ORISUM/100)) ORINEED
							FROM 
							(
								SELECT IGT_CODE, QTY FROM QUANTITY 
								WHERE 1=1
								AND NAME ='ORI_100'
								ORDER BY IGT_CODE
							) QTY
							, 
							( 	
								SELECT 
									(NVL(SUM(ORI_250),0)*200)+(NVL(SUM(ORI_500),0)*500)+(NVL(SUM(ORI_1000),0)*1000) ORISUM
								FROM PURCH_ORDER
								WHERE 1=1
								AND ORDERDATE 
								BETWEEN TRUNC(SYSDATE, 'IW')-1 AND TRUNC(SYSDATE, 'IW')+5
							) PURCH
						) ORI
						ON ING.CODE = ORI.ORI_IGT_CODE
					) ING_ORI
					LEFT OUTER JOIN 
					(	<!-- ERL 1주간 주문량과 재료량 ERL_IGT_CODE:재료코드, ERLSUM: 주문량,  ERLNEED: 주문량에 의한 재료량 -->
						SELECT QTY.IGT_CODE ERL_IGT_CODE, QTY.QTY ERL_QTY, PURCH.ERLSUM, (QTY.QTY * PURCH.ERLSUM/100) ERLNEED
						FROM 
						(	<!-- ERL_100 기본량 -->
							SELECT IGT_CODE , QTY FROM QUANTITY 
							WHERE 1=1
							AND NAME ='ERL_100'
							ORDER BY IGT_CODE
						) QTY, 
						( 	<!-- 1주간 주문량 -->
							SELECT 
							(NVL(SUM(ERL_250),0)*200)+(NVL(SUM(ERL_500),0)*500)+(NVL(SUM(ERL_1000),0)*1000) ERLSUM
							FROM PURCH_ORDER
							WHERE 1=1
							AND ORDERDATE BETWEEN TRUNC(SYSDATE, 'IW')-1 AND TRUNC(SYSDATE, 'IW')+5
						) PURCH
					) ERL
					ON ING_ORI.CODE = ERL.ERL_IGT_CODE	
				) ING_ORI_ERL
				LEFT OUTER JOIN 
				(
					SELECT QTY.IGT_CODE SNS_IGT_CODE, QTY.QTY SNS_QTY, PURCH.SNSSUM, (QTY.QTY * PURCH.SNSSUM/100) SNSNEED
					FROM 
					(
						SELECT IGT_CODE, QTY FROM QUANTITY 
						WHERE 1=1
						AND NAME ='SNS_100'
					) QTY, 
					( 
						SELECT 
							(NVL(SUM(SNS_250),0)*200)+(NVL(SUM(SNS_500),0)*500)+(NVL(SUM(SNS_1000),0)*1000) SNSSUM
						FROM PURCH_ORDER
						WHERE 1=1
						AND ORDERDATE BETWEEN TRUNC(SYSDATE, 'IW')-1 AND TRUNC(SYSDATE, 'IW')+5
					) PURCH
				) SNS
				ON ING_ORI_ERL.CODE=SNS.SNS_IGT_CODE
			) N;
			
			
			
			
	
	// 해당 주 필요량
	
SELECT 	NEED.CODE, NEED.KNAME, NEED.ORINEED, NEED.ERLNEED, NEED.SNSNEED, NEED.NEEDSUM, CAFE.SUMCAFECONTENT
FROM 
(
	SELECT N.CODE, N.KNAME,
			N.ORINEED, N.ERLNEED, N.SNSNEED, (NVL(N.ORINEED, 0) + NVL(N.ERLNEED, 0) + NVL(N.SNSNEED, 0)) NEEDSUM
			FROM 
			(
				SELECT  ING_ORI_ERL.CODE CODE, ING_ORI_ERL.KNAME KNAME, 
				ING_ORI_ERL.ORI_QTY, ING_ORI_ERL.ORISUM, ING_ORI_ERL.ORINEED ORINEED,
				ING_ORI_ERL.ERL_QTY, ING_ORI_ERL.ERLSUM, ING_ORI_ERL.ERLNEED ERLNEED,
				NVL(SNS.SNS_QTY,0) SNS_QTY, NVL(SNS.SNSSUM,0) SNSSUM, NVL(SNS.SNSNEED,0) SNSNEED
				FROM 
				(
					SELECT  ING_ORI.CODE, ING_ORI.KNAME, ING_ORI.ORI_IGT_CODE ORI_IGT_CODE, ING_ORI.ORI_QTY ORI_QTY, ING_ORI.ORISUM ORISUM, ING_ORI.ORINEED ORINEED,
					ERL.ERL_IGT_CODE ERL_IGT_CODE, NVL(ERL.ERL_QTY,0) ERL_QTY, NVL(ERL.ERLSUM,0) ERLSUM, NVL(ERL.ERLNEED,0) ERLNEED
					FROM 
					(	SELECT  ING.CODE, ING.KNAME, NVL(ORI.ORI_IGT_CODE,'') 
								ORI_IGT_CODE, NVL(ORI.ORI_QTY,0) ORI_QTY, 
								NVL(ORI.ORISUM,0) ORISUM, NVL(ORI.ORINEED,0) ORINEED
						FROM 
						(	<!-- 재료 정보 (재료코드, 한글명, 영문명) -->
							SELECT  CODE, KNAME, ENAME FROM INGREDIENT
						) ING
						LEFT OUTER JOIN 
						(
							SELECT QTY.IGT_CODE ORI_IGT_CODE, QTY.QTY ORI_QTY, PURCH.ORISUM, (QTY.QTY * (PURCH.ORISUM/100)) ORINEED
							FROM 
							(
								SELECT IGT_CODE, QTY FROM QUANTITY 
								WHERE 1=1
								AND NAME ='ORI_100'
								ORDER BY IGT_CODE
							) QTY
							, 
							( 	
								SELECT 
									(NVL(SUM(ORI_250),0)*200)+(NVL(SUM(ORI_500),0)*500)+(NVL(SUM(ORI_1000),0)*1000) ORISUM
								FROM PURCH_ORDER
								WHERE 1=1
								AND ORDERDATE 
								BETWEEN TRUNC(SYSDATE, 'IW')-1 AND TRUNC(SYSDATE, 'IW')+5
							) PURCH
						) ORI
						ON ING.CODE = ORI.ORI_IGT_CODE
					) ING_ORI
					LEFT OUTER JOIN 
					(	<!-- ERL 1주간 주문량과 재료량 ERL_IGT_CODE:재료코드, ERLSUM: 주문량,  ERLNEED: 주문량에 의한 재료량 -->
						SELECT QTY.IGT_CODE ERL_IGT_CODE, QTY.QTY ERL_QTY, PURCH.ERLSUM, (QTY.QTY * PURCH.ERLSUM/100) ERLNEED
						FROM 
						(	<!-- ERL_100 기본량 -->
							SELECT IGT_CODE , QTY FROM QUANTITY 
							WHERE 1=1
							AND NAME ='ERL_100'
							ORDER BY IGT_CODE
						) QTY, 
						( 	<!-- 1주간 주문량 -->
							SELECT 
							(NVL(SUM(ERL_250),0)*200)+(NVL(SUM(ERL_500),0)*500)+(NVL(SUM(ERL_1000),0)*1000) ERLSUM
							FROM PURCH_ORDER
							WHERE 1=1
							AND ORDERDATE BETWEEN TRUNC(SYSDATE, 'IW')-1 AND TRUNC(SYSDATE, 'IW')+5
						) PURCH
					) ERL
					ON ING_ORI.CODE = ERL.ERL_IGT_CODE	
				) ING_ORI_ERL
				LEFT OUTER JOIN 
				(
					SELECT QTY.IGT_CODE SNS_IGT_CODE, QTY.QTY SNS_QTY, PURCH.SNSSUM, (QTY.QTY * PURCH.SNSSUM/100) SNSNEED
					FROM 
					(
						SELECT IGT_CODE, QTY FROM QUANTITY 
						WHERE 1=1
						AND NAME ='SNS_100'
					) QTY, 
					( 
						SELECT 
							(NVL(SUM(SNS_250),0)*200)+(NVL(SUM(SNS_500),0)*500)+(NVL(SUM(SNS_1000),0)*1000) SNSSUM
						FROM PURCH_ORDER
						WHERE 1=1
						AND ORDERDATE BETWEEN TRUNC(SYSDATE, 'IW')-1 AND TRUNC(SYSDATE, 'IW')+5
					) PURCH
				) SNS
				ON ING_ORI_ERL.CODE=SNS.SNS_IGT_CODE
			) N
) NEED
LEFT JOIN
(
// 카페 재고량
	SELECT A.ITEM, (NVL(A.SUMINCONTENT,0) - NVL(B.SUMOUTCONTENT,0) ) SUMCAFECONTENT
	FROM 
	(SELECT ITEM, SUM( NVL(CONTENT,0)) SUMINCONTENT FROM PURCH_ING
	WHERE STATUS = 'storage'
	AND GUBUNCODE = 'in' 
	AND GUBUN = '입고_cafe'
	GROUP BY ITEM) A
	FULL OUTER JOIN 
	( SELECT ITEM, SUM( NVL(CONTENT,0)) SUMOUTCONTENT FROM PURCH_ING
	WHERE  STATUS = 'storage'
	AND GUBUNCODE = 'out' 
	AND GUBUN = '입고_cafe'
	GROUP BY ITEM) B
	ON A.ITEM = B.ITEM
) CAFE
ON NEED.CODE = CAFE.ITEM
	
	
*/	
	
	// 재료구매 저장
	@PostMapping("buy.do")
	public String insertIng(PurchIngVO vo, RedirectAttributes rttr) {
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
	public String buyAllList(Model model) {
		log.info(".............................buyList..buy");
		model.addAttribute("resultList", purchIngSerivce.list());
		return MODULE + "/buyAllList";
	}

	@GetMapping("stockList.do")
	public String selectIgdTotalList(Model model) {
		log.info(".............................purchbookController..buy");
		model.addAttribute("ingreTotalList", purchIngSerivce.selectIgdTotalList());
		return MODULE + "/stockList";
	}
	
	// 입고일 저장
	@PostMapping("inDateSave.do")
	public String updateInDate(PurchIngVO vo, RedirectAttributes rttr) {
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
	public String storage(Model model) {
		log.info(".............................buyList..buy");
		// 재료 리스트 (select)
		model.addAttribute("ingreList", ingredientService.list());
		// 재료 재고
		//model.addAttribute("ingreTotalList", purchIngSerivce.selectIgdTotalList());
		model.addAttribute("ingreTotalList", purchIngSerivce.selectNeedCafe());
		// 재료 입출고 리스트
		model.addAttribute("resultList", purchIngSerivce.selectStorageInOut());
		//
		return MODULE + "/storage";
	}
	
	// 재료 입출고 저장
	@PostMapping("storage.do")
	public String insertStorage(PurchIngVO vo, RedirectAttributes rttr) {		
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
	public String storageAllList(Model model) {
		log.info(".............................storageAllList..");
		// 재료 입출고 리스트
		model.addAttribute("resultList", purchIngSerivce.selectStorageInOut());
		return MODULE + "/storageAllList";
	}

}
