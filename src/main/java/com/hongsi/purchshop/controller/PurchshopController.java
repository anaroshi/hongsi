package com.hongsi.purchshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("purchshop")
@Log4j
public class PurchshopController {

	private final String MODULE = "purchshop";

	@GetMapping("list.do")
	public String list() {
		log.info(".............................PurchshopController..");
		return MODULE + "/list";
	}

	
}
