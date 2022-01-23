package com.hongsi.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hongsi.purchbook.service.PurchbookSerivce;
import com.hongsi.purchbook.vo.PurchbookVO;
import com.hongsi.quantity.service.QuantityService;
import com.hongsi.quantity.vo.QuantityVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("main")
@Log4j
public class MainController {
	
	@Autowired
	@Qualifier("purchbookSerivceImpl")
	private PurchbookSerivce purchbookSerivce;
	
	@Autowired
	@Qualifier("quantityServiceImpl")
	private QuantityService quantityService;
	
//	@GetMapping("main.do")
//	public String main() {
//		log.info("------------- main page");
//		return "main/main";
//	}
	
	@GetMapping("main.do")
	public String selectIgdTotalList(Model model) {
		log.info(".............................selectIgdTotalList..");
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<QuantityVO> list = quantityService.selectItemQty("ORI_100");
		map.put("oriList", list);
		list = quantityService.selectItemQty("ERL_100");
		map.put("erlList", list);
		list = quantityService.selectItemQty("SNS_100");
		map.put("snsList", list);
		
		List<PurchbookVO> vo = purchbookSerivce.selectIgdTotalList();
		map.put("totalList", vo);
		
		log.info("map:"+map);
		
		
		model.addAttribute("map", map);
		//model.addAttribute("ingreTotalList", purchbookSerivce.selectIgdTotalList());
		
		return "main/main";
	}

}
