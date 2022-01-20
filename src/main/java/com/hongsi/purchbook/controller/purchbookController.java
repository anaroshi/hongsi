package com.hongsi.purchbook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hongsi.purchbook.service.PurchbookSerivce;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("purchbook")
@Log4j
public class purchbookController {
	
	private final String MODULE = "purchbook";
	
	@Autowired
	@Qualifier("purchbookSerivceImpl")
	private PurchbookSerivce purchbookSerivce;
	
	@GetMapping("list.do")
	public String list() {
		log.info(".............................purchbookController..");
		return MODULE + "/list";
	}
	
	@GetMapping("buy.do")
	public String buy() {
		log.info(".............................purchbookController..buy");
		return MODULE + "/buy";
	}

}
